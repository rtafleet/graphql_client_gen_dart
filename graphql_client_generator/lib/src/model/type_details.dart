import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:graphql_client_generator/src/model/serializers.dart';
import 'package:graphql_client_generator/src/model/type_constants.dart';

part 'type_details.g.dart';

abstract class TypeDetails {
  String get name;

  String get kind;
}

abstract class ObjectTypeDetails implements TypeDetails {
  BuiltList<GQLField> get fields;

  /// If any of the enclosed fields are not resolved, then this whole object is
  /// unresolved
  bool get recursiveIsResolved {
    return !fields.any((t) {
      var recursiveIsResolved = t.recursiveIsResolved;
      return !recursiveIsResolved;
    });
  }

  List<GQLType> get concreteTypes => fields.map((f) => f.concreteType).toList();
}

abstract class OutputTypeDetails extends Object
    with ObjectTypeDetails
    implements Built<OutputTypeDetails, OutputTypeDetailsBuilder> {
  static Serializer<OutputTypeDetails> get serializer =>
      _$outputTypeDetailsSerializer;

  OutputTypeDetails._();

  factory OutputTypeDetails([updates(OutputTypeDetailsBuilder b)]) =
      _$OutputTypeDetails;

  String toJson() => json
      .encode(serializers.serializeWith(OutputTypeDetails.serializer, this));

  static OutputTypeDetails fromJson(String jsonString) => serializers
      .deserializeWith(OutputTypeDetails.serializer, json.decode(jsonString));
}

abstract class InputTypeDetails extends Object
    with ObjectTypeDetails
    implements Built<InputTypeDetails, InputTypeDetailsBuilder>, TypeDetails {
  static Serializer<InputTypeDetails> get serializer =>
      _$inputTypeDetailsSerializer;

  InputTypeDetails._();

  @override
  @BuiltValueField(wireName: "inputFields")
  BuiltList<GQLField> get fields;

  factory InputTypeDetails([updates(InputTypeDetailsBuilder b)]) =
      _$InputTypeDetails;

  String toJson() =>
      json.encode(serializers.serializeWith(InputTypeDetails.serializer, this));

  static InputTypeDetails fromJson(String jsonString) => serializers
      .deserializeWith(InputTypeDetails.serializer, json.decode(jsonString));
}

abstract class EnumTypeDetails extends Object
    with TypeDetails
    implements Built<EnumTypeDetails, EnumTypeDetailsBuilder> {
  static Serializer<EnumTypeDetails> get serializer => _$enumTypeDetailsSerializer;
  EnumTypeDetails._();

  BuiltList<GQLEnumValue> get enumValues;

  factory EnumTypeDetails([updates(EnumTypeDetailsBuilder b)]) =
      _$EnumTypeDetails;
  String toJson() => json.encode(serializers.serializeWith(EnumTypeDetails.serializer, this));
  static EnumTypeDetails fromJson(String jsonString) => serializers.deserializeWith(EnumTypeDetails.serializer, json.decode(jsonString));
}

abstract class GQLEnumValue
    implements Built<GQLEnumValue, GQLEnumValueBuilder> {
  static Serializer<GQLEnumValue> get serializer => _$gQLEnumValueSerializer;
  GQLEnumValue._();

  String get name;

  factory GQLEnumValue([updates(GQLEnumValueBuilder b)]) = _$GQLEnumValue;
  String toJson() => json.encode(serializers.serializeWith(GQLEnumValue.serializer, this));
  static GQLEnumValue fromJson(String jsonString) => serializers.deserializeWith(GQLEnumValue.serializer, json.decode(jsonString));
}

abstract class GQLField implements Built<GQLField, GQLFieldBuilder> {
  static Serializer<GQLField> get serializer => _$gQLFieldSerializer;

  GQLField._();

  GQLType get type;

  String get name;

  bool get recursiveIsResolved => type.recursiveIsResolved;

  bool get isList => type.isList;

  GQLKind get gqlKind => type.gqlKind;

  GQLType get concreteType => type.concreteType;

  factory GQLField([updates(GQLFieldBuilder b)]) = _$GQLField;

  /// basically, the only way we know if this is a nullable type is if the direct
  /// type here is not NON_NULL. NON_NULL is a wrapper type which indicates…
  /// that this is NON_NULL. consumers need to look at the [concreteType] to
  /// recursively find out what the enclosing type is
  bool get nullable => type.kind != NON_NULL;

  String toJson() =>
      json.encode(serializers.serializeWith(GQLField.serializer, this));

  static GQLField fromJson(String jsonString) =>
      serializers.deserializeWith(GQLField.serializer, json.decode(jsonString));
}

abstract class GQLType implements Built<GQLType, GQLTypeBuilder> {
  static Serializer<GQLType> get serializer => _$gQLTypeSerializer;

  GQLType._();

  String get kind;

  @nullable
  String get name;

  @nullable
  GQLType get ofType;

  /// We are unresolved if we are NON_NULL or a LIST and our last descendant is not resolved
  bool get recursiveIsResolved {
    final _concreteType = concreteType;
    if (_concreteType == null) {
      return false;
    } else if (_concreteType.kind == LIST) {
      // a list is a special case, we need to find it's internal concrete type
      if (_concreteType.ofType == null) {
        return false;
      }
      return _concreteType.ofType.concreteType != null;
    }
    return true;
  }

  factory GQLType([updates(GQLTypeBuilder b)]) = _$GQLType;

  GQLType get concreteType {
    if (kind == NON_NULL || kind == LIST) {
      // in this case, we may not have asked far enough, so if ofType is null,
      // and we are NON_NULL, then we know we need to go farther
      if (ofType == null) {
        return null;
      } else {
        // ask the descendants
        return ofType.concreteType;
      }
    } else {
      // we are of a concrete type, return true
      return this;
    }
  }

  GQLKind get gqlKind {
    if (isList) {
      return GQLKind.listKind;
    } else if (concreteType.kind == "ENUM") {
      return GQLKind.enumKind;
    } else {
      return GQLKind.otherKind;
    }
  }

  bool get isList {
    if (kind == LIST) {
      return true;
    } else if (kind == NON_NULL) {
      // in this case, we may not have asked far enough, so if ofType is null,
      // and we are NON_NULL, then we know we need to go farther
      if (ofType == null) {
        return false; // no way to know for sure
      } else {
        // ask the descendants
        return ofType.isList;
      }
    } else {
      // not a list for sure
      return false;
    }
  }

  String toJson() =>
      json.encode(serializers.serializeWith(GQLType.serializer, this));

  static GQLType fromJson(String jsonString) =>
      serializers.deserializeWith(GQLType.serializer, json.decode(jsonString));
}

enum GQLKind {
  listKind,
  enumKind,
  otherKind,
}