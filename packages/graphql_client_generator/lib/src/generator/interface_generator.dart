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

  InterfaceGenerator(this.typeInfo, this.fragmentDefinition, this.customScalarMap)
      : assert(typeInfo.kind == "INTERFACE" || typeInfo.kind == "UNION");

  Library generateLibrary(ImportResolver importResolver) {
    final Map<String, Directive> includedImports = {};
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

    final classDef = Class((b) {
      return b
        ..name = typeName
        ..methods.addAll(classFields)
        ..abstract = true;
    });

    final library = Library((b) {
      b.body.add(classDef);
      b.directives.addAll(includedImports.values);
    });
    return library;
  }
}
