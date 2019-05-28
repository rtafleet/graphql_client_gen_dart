import 'package:code_builder/code_builder.dart';
import 'package:graphql_client_generator/src/model/custom_scalar_map.dart';
import 'package:graphql_client_generator/src/model/field.dart' as GQLField;
import 'package:graphql_client_generator/src/model/type.dart';
import 'package:graphql_client_generator/src/utils/import_resolver.dart';
import 'package:graphql_client_generator/src/utils/schema_descriptions.dart';
import 'package:graphql_client_generator/src/utils/type_resolver.dart';
import 'package:graphql_parser/graphql_parser.dart';
import 'package:recase/recase.dart';

MethodInfo methodInfoForTypeRef(
    String fieldName,
    TypeRef type,
    String fragmentName,
    String description,
    ImportResolver importResolver,
    DirectiveGetter directiveGetter,
    CustomScalarMap customScalarMap,
    [bool isDeprecated = false,
    String deprecationReason = ""]) {
  final Map<String, Directive> requiredImports = {};
  String returnType;
  if (type.isScalar) {
    returnType = getDartTypeNameForScalar(type, customScalarMap);
  } else {
    Directive importDirective;
    if (type.isEnum) {
      returnType = type.concreteType.name;
      // add an import for this enum
      importDirective = importResolver.enumModelNamed(returnType);
    } else {
      if (type.concreteType.kind == "OBJECT" ||
          type.concreteType.kind == "INTERFACE") {
        if (fragmentName == null) {
          throw "the fragment name must be provided to generate MethodInfo for an OBJECT type. fieldName: $fieldName";
        }
        returnType = ReCase(fragmentName).pascalCase;
      } else {
        returnType = type.concreteType.name;
      }
      // add an import for this object type
      importDirective = directiveGetter(returnType);
    }
    requiredImports[returnType] = importDirective;
  }
  Reference methodReturn;
  if (type.isList) {
    requiredImports["built_value"] =
        Directive.import("package:built_value/built_value.dart");
    requiredImports["built_collection"] =
        Directive.import("package:built_collection/built_collection.dart");
    methodReturn = TypeReference((b) {
      b.symbol = "BuiltList";
      b.url = "package:built_collection/built_collection.dart";
      b.types.add(refer(returnType));
    });
  } else {
    methodReturn = refer(returnType);
  }
  if (type.isNullable) {
    requiredImports["built_value"] =
        Directive.import("package:built_value/built_value.dart");
  }
  final method = Method((b) {
    if (description != null && description.isNotEmpty) {
      final lines = commentsFromDescription(description);
      b.docs.addAll(lines);
    }
    b.name = fieldName;
    b.type = MethodType.getter;
    List<Expression> annotations = [];
    if (type.isNullable) {
      annotations.add(CodeExpression(Code("nullable")));
    }
    if (isDeprecated) {
      annotations
          .add(CodeExpression(Code("Deprecated(\"$deprecationReason\")")));
    }
    b.annotations.addAll(annotations);
    b.returns = methodReturn;
  });
  bool isRequired = !type.isNullable;
  TypeRef argumentTypeRef;
  if (type.kind == "NON_NULL") {
    argumentTypeRef = type.ofType;
  } else {
    argumentTypeRef = type;
  }
  bool isAssignable;
  if (argumentTypeRef.kind == "SCALAR" ||
      argumentTypeRef.kind == "ENUM" ||
      (argumentTypeRef.kind == "INTERFACE" &&
          argumentTypeRef.name == returnType) ||
      argumentTypeRef.kind == "UNION") {
    isAssignable = true;
  } else {
    isAssignable = false;
  }
  return MethodInfo(method, requiredImports, isRequired, isAssignable);
}

bool isSelectionInterfaceImplementationFragmentReference(
    SelectionContext selection) {
  return selection.field == null && selection.fragmentSpread != null;
}

bool isSelectionFragmentReference(SelectionContext selection) {
  return selection.field != null &&
      selection.field.selectionSet != null &&
      selection.field.selectionSet.selections.length == 1 &&
      selection.field.selectionSet.selections[0].fragmentSpread != null;
}

GQLField.Field fieldForSelection(
    SelectionContext selection, TypeFull typeInfo) {
  String referenceName;
  if (selection.field.fieldName.alias != null) {
    referenceName = selection.field.fieldName.alias.name;
  } else {
    referenceName = selection.field.fieldName.name;
  }
  if (referenceName == "__typename") {
    String name = fieldNameForFieldNameContext(selection.field.fieldName);
    return GQLField.Field((b) {
      b.name = name;
      b.description =
          "A convenience field for discriminating between interface implementations";
      b.type.replace(TypeRef((b) {
        b.kind = "SCALAR";
        b.name = "String";
      }));
      b.isDeprecated = false;
      b.deprecationReason = null;
    });
  }
  final matchingField = typeInfo.fields
      .firstWhere((f) => f.name == referenceName, orElse: () => null);
  if (matchingField == null) {
    throw "type field not found. type: ${typeInfo.name} field reference: $referenceName";
  }
  return matchingField;
}

typedef Directive DirectiveGetter(String typeName);

class MethodInfo {
  final Method method;
  final Map<String, Directive> requiredImports;
  final bool isRequired;
  final bool isAssignable;

  MethodInfo(
      this.method, this.requiredImports, this.isRequired, this.isAssignable);
}

