import 'package:code_builder/code_builder.dart';
import 'package:graphql_client_generator/src/generator/utils.dart';
import 'package:graphql_client_generator/src/model/custom_scalar_map.dart';
import 'package:graphql_client_generator/src/model/type.dart';
import 'package:graphql_client_generator/src/utils/import_resolver.dart';
import 'package:graphql_parser/graphql_parser.dart';

class InterfaceGenerator {
  final TypeFull typeInfo;
  final FragmentDefinitionContext fragmentDefinition;
  final CustomScalarMap customScalarMap;

  String get typeName => fragmentDefinition.name;

  /// Implementation Fragment Name -> Interface Name
  Map<String, String> get interfaceImplementations {
    final implementationFragmentNames = fragmentDefinition
        .selectionSet.selections
        .where((s) => s.fragmentSpread != null)
        .map((s) => s.fragmentSpread.name);
    return Map.fromIterable(implementationFragmentNames,
        key: (e) => e, value: (_) => typeName);
  }

  InterfaceGenerator(
      this.typeInfo, this.fragmentDefinition, this.customScalarMap)
      : assert(typeInfo.kind == "INTERFACE" || typeInfo.kind == "UNION");

  Library generateLibrary(ImportResolver importResolver) {
    final Map<String, Directive> includedImports = builtValueImportDirective();
    final List<Method> classFields = fragmentDefinition.selectionSet.selections
        .where((s) => s.field != null)
        .map((s) {
      String fragmentReferenceName = null;
      if (isSelectionFragmentReference(s)) {
        fragmentReferenceName =
            s.field.selectionSet.selections[0].fragmentSpread.name;
      }
      final typeRef = fieldForSelection(s, typeInfo);
      String fieldName;
      if (s.field.fieldName.alias != null) {
        fieldName = s.field.fieldName.alias.alias;
      } else {
        fieldName = s.field.fieldName.name;
      }
      final MethodInfo methodInfo = methodInfoForTypeRef(
          fieldName,
          typeRef.type,
          fragmentReferenceName,
          typeRef.description,
          importResolver,
          (typeName) => importResolver.outputModelNamed(typeName),
          customScalarMap);
      includedImports.addAll(methodInfo.requiredImports);
      return methodInfo.method;
    }).toList();

    final builderString = "${typeName}Builder";

    final rebuildMethod = Method((b) {
      b.returns = Reference(typeName);
      b.name = "rebuild";
      b.requiredParameters.add(Parameter((b) {
        b.name = "void updates($builderString b)";
      }));
    });

    final toBuilderMethod = Method((b) {
      b.returns = Reference(builderString);
      b.name = "toBuilder";
    });

    classFields.addAll([
      rebuildMethod,
      toBuilderMethod,
    ]);

    final classDef = Class((b) {
      b.name = typeName;
      b.methods.addAll(classFields);
      b.abstract = true;
      b.annotations.add(InvokeExpression.newOf(Reference("BuiltValue"), [], {
        "instantiable": literalFalse,
      }, []));
    });

    final List<Spec> libraryBodySpecs = [
      partFileSpec(typeName),
      classDef,
    ];

    final library = Library((b) {
      b.body.addAll(libraryBodySpecs);
      b.directives.addAll(includedImports.values);
    });
    return library;
  }
}
