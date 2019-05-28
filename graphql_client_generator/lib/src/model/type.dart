import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:graphql_client_generator/src/model/enum_value.dart';
import 'package:graphql_client_generator/src/model/field.dart';
import 'package:graphql_client_generator/src/model/input_value.dart';

part 'type.g.dart';

abstract class TypeRef implements Built<TypeRef, TypeRefBuilder> {
  static Serializer<TypeRef> get serializer => _$typeRefSerializer;

  TypeRef._();

  String get kind;

  @nullable
  String get name;

  @nullable
  TypeRef get ofType;

  /// The actual type definition can be buried under multiple levels of
  /// NON_NULL and LIST types, so this will recursively find the concrete [TypeRef]
  TypeRef get concreteType {
    if (!isNullable || isList) {
      return ofType.concreteType;
    }
    return this;
  }

  bool get isEnum => concreteType.kind == "ENUM";

  bool get isList {
    if (!isNullable) {
      return ofType.isList;
    }
    return kind == "LIST";
  }

  bool get isScalar => concreteType.kind == "SCALAR";

  bool get isNullable {
    return kind != "NON_NULL";
  }

  factory TypeRef([updates(TypeRefBuilder b)]) = _$TypeRef;
}

abstract class TypeMini implements Built<TypeMini, TypeMiniBuilder> {
  static Serializer<TypeMini> get serializer => _$typeMiniSerializer;

  TypeMini._();

  @nullable
  String get name;

  factory TypeMini([updates(TypeMiniBuilder b)]) = _$TypeMini;
}

abstract class TypeFull implements Built<TypeFull, TypeFullBuilder> {
  static Serializer<TypeFull> get serializer => _$typeFullSerializer;

  TypeFull._();

  String get kind;

  @nullable
  String get name;

  @nullable
  String get description;

  BuiltList<Field> get fields;

  BuiltList<TypeRef> get interfaces;

  BuiltList<EnumValue> get enumValues;

  BuiltList<TypeRef> get possibleTypes;

  BuiltList<InputValue> get inputFields;

  List<TypeRef> get enumTypeRefs {
    final fieldEnums = fields
        .where((f) => f.type.concreteType.kind == "ENUM")
        .map((f) => f.type);
    final inputFieldEnums = inputFields
        .where((f) => f.type.concreteType.kind == "ENUM")
        .map((f) => f.type);
    return fieldEnums.toList()..addAll(inputFieldEnums);
  }

  factory TypeFull([updates(TypeFullBuilder b)]) = _$TypeFull;
}
