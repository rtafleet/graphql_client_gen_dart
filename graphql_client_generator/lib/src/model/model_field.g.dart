// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_field.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ModelField extends ModelField {
  @override
  final String fieldName;
  @override
  final bool isNullable;
  @override
  final String type;
  @override
  final String gqlTypeName;
  @override
  final FieldType fieldType;

  factory _$ModelField([void updates(ModelFieldBuilder b)]) =>
      (new ModelFieldBuilder()..update(updates)).build();

  _$ModelField._(
      {this.fieldName,
      this.isNullable,
      this.type,
      this.gqlTypeName,
      this.fieldType})
      : super._() {
    if (fieldName == null) {
      throw new BuiltValueNullFieldError('ModelField', 'fieldName');
    }
    if (isNullable == null) {
      throw new BuiltValueNullFieldError('ModelField', 'isNullable');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('ModelField', 'type');
    }
    if (gqlTypeName == null) {
      throw new BuiltValueNullFieldError('ModelField', 'gqlTypeName');
    }
    if (fieldType == null) {
      throw new BuiltValueNullFieldError('ModelField', 'fieldType');
    }
  }

  @override
  ModelField rebuild(void updates(ModelFieldBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ModelFieldBuilder toBuilder() => new ModelFieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelField &&
        fieldName == other.fieldName &&
        isNullable == other.isNullable &&
        type == other.type &&
        gqlTypeName == other.gqlTypeName &&
        fieldType == other.fieldType;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, fieldName.hashCode), isNullable.hashCode),
                type.hashCode),
            gqlTypeName.hashCode),
        fieldType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ModelField')
          ..add('fieldName', fieldName)
          ..add('isNullable', isNullable)
          ..add('type', type)
          ..add('gqlTypeName', gqlTypeName)
          ..add('fieldType', fieldType))
        .toString();
  }
}

class ModelFieldBuilder implements Builder<ModelField, ModelFieldBuilder> {
  _$ModelField _$v;

  String _fieldName;
  String get fieldName => _$this._fieldName;
  set fieldName(String fieldName) => _$this._fieldName = fieldName;

  bool _isNullable;
  bool get isNullable => _$this._isNullable;
  set isNullable(bool isNullable) => _$this._isNullable = isNullable;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _gqlTypeName;
  String get gqlTypeName => _$this._gqlTypeName;
  set gqlTypeName(String gqlTypeName) => _$this._gqlTypeName = gqlTypeName;

  FieldType _fieldType;
  FieldType get fieldType => _$this._fieldType;
  set fieldType(FieldType fieldType) => _$this._fieldType = fieldType;

  ModelFieldBuilder();

  ModelFieldBuilder get _$this {
    if (_$v != null) {
      _fieldName = _$v.fieldName;
      _isNullable = _$v.isNullable;
      _type = _$v.type;
      _gqlTypeName = _$v.gqlTypeName;
      _fieldType = _$v.fieldType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ModelField other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ModelField;
  }

  @override
  void update(void updates(ModelFieldBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ModelField build() {
    final _$result = _$v ??
        new _$ModelField._(
            fieldName: fieldName,
            isNullable: isNullable,
            type: type,
            gqlTypeName: gqlTypeName,
            fieldType: fieldType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
