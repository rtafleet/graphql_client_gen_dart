import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:graphql_client_generator/src/model/schema.dart';
import 'package:graphql_client_generator/src/model/serializers.dart';

part 'whole_schema_query_output.g.dart';

abstract class WholeSchemaQueryOutput
    implements Built<WholeSchemaQueryOutput, WholeSchemaQueryOutputBuilder> {
  static Serializer<WholeSchemaQueryOutput> get serializer =>
      _$wholeSchemaQueryOutputSerializer;

  WholeSchemaQueryOutput._();

  @BuiltValueField(wireName: "__schema")
  Schema get schema;

  factory WholeSchemaQueryOutput([updates(WholeSchemaQueryOutputBuilder b)]) =
      _$WholeSchemaQueryOutput;

  static WholeSchemaQueryOutput fromGQLMap(Map<String, dynamic> data) =>
      serializers.deserializeWith(WholeSchemaQueryOutput.serializer, data);
}
