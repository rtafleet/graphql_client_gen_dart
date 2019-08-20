import 'package:code_builder/code_builder.dart';
import 'package:graphql_client_generator/src/model/type.dart';
import 'package:graphql_client_generator/src/utils/schema_descriptions.dart';
import 'package:recase/recase.dart';

class EnumGenerator {
  final TypeFull typeInfo;

  String get typeName => typeInfo.name;

  EnumGenerator(this.typeInfo) : assert(typeInfo.kind == "ENUM");

  Library generateLibrary() {
    final Map<String, Directive> includedImports = Map()
      ..addAll({
        "built_value": Directive.import("package:built_value/built_value.dart"),
        "serializer": Directive.import("package:built_value/serializer.dart"),
        "built_collection":
            Directive.import("package:built_collection/built_collection.dart"),
      });
    final enumClassName = ReCase(typeInfo.name).pascalCase;
    final classDef = Class((b) {
      if (typeInfo.description != null && typeInfo.description.isNotEmpty) {
        final lines = commentsFromDescription(typeInfo.description);
        b.docs.addAll(lines);
      }
      b.name = enumClassName;
      b.extend = refer("EnumClass");
      b.methods.add(Method((b) {
        b.static = true;
        b.name = "serializer";
        b.returns = TypeReference((b) {
          b.symbol = "Serializer";
          b.types.add(refer(enumClassName));
        });
        b.type = MethodType.getter;
        b.lambda = true;
        b.body = Code("_\$${ReCase(enumClassName).camelCase}Serializer");
      }));
      b.fields.addAll(typeInfo.enumValues.map((v) {
        return Field((b) {
          if (v.description != null && v.description.isNotEmpty) {
            final lines = commentsFromDescription(v.description);
            b.docs.addAll(lines);
          }
          b.type = refer(enumClassName);
          b.static = true;
          b.modifier = FieldModifier.constant;
          b.name = v.name;
          b.assignment = Code("_\$${v.name}");
        });
      }));
      b.methods.add(Method((b) {
        b.name = "values";
        b.static = true;
        b.type = MethodType.getter;
        b.returns = TypeReference((b) {
          b.symbol = "BuiltSet";
          b.types.add(refer(enumClassName));
        });
        b.lambda = true;
        b.body = Code("_\$values");
      }));
      b.methods.add(Method((b) {
        b.static = true;
        b.returns = refer(enumClassName);
        b.name = "valueOf";
        b.requiredParameters.add(Parameter((b) {
          b.type = refer("String");
          b.name = "name";
        }));
        b.lambda = true;
        b.body = Code("_\$valueOf(name)");
      }));
      b.constructors.add(Constructor((b) {
        b.constant = true;
        b.name = "_";
        b.requiredParameters.add(Parameter((b) {
          b.type = refer("String");
          b.name = "name";
        }));
        b.initializers.add(Code("super(name)"));
      }));
    });

    final List<Spec> libraryBodySpecs = [
      Code("part '${ReCase(enumClassName).snakeCase}.g.dart';"),
      classDef,
    ];
    final library = Library((b) => b
      ..body.addAll(libraryBodySpecs)
      ..directives.addAll(includedImports.values));
    return library;
  }
}