Spec partFileSpec(String fileName) {
  return Code("part '$fileName.g.dart';");
}

Map<String, Directive> standardBuiltValueImportDirectives() {
  return {
    "built_value": Directive.import("package:built_value/built_value.dart"),
    "serializer": Directive.import("package:built_value/serializer.dart"),
  };
}

bool operationHasInputs(OperationDefinitionContext operationDefinition) {
  return operationDefinition.variableDefinitions != null;
}

Parameter _methodInfoToParameter(MethodInfo mi, bool required) {
  var returnRef = mi.method.returns;
  if (returnRef is TypeReference && returnRef.symbol == "BuiltList") {
    // it's not very ergonomic to ask for a BuiltList in a factory constructor parameter, just ask for an Iterable
    returnRef = (returnRef as TypeReference).rebuild((b) {
      b.symbol = "Iterable";
    });
  } else {
    returnRef = mi.method.returns;
  }
  return Parameter((b) {
    b.named = true;
    b.name = mi.method.name;
    b.type = returnRef;
    if (required) {
      b.annotations.add(CodeExpression(Code("required")));
    }
  });
}

Class standardBuiltValueClass(
  String typeName,
  List<MethodInfo> classFields,
  List<MethodInfo> otherMembers,
  List<MethodInfo> nonNullInterfaceFields, {
  String interfaceName = null,
  List<String> unionNames = null,
  String description = null,
}) {
  final builtValueReference = TypeReference((b) {
    b.symbol = "Built";
    b.url = "package:built_value/built_value.dart";
    b.types.addAll([refer(typeName), refer("${typeName}Builder")]);
  });
  final references = <Reference>[builtValueReference];
  if (interfaceName != null) {
    references.add(refer(interfaceName));
  }
  if (unionNames != null) {
    for (var union in unionNames) {
      references.add(refer(union));
    }
  }

  final all = List<MethodInfo>.from(classFields)
    ..addAll(nonNullInterfaceFields);
  final allRequired = all.where((mi) => mi.isRequired);
  final allOthers = all.where((mi) => !mi.isRequired);

  final requiredInputs =
      allRequired.map((mi) => _methodInfoToParameter(mi, true));
  final optionalInputs =
      allOthers.map((mi) => _methodInfoToParameter(mi, false));

  return Class((b) {
    if (description != null && description.isNotEmpty) {
      final lines = commentsFromDescription(description);
      b.docs.addAll(lines);
    }
    b.name = typeName;
    b.implements.addAll(references);
    b.methods.add(Method((b) {
      b.static = true;
      b.name = "serializer";
      b.returns = TypeReference((b) {
        b.symbol = "Serializer";
        b.url = "package:built_value/serializer.dart";
        b.types.add(refer(typeName));
      });
      b.type = MethodType.getter;
      b.lambda = true;
      b.body = Code(
          "_\$${typeName.replaceRange(0, 1, typeName.substring(0, 1).toLowerCase())}Serializer");
    }));
    b.constructors.addAll([
      Constructor((b) => b..name = "_"),
      Constructor((b) {
        b.factory = true;
        b.lambda = false;
        b.optionalParameters
          ..addAll(requiredInputs)
          ..addAll(optionalInputs)
          ..add(Parameter((b) {
            b.named = true;
            b.name = "void updates(${typeName}Builder b)";
          }));
        b.body = Block((b) {
          if (all.any((mi) => mi.isRequired)) {
            // add assertions for all the required parameters to be non-null
            for (var field in all) {
              if (field.isRequired) {
                b.statements.add(Code(
                    "assert(${field.method.name} != null, \"${field.method.name} is required and must not be null\");"));
              }
            }
          }
          b.statements.add(Code("return _\$${typeName}((b) {"));
          for (var field in all) {
            if (!field.isRequired) {
              b.statements.add(Code("if (${field.method.name} != null) {"));
            }
            if (field.isAssignable) {
              b.statements
                  .add(Code("b.${field.method.name} = ${field.method.name};"));
            } else {
              b.statements.add(Code(
                  "b.${field.method.name}.replace(${field.method.name});"));
            }
            if (!field.isRequired) {
              b.statements.add(Code("}"));
            }
          }
          b.statements.add(Code("b.update(updates);"));
          b.statements.add(Code("});"));
        });
      }),
    ]);
    b.methods.addAll(classFields.map((mi) {
      return mi.method;
    }));
    b.methods.addAll(otherMembers.map((mi) {
      return mi.method;
    }));
    b.abstract = true;
  });
}

const primitiveReferences = ["int", "String", "bool", "double"];

/// if an alias is given in the [FieldNameContext] we must use it because that
/// is the JSON key name coming back over the wire. If none, is given, use
/// the actual name
String fieldNameForFieldNameContext(FieldNameContext fieldNameContext) {
  return fieldNameContext?.alias?.alias ?? fieldNameContext.name;
}

String originalDocumentForDefinition(DefinitionContext definition) {
  final originalFragmentString = definition.span.file
      .getText(definition.span.start.offset, definition.span.end.offset);
  return originalFragmentString;
}

TypeContext concreteTypeContextForTypeContext(TypeContext typeContext) {
  if (typeContext.listType != null) {
    return concreteTypeContextForTypeContext(typeContext.listType.type);
  }
  return typeContext;
}
