import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:graphql_client_generator/src/model/serializers.dart';

part 'custom_scalar_map.g.dart';

abstract class CustomScalarMap
    implements Built<CustomScalarMap, CustomScalarMapBuilder> {
  static Serializer<CustomScalarMap> get serializer =>
      _$customScalarMapSerializer;

  CustomScalarMap._();

  @BuiltValueField(wireName: "custom_scalars")
  BuiltList<CustomScalar> get customScalars;

  factory CustomScalarMap([updates(CustomScalarMapBuilder b)]) =
      _$CustomScalarMap;

  String toJson() =>
      json.encode(serializers.serializeWith(CustomScalarMap.serializer, this));

  static CustomScalarMap fromJson(String jsonString) => serializers
      .deserializeWith(CustomScalarMap.serializer, json.decode(jsonString));
}

abstract class CustomScalar
    implements Built<CustomScalar, CustomScalarBuilder> {
  static Serializer<CustomScalar> get serializer => _$customScalarSerializer;

  CustomScalar._();

  String get name;

  @BuiltValueField(wireName: "dart_type")
  String get dartType;

  factory CustomScalar([updates(CustomScalarBuilder b)]) = _$CustomScalar;

  String toJson() =>
      json.encode(serializers.serializeWith(CustomScalar.serializer, this));

  static CustomScalar fromJson(String jsonString) => serializers
      .deserializeWith(CustomScalar.serializer, json.decode(jsonString));
}
