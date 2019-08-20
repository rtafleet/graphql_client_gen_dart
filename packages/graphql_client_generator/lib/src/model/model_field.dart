import 'package:built_value/built_value.dart';

part 'model_field.g.dart';

abstract class ModelField implements Built<ModelField, ModelFieldBuilder> {
  ModelField._();

  String get fieldName;

  bool get isNullable;

  /// this refers to the type that we will be creating depending on the variant. it will reference a Dart Class once created
  String get type;

  /// This refers to the type as defined in the GraphQL schema
  String get gqlTypeName;

  FieldType get fieldType;

  DartType get dartType {
    if (type == "Int") {
      return DartType("int", true);
    } else if (type == "Boolean") {
      return DartType("bool", true);
    } else if (type == "ID" || type == "String") {
      return DartType("String", true);
    } else if (type == "Float") {
      return DartType("double", true);
    }
    return DartType(type, false);
  }

  factory ModelField([updates(ModelFieldBuilder b)]) = _$ModelField;
}

class DartType {
  final String typeName;
  final bool builtInType;

  DartType(this.typeName, this.builtInType);
}

enum FieldType {
  listType,
  enumType,
  otherType,
}
