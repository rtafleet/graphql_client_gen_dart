import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'enum_value.g.dart';

abstract class EnumValue implements Built<EnumValue, EnumValueBuilder> {
  static Serializer<EnumValue> get serializer => _$enumValueSerializer;

  EnumValue._();

  String get name;

  @nullable
  String get description;

  bool get isDeprecated;

  @nullable
  String get deprecationReason;

  factory EnumValue([updates(EnumValueBuilder b)]) = _$EnumValue;
}
