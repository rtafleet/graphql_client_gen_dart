import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:graphql_client_generator/src/model/input_value.dart';
import 'package:graphql_client_generator/src/model/type.dart';

part 'field.g.dart';

abstract class Field implements Built<Field, FieldBuilder> {
  static Serializer<Field> get serializer => _$fieldSerializer;

  Field._();

  String get name;

  @nullable
  String get description;

  BuiltList<InputValue> get args;

  TypeRef get type;

  bool get isDeprecated;

  @nullable
  String get deprecationReason;

  factory Field([updates(FieldBuilder b)]) = _$Field;
}
