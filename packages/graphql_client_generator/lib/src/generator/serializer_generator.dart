import 'package:code_builder/code_builder.dart';
import 'package:graphql_client_generator/src/utils/import_resolver.dart';
import 'package:recase/recase.dart';

class SerializerGenerator {
  final Map<Directive, List<String>> serializableTypeMap;

  SerializerGenerator(this.serializableTypeMap);

  Library generateLibrary(ImportResolver importResolver, String clientName) {
    final serializableTypes = serializableTypeMap.values.fold(
        <Reference>[],
        (List<Reference> acc, t) =>
            acc..addAll(t.map((i) => refer(ReCase(i).pascalCase)))).toList();
    final serializerField = Field((b) => b
      ..modifier = FieldModifier.final$
      ..type = refer("Serializers")
      ..name = "serializers"
      ..assignment = Code(
          "(_\$serializers.toBuilder()..addPlugin(${ReCase(clientName).pascalCase}JsonPlugin(StandardJsonPlugin()))).build()")
      ..annotations.add(CodeExpression(Code("SerializersFor"))
          .call([literalConstList(serializableTypes)])));
    final serializer = Library((b) {
      b.body.addAll(<Spec>[
        Code("part 'serializers.g.dart';\n"),
        serializerField,
      ]);
      b.directives.addAll([
        Directive.import("package:built_collection/built_collection.dart"),
        Directive.import("package:built_value/serializer.dart"),
        Directive.import("package:built_value/standard_json_plugin.dart"),
        importResolver.modelExportsLibrary(),
        importResolver.operationExportsLibrary(),
        importResolver.jsonPlugin(),
      ]);
    });
    return serializer;
  }
}
