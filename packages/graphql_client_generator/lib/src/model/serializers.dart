import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:graphql_client_generator/src/model/custom_scalar_map.dart';
import 'package:graphql_client_generator/src/model/directive.dart';
import 'package:graphql_client_generator/src/model/enum_value.dart';
import 'package:graphql_client_generator/src/model/field.dart';
import 'package:graphql_client_generator/src/model/gql_input_type.dart';
import 'package:graphql_client_generator/src/model/input_value.dart';
import 'package:graphql_client_generator/src/model/schema.dart';
import 'package:graphql_client_generator/src/model/type.dart';
import 'package:graphql_client_generator/src/model/type_details.dart';
import 'package:graphql_client_generator/src/whole_schema/whole_schema_query_output.dart';

part 'serializers.g.dart';

class TypeCheckingJsonPlugin extends StandardJsonPlugin {
  @override
  Object beforeDeserialize(Object object, FullType specifiedType) {
    if (object is Map<String, dynamic>) {
      for (var entry in object.entries) {
        if (entry.value != null && entry.value is! String && entry.value is! num && entry.value is! bool && entry.value is! List && entry.value is! Map) {
          throw SerializationError(
              "Invalid type for field '${entry.key}': expected String, num, bool, List, or Map, got ${entry.value.runtimeType}");
        }
      }
    }
    return super.beforeDeserialize(object, specifiedType);
  }
}

@SerializersFor(const [
  OutputTypeDetails,
  GQLField,
  GQLType,
  GQLInputField,
  GQLInputType,
  InputTypeDetails,
  EnumTypeDetails,
  GQLEnumValue,
  TypeRef,
  TypeMini,
  TypeFull,
  Directive,
  EnumValue,
  Field,
  InputValue,
  Schema,
  WholeSchemaQueryOutput,
  CustomScalarMap,
  CustomScalar,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(new TypeCheckingJsonPlugin())).build();
