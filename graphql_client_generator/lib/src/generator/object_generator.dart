import 'package:code_builder/code_builder.dart';
import 'package:graphql_client_generator/src/generator/utils.dart';
import 'package:graphql_client_generator/src/model/custom_scalar_map.dart';
import 'package:graphql_client_generator/src/model/field.dart' as Schema;
import 'package:graphql_client_generator/src/model/type.dart';
import 'package:graphql_client_generator/src/utils/import_resolver.dart';
import 'package:graphql_parser/graphql_parser.dart';
import 'package:recase/recase.dart';

class ObjectGenerator<C extends DefinitionContext> {
  final TypeFull typeInfo;
  final C definitionContext;
  final bool addGQLMapDeserializer;
  final TypeFull interfaceType;
  final List<String> unionTypes;
  final FragmentDefinitionContext interfaceFragmentDefinitionContext;
  final String typeNameSuffix;
  final CustomScalarMap customScalarMap;

  String get fragmentName {
    String name;
    final context = definitionContext;
    if (context is FragmentDefinitionContext) {
      name = context.name;
    } else if (context is OperationDefinitionContext) {
      name = context.name;
    }

    return ReCase(name).pascalCase +
        (typeNameSuffix != null ? ReCase(typeNameSuffix).pascalCase : "");
  }

  SelectionSetContext get selectionSet {
    final context = definitionContext;
    if (context is FragmentDefinitionContext) {
      return context.selectionSet;
    } else if (context is OperationDefinitionContext) {
      return context.selectionSet;
    }
    throw "unknown selection type";
  }

  String get fileName => ReCase(fragmentName).snakeCase;

  String get fileNameWithExtension => "$fileName.dart";

  ObjectGenerator(
    this.typeInfo,
    this.definitionContext,
    this.addGQLMapDeserializer,
    this.interfaceType,
    this.unionTypes,
    this.customScalarMap, {
    this.typeNameSuffix = null,
    this.interfaceFragmentDefinitionContext = null,
  });

  Library generateLibrary(ImportResolver importResolver) {
    final Map<String, Directive> includedImports =
        standardBuiltValueImportDirectives();
    final List<Spec> libraryBodySpecs = [partFileSpec(fileName)];

    List<MethodInfo> nonNullInterfaceFields = [];
    List<ObjectFieldData> interfaceFields = [];
    if (interfaceType != null) {
      interfaceFields = interfaceFragmentDefinitionContext
          .selectionSet.selections
          .where((selection) => selection.field != null)
          .map((selection) {
        final matchingField = fieldForSelection(selection, interfaceType);
        return ObjectFieldData(selection.field, matchingField);
      }).toList();
      nonNullInterfaceFields = interfaceFields.map<MethodInfo>((f) {
        final fieldName =
            fieldNameForFieldNameContext(f.fragmentFieldContext.fieldName);
        final fieldType = f.schemaField.type;
        String referencedFragmentName = null;
        if (f.fragmentFieldContext.selectionSet != null) {
          // this field references a fragment, get its name
          referencedFragmentName = f.fragmentFieldContext.selectionSet
              .selections[0].fragmentSpread.name;
        }
        final MethodInfo methodInfo = methodInfoForTypeRef(
            fieldName,
            fieldType,
            referencedFragmentName,
            f.schemaField.description,
            importResolver,
            (typeName) => importResolver.outputModelNamed(typeName),
            customScalarMap,
            f.schemaField.isDeprecated,
            f.schemaField.deprecationReason);
        includedImports.addAll(methodInfo.requiredImports);
        return methodInfo;
      }).toList();
    }

    final includedFields = selectionSet.selections.where((selection) {
      final fieldName = fieldNameForFieldNameContext(selection.field.fieldName);
      return selection.field != null &&
          !interfaceFields.any((i) =>
              fieldNameForFieldNameContext(i.fragmentFieldContext.fieldName) ==
              fieldName);
    }).map((selection) {
      final matchingField = fieldForSelection(selection, typeInfo);
      return ObjectFieldData(selection.field, matchingField);
    });
    final List<MethodInfo> classFields = includedFields.map((f) {
      final fieldName =
          fieldNameForFieldNameContext(f.fragmentFieldContext.fieldName);
      final fieldType = f.schemaField.type;
      String referencedFragmentName = null;
      if (f.fragmentFieldContext.selectionSet != null) {
        // this field references a fragment, get its name
        referencedFragmentName = f.fragmentFieldContext.selectionSet
            .selections[0].fragmentSpread.name;
      }
      final MethodInfo methodInfo = methodInfoForTypeRef(
          fieldName,
          fieldType,
          referencedFragmentName,
          f.schemaField.description,
          importResolver,
          (typeName) => importResolver.outputModelNamed(typeName),
          customScalarMap,
          f.schemaField.isDeprecated,
          f.schemaField.deprecationReason);
      includedImports.addAll(methodInfo.requiredImports);
      return methodInfo;
    }).toList();

    final List<MethodInfo> otherMembers = [];
    if (addGQLMapDeserializer) {
      includedImports["serializers"] = importResolver.serializerImportDirective;

      final gqlDeserializerMethod = Method((b) => b
        ..static = true
        ..lambda = true
        ..returns = refer(fragmentName)
        ..name = "fromGQLMap"
        ..requiredParameters.add(Parameter((b) => b
          ..name = "data"
          ..type = TypeReference((b) => b
            ..symbol = "Map"
            ..types.addAll([refer("String"), refer("dynamic")]))))
        ..body = Code(
            "serializers.deserializeWith(${fragmentName}.serializer, data)"));
      otherMembers.add(MethodInfo(gqlDeserializerMethod, {}, false, false));
    }

    if (interfaceType != null) {
      // add this to the includedImports list
      final interfaceImport =
          importResolver.outputModelNamed(interfaceType.name);
      includedImports[interfaceType.name] = interfaceImport;
    }
    if (unionTypes != null) {
      for (var union in unionTypes) {
        final interfaceImport = importResolver.outputModelNamed(union);
        includedImports[union] = interfaceImport;
      }
    }
    final classDef = standardBuiltValueClass(
      fragmentName,
      classFields,
      otherMembers,
      nonNullInterfaceFields,
      interfaceName: interfaceType?.name,
      description: typeInfo.description,
      unionNames: unionTypes,
    );
    libraryBodySpecs.add(classDef);

    final imports = includedImports.values.toList();
    if (classFields.any((mi) => mi.isRequired) ||
        nonNullInterfaceFields.any((mi) => mi.isRequired)) {
      imports.add(Directive.import("package:meta/meta.dart"));
    }
    final library = Library((b) {
      b.body.addAll(libraryBodySpecs);
      b.directives.addAll(imports);
    });
    return library;
  }
}

class ObjectFieldData {
  final FieldContext fragmentFieldContext;
  final Schema.Field schemaField;

  ObjectFieldData(this.fragmentFieldContext, this.schemaField);
}
