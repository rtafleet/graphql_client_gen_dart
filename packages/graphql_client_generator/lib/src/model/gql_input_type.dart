import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:graphql_client_generator/src/model/serializers.dart';
import 'package:graphql_client_generator/src/model/type_constants.dart';

part 'gql_input_type.g.dart';

abstract class GQLInputType
    implements Built<GQLInputType, GQLInputTypeBuilder> {
  static Serializer<GQLInputType> get serializer => _$gQLInputTypeSerializer;

  GQLInputType._();

  String get kind;

  String get name;

  @nullable
  GQLInputType get ofType;

  BuiltList<GQLInputField> get inputFields;

  /// Reports whether this type chain is complete and if not, what is needed
  /// to complete it
  bool get allTypesResolved {
    if (kind == NON_NULL || kind == LIST) {
      if (ofType == null) {
        // we need a query with deeper `ofType` in order to get the info we need
        return false;
      } else {
        return ofType.allTypesResolved;
      }
    } else {
      // go through all the inputFields and if any are not [TypeResolutionStatus.resolved], we return that status
      for (var inputField in inputFields) {
        var fieldIsResolved = inputField.resolved;
        if (!fieldIsResolved) {
          return false;
        }
      }
      return true;
    }
  }

  factory GQLInputType([updates(GQLInputTypeBuilder b)]) = _$GQLInputType;

  String toJson() =>
      json.encode(serializers.serializeWith(GQLInputType.serializer, this));

  static GQLInputType fromJson(String jsonString) => serializers
      .deserializeWith(GQLInputType.serializer, json.decode(jsonString));
}

abstract class GQLInputField
    implements Built<GQLInputField, GQLInputFieldBuilder> {
  static Serializer<GQLInputField> get serializer => _$gQLInputFieldSerializer;

  GQLInputField._();

  GQLInputType get type;

  String get name;

  bool get resolved => type.allTypesResolved;

  factory GQLInputField([updates(GQLInputFieldBuilder b)]) = _$GQLInputField;

  String toJson() =>
      json.encode(serializers.serializeWith(GQLInputField.serializer, this));

  static GQLInputField fromJson(String jsonString) => serializers
      .deserializeWith(GQLInputField.serializer, json.decode(jsonString));
}

enum TypeResolutionStatus {
  resolved,
  typesUnresolved,
  inputFieldsUnresolved,
}
