// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_details.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OutputTypeDetails> _$outputTypeDetailsSerializer =
    new _$OutputTypeDetailsSerializer();
Serializer<InputTypeDetails> _$inputTypeDetailsSerializer =
    new _$InputTypeDetailsSerializer();
Serializer<EnumTypeDetails> _$enumTypeDetailsSerializer =
    new _$EnumTypeDetailsSerializer();
Serializer<GQLEnumValue> _$gQLEnumValueSerializer =
    new _$GQLEnumValueSerializer();
Serializer<GQLField> _$gQLFieldSerializer = new _$GQLFieldSerializer();
Serializer<GQLType> _$gQLTypeSerializer = new _$GQLTypeSerializer();

class _$OutputTypeDetailsSerializer
    implements StructuredSerializer<OutputTypeDetails> {
  @override
  final Iterable<Type> types = const [OutputTypeDetails, _$OutputTypeDetails];
  @override
  final String wireName = 'OutputTypeDetails';

  @override
  Iterable serialize(Serializers serializers, OutputTypeDetails object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'fields',
      serializers.serialize(object.fields,
          specifiedType:
              const FullType(BuiltList, const [const FullType(GQLField)])),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'kind',
      serializers.serialize(object.kind, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  OutputTypeDetails deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OutputTypeDetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'fields':
          result.fields.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(GQLField)])) as BuiltList);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'kind':
          result.kind = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$InputTypeDetailsSerializer
    implements StructuredSerializer<InputTypeDetails> {
  @override
  final Iterable<Type> types = const [InputTypeDetails, _$InputTypeDetails];
  @override
  final String wireName = 'InputTypeDetails';

  @override
  Iterable serialize(Serializers serializers, InputTypeDetails object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'inputFields',
      serializers.serialize(object.fields,
          specifiedType:
              const FullType(BuiltList, const [const FullType(GQLField)])),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'kind',
      serializers.serialize(object.kind, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  InputTypeDetails deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InputTypeDetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'inputFields':
          result.fields.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(GQLField)])) as BuiltList);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'kind':
          result.kind = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$EnumTypeDetailsSerializer
    implements StructuredSerializer<EnumTypeDetails> {
  @override
  final Iterable<Type> types = const [EnumTypeDetails, _$EnumTypeDetails];
  @override
  final String wireName = 'EnumTypeDetails';

  @override
  Iterable serialize(Serializers serializers, EnumTypeDetails object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'enumValues',
      serializers.serialize(object.enumValues,
          specifiedType:
              const FullType(BuiltList, const [const FullType(GQLEnumValue)])),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'kind',
      serializers.serialize(object.kind, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  EnumTypeDetails deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EnumTypeDetailsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'enumValues':
          result.enumValues.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GQLEnumValue)]))
              as BuiltList);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'kind':
          result.kind = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GQLEnumValueSerializer implements StructuredSerializer<GQLEnumValue> {
  @override
  final Iterable<Type> types = const [GQLEnumValue, _$GQLEnumValue];
  @override
  final String wireName = 'GQLEnumValue';

  @override
  Iterable serialize(Serializers serializers, GQLEnumValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GQLEnumValue deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQLEnumValueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GQLFieldSerializer implements StructuredSerializer<GQLField> {
  @override
  final Iterable<Type> types = const [GQLField, _$GQLField];
  @override
  final String wireName = 'GQLField';

  @override
  Iterable serialize(Serializers serializers, GQLField object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(GQLType)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GQLField deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQLFieldBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'type':
          result.type.replace(serializers.deserialize(value,
              specifiedType: const FullType(GQLType)) as GQLType);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GQLTypeSerializer implements StructuredSerializer<GQLType> {
  @override
  final Iterable<Type> types = const [GQLType, _$GQLType];
  @override
  final String wireName = 'GQLType';

  @override
  Iterable serialize(Serializers serializers, GQLType object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'kind',
      serializers.serialize(object.kind, specifiedType: const FullType(String)),
    ];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.ofType != null) {
      result
        ..add('ofType')
        ..add(serializers.serialize(object.ofType,
            specifiedType: const FullType(GQLType)));
    }

    return result;
  }

  @override
  GQLType deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQLTypeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'kind':
          result.kind = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ofType':
          result.ofType.replace(serializers.deserialize(value,
              specifiedType: const FullType(GQLType)) as GQLType);
          break;
      }
    }

    return result.build();
  }
}

