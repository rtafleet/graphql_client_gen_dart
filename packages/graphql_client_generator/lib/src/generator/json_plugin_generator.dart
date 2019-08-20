import 'package:code_builder/code_builder.dart';
import 'package:graphql_parser/graphql_parser.dart';
import 'package:recase/recase.dart';

class JsonPluginGenerator {
  final String clientName;
  final String packageName;
  final List<FragmentDefinitionContext> interfaceFragmentDefinitions;

  JsonPluginGenerator(
      this.clientName, this.packageName, this.interfaceFragmentDefinitions);

  String getSerializationErrorClassName() {
    return "${ReCase(clientName).pascalCase}SerializationError";
  }

  String getBeforeDeserializeBodyString() {
    return """
if (_interfaceTypes.contains(specifiedType.root)) {
  final discriminatorValue = discriminator(object, specifiedType);
  if (discriminatorValue == null) {
    throw ${getSerializationErrorClassName()}(
        "no discriminator value found when parsing interface: \$specifiedType");
  }
  (object as Map<String, dynamic>)["\\\$"] = discriminatorValue;
}
return standardJsonPlugin.beforeDeserialize(object, specifiedType);
""";
  }

  String interfaceListString() {
    return interfaceFragmentDefinitions
        .map((f) => ReCase(f.name).pascalCase)
        .join(",");
  }

  Library generateLibrary() {
    // imports
    final List<Directive> imports = [
      Directive.import('package:built_value/serializer.dart'),
      Directive.import('package:built_value/standard_json_plugin.dart'),
      Directive.import('package:$packageName/$clientName/src/model/model.dart'),
    ];

    final discriminatorTypeDef = Code(
        "typedef String InterfaceDiscriminator(Object object, FullType specifiedType);");

    final pluginClass = Class((b) => b
      ..name = "${ReCase(clientName).pascalCase}JsonPlugin"
      ..implements.add(refer("SerializerPlugin"))
      ..fields.addAll([
        Field((b) => b
          ..static = true
          ..type = refer("InterfaceDiscriminator")
          ..name = "_discriminator"),
        Field((b) => b
          ..static = true
          ..modifier = FieldModifier.constant
          ..type = TypeReference((b) => b
            ..symbol = "List"
            ..types.add(refer("Type")))
          ..name = "_interfaceTypes"
          ..assignment = Code("[${interfaceListString()}]")),
        Field((b) => b
          ..modifier = FieldModifier.final$
          ..type = refer("StandardJsonPlugin")
          ..name = "standardJsonPlugin"),
      ])
      ..constructors.add(Constructor((b) => b
        ..requiredParameters
            .add(Parameter((b) => b..name = "this.standardJsonPlugin"))))
      ..methods.addAll([
        Method((b) => b
          ..static = true
          ..type = MethodType.setter
          ..name = "discriminator"
          ..requiredParameters.add(Parameter((b) => b
            ..type = refer("InterfaceDiscriminator")
            ..name = "discriminator"))
          ..body = Code("_discriminator = discriminator;")),
        Method((b) => b
          ..static = true
          ..type = MethodType.getter
          ..returns = refer("InterfaceDiscriminator")
          ..name = "discriminator"
          ..body = Code("return _discriminator ?? (obj, type) => null;")),
        Method((b) => b
          ..annotations.add(CodeExpression(Code("override")))
          ..returns = refer("Object")
          ..name = "afterDeserialize"
          ..requiredParameters.addAll([
            Parameter((b) => b
              ..type = refer("Object")
              ..name = "object"),
            Parameter((b) => b
              ..type = refer("FullType")
              ..name = "specifiedType")
          ])
          ..body = Code(
              "return standardJsonPlugin.afterDeserialize(object, specifiedType);")),
        Method((b) => b
          ..annotations.add(CodeExpression(Code("override")))
          ..returns = refer("Object")
          ..name = "afterSerialize"
          ..requiredParameters.addAll([
            Parameter((b) => b
              ..type = refer("Object")
              ..name = "object"),
            Parameter((b) => b
              ..type = refer("FullType")
              ..name = "specifiedType")
          ])
          ..body = Code(
              "return standardJsonPlugin.afterSerialize(object, specifiedType);")),
        Method((b) => b
          ..annotations.add(CodeExpression(Code("override")))
          ..returns = refer("Object")
          ..name = "beforeDeserialize"
          ..requiredParameters.addAll([
            Parameter((b) => b
              ..type = refer("Object")
              ..name = "object"),
            Parameter((b) => b
              ..type = refer("FullType")
              ..name = "specifiedType")
          ])
          ..body = Code(getBeforeDeserializeBodyString())),
        Method((b) => b
          ..annotations.add(CodeExpression(Code("override")))
          ..returns = refer("Object")
          ..name = "beforeSerialize"
          ..requiredParameters.addAll([
            Parameter((b) => b
              ..type = refer("Object")
              ..name = "object"),
            Parameter((b) => b
              ..type = refer("FullType")
              ..name = "specifiedType")
          ])
          ..body = Code(
              "return standardJsonPlugin.beforeSerialize(object, specifiedType);")),
      ]));

    final errorClass = Class((b) => b
      ..name = getSerializationErrorClassName()
      ..extend = refer("Error")
      ..fields.add(Field((b) => b
        ..type = refer("String")
        ..name = "message"))
      ..constructors.add(Constructor((b) => b
        ..requiredParameters.add(Parameter((b) => b..name = "this.message")))));

    return Library((b) => b
      ..directives.addAll(imports)
      ..body.addAll([
        discriminatorTypeDef,
        pluginClass,
        errorClass,
      ]));
  }
}
