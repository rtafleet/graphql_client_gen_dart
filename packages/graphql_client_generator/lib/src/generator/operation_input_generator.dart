import 'package:code_builder/code_builder.dart';
import 'package:graphql_client_generator/src/generator/input_generator.dart';
import 'package:graphql_client_generator/src/generator/utils.dart';
import 'package:graphql_client_generator/src/model/custom_scalar_map.dart';
import 'package:graphql_client_generator/src/model/field.dart' as GQLField;
import 'package:graphql_client_generator/src/model/input_value.dart';
import 'package:graphql_client_generator/src/model/schema.dart';
import 'package:graphql_client_generator/src/model/type.dart';
import 'package:graphql_client_generator/src/utils/import_resolver.dart';
import 'package:graphql_parser/graphql_parser.dart';
import 'package:recase/recase.dart';

/// An OperationInput is a synthesized type that only completely exists on the
/// Dart side. What we do is we take the list of variable inputs to an operation
/// document and construct an object that includes all of those variables
/// as fields. For example, here is an operation document:
///
/// query lookupPart($searchInput: GetPartsInput!, $findInput: GetPartsInput!) {
///   search: getParts(input: $searchInput) {
///     ...partsWrapperFields_search
///   }
///   find: getParts(input: $findInput) {
///     ...partsWrapperFields_find
///   }
/// }
///
/// We'll need to generate a class that has 2 fields: searchInput and findInput.
///
/// Please note that this argument list can include: INPUT_OBJECT, ENUM, and
/// SCALAR types.
///
/// As with the other generator classes, we're not worried about the generation
/// of the other object types that are referenced here. We trust that those
/// are getting built and put into their correct places seperately. We're just
/// concerned about the necessary data required to construct this single class.
class OperationInputGenerator {
  final OperationDefinitionContext operationDefinitionContext;
  final Schema schema;
  final CustomScalarMap customScalarMap;

  String get typeName =>
      "${ReCase(operationDefinitionContext.name).pascalCase}Input";

  OperationInputGenerator(
      this.operationDefinitionContext, this.schema, this.customScalarMap);

  Library generateLibrary(ImportResolver importResolver) {
    final gqlFields = operationDefinitionContext.selectionSet.selections
        .map((selectionContext) {
      return fieldForSelection(
          selectionContext,
          operationDefinitionContext.isQuery
              ? schema.fullQueryType
              : schema.fullMutationType);
    }).toList();

    final operationInputFields = operationDefinitionContext
            ?.variableDefinitions?.variableDefinitions
            ?.map((v) {
          var typeRefForVariable = _typeRefForVariable(v, schema);
          var descriptionForVariableName =
              _descriptionForVariableName(v.variable.name, gqlFields);

          return InputValue((b) {
            b.name = v.variable.name;
            b.type.replace(typeRefForVariable);
            b.description = descriptionForVariableName;
          });
        }) ??
        [];

    final synthesizedInputTypeFull = TypeFull((b) => b
      ..kind = "INPUT_OBJECT"
      ..name = typeName
      ..inputFields.addAll(operationInputFields));
    final generator =
        InputGenerator(synthesizedInputTypeFull, true, customScalarMap);
    return generator.generateLibrary(importResolver);
  }

  String _descriptionForVariableName(
      String variableName, List<GQLField.Field> gqlFields) {
    for (int i = 0; i < gqlFields.length; i++) {
      final field = gqlFields[i];
      final matchingArg = field.args
          .firstWhere((iv) => iv.name == variableName, orElse: () => null);
      if (matchingArg != null) {
        return matchingArg.description;
      }
    }
    return null;
  }

  TypeRef _typeRefForVariable(
      VariableDefinitionContext variableDefinitionContext, Schema schema) {
    return _typeRefForTypeContext(variableDefinitionContext.type, schema);
  }

  TypeRef _typeRefForTypeContext(TypeContext typeContext, Schema schema) {
    if (typeContext.listType != null) {
      final listType = TypeRef((b) => b
        ..kind = "LIST"
        ..name = null
        ..ofType = _typeRefForTypeContext(typeContext.listType.type, schema)
            .toBuilder());
      if (!typeContext.isNullable) {
        // need to wrap the list in a NON_NULL type
        return _wrapTypeRefInNonNull(listType);
      }
      return listType;
    }

    final typeName = typeContext.typeName.name;
    final fullTypeForTypeName = schema.typeForName(typeName);
    final inputType = TypeRef((b) => b
      ..kind = fullTypeForTypeName.kind
      ..name = typeContext.typeName.name);
    if (!typeContext.isNullable) {
      return _wrapTypeRefInNonNull(inputType);
    }
    return inputType;
  }

  TypeRef _wrapTypeRefInNonNull(TypeRef typeRef) {
    final nonNullType = TypeRef((b) => b
      ..kind = "NON_NULL"
      ..name = null
      ..ofType = typeRef.toBuilder());
    return nonNullType;
  }
}