class _$OutputTypeDetails extends OutputTypeDetails {
  @override
  final BuiltList<GQLField> fields;
  @override
  final String name;
  @override
  final String kind;

  factory _$OutputTypeDetails([void updates(OutputTypeDetailsBuilder b)]) =>
      (new OutputTypeDetailsBuilder()..update(updates)).build();

  _$OutputTypeDetails._({this.fields, this.name, this.kind}) : super._() {
    if (fields == null) {
      throw new BuiltValueNullFieldError('OutputTypeDetails', 'fields');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('OutputTypeDetails', 'name');
    }
    if (kind == null) {
      throw new BuiltValueNullFieldError('OutputTypeDetails', 'kind');
    }
  }

  @override
  OutputTypeDetails rebuild(void updates(OutputTypeDetailsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  OutputTypeDetailsBuilder toBuilder() =>
      new OutputTypeDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OutputTypeDetails &&
        fields == other.fields &&
        name == other.name &&
        kind == other.kind;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, fields.hashCode), name.hashCode), kind.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OutputTypeDetails')
          ..add('fields', fields)
          ..add('name', name)
          ..add('kind', kind))
        .toString();
  }
}

class OutputTypeDetailsBuilder
    implements Builder<OutputTypeDetails, OutputTypeDetailsBuilder> {
  _$OutputTypeDetails _$v;

  ListBuilder<GQLField> _fields;
  ListBuilder<GQLField> get fields =>
      _$this._fields ??= new ListBuilder<GQLField>();
  set fields(ListBuilder<GQLField> fields) => _$this._fields = fields;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _kind;
  String get kind => _$this._kind;
  set kind(String kind) => _$this._kind = kind;

  OutputTypeDetailsBuilder();

  OutputTypeDetailsBuilder get _$this {
    if (_$v != null) {
      _fields = _$v.fields?.toBuilder();
      _name = _$v.name;
      _kind = _$v.kind;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OutputTypeDetails other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$OutputTypeDetails;
  }

  @override
  void update(void updates(OutputTypeDetailsBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$OutputTypeDetails build() {
    _$OutputTypeDetails _$result;
    try {
      _$result = _$v ??
          new _$OutputTypeDetails._(
              fields: fields.build(), name: name, kind: kind);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'fields';
        fields.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'OutputTypeDetails', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$InputTypeDetails extends InputTypeDetails {
  @override
  final BuiltList<GQLField> fields;
  @override
  final String name;
  @override
  final String kind;

  factory _$InputTypeDetails([void updates(InputTypeDetailsBuilder b)]) =>
      (new InputTypeDetailsBuilder()..update(updates)).build();

  _$InputTypeDetails._({this.fields, this.name, this.kind}) : super._() {
    if (fields == null) {
      throw new BuiltValueNullFieldError('InputTypeDetails', 'fields');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('InputTypeDetails', 'name');
    }
    if (kind == null) {
      throw new BuiltValueNullFieldError('InputTypeDetails', 'kind');
    }
  }

  @override
  InputTypeDetails rebuild(void updates(InputTypeDetailsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  InputTypeDetailsBuilder toBuilder() =>
      new InputTypeDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InputTypeDetails &&
        fields == other.fields &&
        name == other.name &&
        kind == other.kind;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, fields.hashCode), name.hashCode), kind.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InputTypeDetails')
          ..add('fields', fields)
          ..add('name', name)
          ..add('kind', kind))
        .toString();
  }
}

class InputTypeDetailsBuilder
    implements Builder<InputTypeDetails, InputTypeDetailsBuilder> {
  _$InputTypeDetails _$v;

  ListBuilder<GQLField> _fields;
  ListBuilder<GQLField> get fields =>
      _$this._fields ??= new ListBuilder<GQLField>();
  set fields(ListBuilder<GQLField> fields) => _$this._fields = fields;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _kind;
  String get kind => _$this._kind;
  set kind(String kind) => _$this._kind = kind;

  InputTypeDetailsBuilder();

  InputTypeDetailsBuilder get _$this {
    if (_$v != null) {
      _fields = _$v.fields?.toBuilder();
      _name = _$v.name;
      _kind = _$v.kind;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InputTypeDetails other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InputTypeDetails;
  }

  @override
  void update(void updates(InputTypeDetailsBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$InputTypeDetails build() {
    _$InputTypeDetails _$result;
    try {
      _$result = _$v ??
          new _$InputTypeDetails._(
              fields: fields.build(), name: name, kind: kind);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'fields';
        fields.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'InputTypeDetails', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$EnumTypeDetails extends EnumTypeDetails {
  @override
  final BuiltList<GQLEnumValue> enumValues;
  @override
  final String name;
  @override
  final String kind;

  factory _$EnumTypeDetails([void updates(EnumTypeDetailsBuilder b)]) =>
      (new EnumTypeDetailsBuilder()..update(updates)).build();

  _$EnumTypeDetails._({this.enumValues, this.name, this.kind}) : super._() {
    if (enumValues == null) {
      throw new BuiltValueNullFieldError('EnumTypeDetails', 'enumValues');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('EnumTypeDetails', 'name');
    }
    if (kind == null) {
      throw new BuiltValueNullFieldError('EnumTypeDetails', 'kind');
    }
  }

  @override
  EnumTypeDetails rebuild(void updates(EnumTypeDetailsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  EnumTypeDetailsBuilder toBuilder() =>
      new EnumTypeDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EnumTypeDetails &&
        enumValues == other.enumValues &&
        name == other.name &&
        kind == other.kind;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, enumValues.hashCode), name.hashCode), kind.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EnumTypeDetails')
          ..add('enumValues', enumValues)
          ..add('name', name)
          ..add('kind', kind))
        .toString();
  }
}

class EnumTypeDetailsBuilder
    implements Builder<EnumTypeDetails, EnumTypeDetailsBuilder> {
  _$EnumTypeDetails _$v;

  ListBuilder<GQLEnumValue> _enumValues;
  ListBuilder<GQLEnumValue> get enumValues =>
      _$this._enumValues ??= new ListBuilder<GQLEnumValue>();
  set enumValues(ListBuilder<GQLEnumValue> enumValues) =>
      _$this._enumValues = enumValues;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _kind;
  String get kind => _$this._kind;
  set kind(String kind) => _$this._kind = kind;

  EnumTypeDetailsBuilder();

  EnumTypeDetailsBuilder get _$this {
    if (_$v != null) {
      _enumValues = _$v.enumValues?.toBuilder();
      _name = _$v.name;
      _kind = _$v.kind;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnumTypeDetails other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EnumTypeDetails;
  }

  @override
  void update(void updates(EnumTypeDetailsBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$EnumTypeDetails build() {
    _$EnumTypeDetails _$result;
    try {
      _$result = _$v ??
          new _$EnumTypeDetails._(
              enumValues: enumValues.build(), name: name, kind: kind);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'enumValues';
        enumValues.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'EnumTypeDetails', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GQLEnumValue extends GQLEnumValue {
  @override
  final String name;

  factory _$GQLEnumValue([void updates(GQLEnumValueBuilder b)]) =>
      (new GQLEnumValueBuilder()..update(updates)).build();

  _$GQLEnumValue._({this.name}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('GQLEnumValue', 'name');
    }
  }

  @override
  GQLEnumValue rebuild(void updates(GQLEnumValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  GQLEnumValueBuilder toBuilder() => new GQLEnumValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQLEnumValue && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(0, name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GQLEnumValue')..add('name', name))
        .toString();
  }
}

class GQLEnumValueBuilder
    implements Builder<GQLEnumValue, GQLEnumValueBuilder> {
  _$GQLEnumValue _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  GQLEnumValueBuilder();

  GQLEnumValueBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQLEnumValue other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GQLEnumValue;
  }

  @override
  void update(void updates(GQLEnumValueBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$GQLEnumValue build() {
    final _$result = _$v ?? new _$GQLEnumValue._(name: name);
    replace(_$result);
    return _$result;
  }
}

class _$GQLField extends GQLField {
  @override
  final GQLType type;
  @override
  final String name;

  factory _$GQLField([void updates(GQLFieldBuilder b)]) =>
      (new GQLFieldBuilder()..update(updates)).build();

  _$GQLField._({this.type, this.name}) : super._() {
    if (type == null) {
      throw new BuiltValueNullFieldError('GQLField', 'type');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('GQLField', 'name');
    }
  }

  @override
  GQLField rebuild(void updates(GQLFieldBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  GQLFieldBuilder toBuilder() => new GQLFieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQLField && type == other.type && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, type.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GQLField')
          ..add('type', type)
          ..add('name', name))
        .toString();
  }
}

class GQLFieldBuilder implements Builder<GQLField, GQLFieldBuilder> {
  _$GQLField _$v;

  GQLTypeBuilder _type;
  GQLTypeBuilder get type => _$this._type ??= new GQLTypeBuilder();
  set type(GQLTypeBuilder type) => _$this._type = type;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  GQLFieldBuilder();

  GQLFieldBuilder get _$this {
    if (_$v != null) {
      _type = _$v.type?.toBuilder();
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQLField other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GQLField;
  }

  @override
  void update(void updates(GQLFieldBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$GQLField build() {
    _$GQLField _$result;
    try {
      _$result = _$v ?? new _$GQLField._(type: type.build(), name: name);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'type';
        type.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GQLField', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GQLType extends GQLType {
  @override
  final String kind;
  @override
  final String name;
  @override
  final GQLType ofType;

  factory _$GQLType([void updates(GQLTypeBuilder b)]) =>
      (new GQLTypeBuilder()..update(updates)).build();

  _$GQLType._({this.kind, this.name, this.ofType}) : super._() {
    if (kind == null) {
      throw new BuiltValueNullFieldError('GQLType', 'kind');
    }
  }

  @override
  GQLType rebuild(void updates(GQLTypeBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  GQLTypeBuilder toBuilder() => new GQLTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQLType &&
        kind == other.kind &&
        name == other.name &&
        ofType == other.ofType;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, kind.hashCode), name.hashCode), ofType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GQLType')
          ..add('kind', kind)
          ..add('name', name)
          ..add('ofType', ofType))
        .toString();
  }
}

class GQLTypeBuilder implements Builder<GQLType, GQLTypeBuilder> {
  _$GQLType _$v;

  String _kind;
  String get kind => _$this._kind;
  set kind(String kind) => _$this._kind = kind;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  GQLTypeBuilder _ofType;
  GQLTypeBuilder get ofType => _$this._ofType ??= new GQLTypeBuilder();
  set ofType(GQLTypeBuilder ofType) => _$this._ofType = ofType;

  GQLTypeBuilder();

  GQLTypeBuilder get _$this {
    if (_$v != null) {
      _kind = _$v.kind;
      _name = _$v.name;
      _ofType = _$v.ofType?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQLType other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GQLType;
  }

  @override
  void update(void updates(GQLTypeBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$GQLType build() {
    _$GQLType _$result;
    try {
      _$result = _$v ??
          new _$GQLType._(kind: kind, name: name, ofType: _ofType?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'ofType';
        _ofType?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GQLType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
