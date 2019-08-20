import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:graphql_client_generator/src/model/type.dart';

part 'input_value.g.dart';

abstract class InputValue implements Built<InputValue, InputValueBuilder> {
  static Serializer<InputValue> get serializer => _$inputValueSerializer;

  InputValue._();

  String get name;

  @nullable
  String get description;

  TypeRef get type;

  @nullable
  String get defaultValue;

  factory InputValue([updates(InputValueBuilder b)]) = _$InputValue;
}
