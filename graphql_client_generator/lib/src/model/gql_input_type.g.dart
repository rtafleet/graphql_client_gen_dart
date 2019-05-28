// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gql_input_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GQLInputType> _$gQLInputTypeSerializer =
    new _$GQLInputTypeSerializer();
Serializer<GQLInputField> _$gQLInputFieldSerializer =
    new _$GQLInputFieldSerializer();

class _$GQLInputTypeSerializer implements StructuredSerializer<GQLInputType> {
  @override
  final Iterable<Type> types = const [GQLInputType, _$GQLInputType];
  @override
  final String wireName = 'GQLInputType';

  @override
  Iterable serialize(Serializers serializers, GQLInputType object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'kind',
      serializers.serialize(object.kind, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'inputFields',
      serializers.serialize(object.inputFields,
          specifiedType:
              const FullType(BuiltList, const [const FullType(GQLInputField)])),
    ];
    if (object.ofType != null) {
      result
        ..add('ofType')
        ..add(serializers.serialize(object.ofType,
            specifiedType: const FullType(GQLInputType)));
    }

    return result;
  }

  @override
  GQLInputType deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQLInputTypeBuilder();

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
              specifiedType: const FullType(GQLInputType)) as GQLInputType);
          break;
        case 'inputFields':
          result.inputFields.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(GQLInputField)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$GQLInputFieldSerializer implements StructuredSerializer<GQLInputField> {
  @override
  final Iterable<Type> types = const [GQLInputField, _$GQLInputField];
  @override
  final String wireName = 'GQLInputField';

  @override
  Iterable serialize(Serializers serializers, GQLInputField object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(GQLInputType)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GQLInputField deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQLInputFieldBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'type':
          result.type.replace(serializers.deserialize(value,
              specifiedType: const FullType(GQLInputType)) as GQLInputType);
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

class _$GQLInputType extends GQLInputType {
  @override
  final String kind;
  @override
  final String name;
  @override
  final GQLInputType ofType;
  @override
  final BuiltList<GQLInputField> inputFields;

  factory _$GQLInputType([void updates(GQLInputTypeBuilder b)]) =>
      (new GQLInputTypeBuilder()..update(updates)).build();

  _$GQLInputType._({this.kind, this.name, this.ofType, this.inputFields})
      : super._() {
    if (kind == null) {
      throw new BuiltValueNullFieldError('GQLInputType', 'kind');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('GQLInputType', 'name');
    }
    if (inputFields == null) {
      throw new BuiltValueNullFieldError('GQLInputType', 'inputFields');
    }
  }

  @override
  GQLInputType rebuild(void updates(GQLInputTypeBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  GQLInputTypeBuilder toBuilder() => new GQLInputTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQLInputType &&
        kind == other.kind &&
        name == other.name &&
        ofType == other.ofType &&
        inputFields == other.inputFields;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, kind.hashCode), name.hashCode), ofType.hashCode),
        inputFields.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GQLInputType')
          ..add('kind', kind)
          ..add('name', name)
          ..add('ofType', ofType)
          ..add('inputFields', inputFields))
        .toString();
  }
}

class GQLInputTypeBuilder
    implements Builder<GQLInputType, GQLInputTypeBuilder> {
  _$GQLInputType _$v;

  String _kind;
  String get kind => _$this._kind;
  set kind(String kind) => _$this._kind = kind;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  GQLInputTypeBuilder _ofType;
  GQLInputTypeBuilder get ofType =>
      _$this._ofType ??= new GQLInputTypeBuilder();
  set ofType(GQLInputTypeBuilder ofType) => _$this._ofType = ofType;

  ListBuilder<GQLInputField> _inputFields;
  ListBuilder<GQLInputField> get inputFields =>
      _$this._inputFields ??= new ListBuilder<GQLInputField>();
  set inputFields(ListBuilder<GQLInputField> inputFields) =>
      _$this._inputFields = inputFields;

  GQLInputTypeBuilder();

  GQLInputTypeBuilder get _$this {
    if (_$v != null) {
      _kind = _$v.kind;
      _name = _$v.name;
      _ofType = _$v.ofType?.toBuilder();
      _inputFields = _$v.inputFields?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQLInputType other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GQLInputType;
  }

  @override
  void update(void updates(GQLInputTypeBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$GQLInputType build() {
    _$GQLInputType _$result;
    try {
      _$result = _$v ??
          new _$GQLInputType._(
              kind: kind,
              name: name,
              ofType: _ofType?.build(),
              inputFields: inputFields.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'ofType';
        _ofType?.build();
        _$failedField = 'inputFields';
        inputFields.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GQLInputType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GQLInputField extends GQLInputField {
  @override
  final GQLInputType type;
  @override
  final String name;

  factory _$GQLInputField([void updates(GQLInputFieldBuilder b)]) =>
      (new GQLInputFieldBuilder()..update(updates)).build();

  _$GQLInputField._({this.type, this.name}) : super._() {
    if (type == null) {
      throw new BuiltValueNullFieldError('GQLInputField', 'type');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('GQLInputField', 'name');
    }
  }

  @override
  GQLInputField rebuild(void updates(GQLInputFieldBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  GQLInputFieldBuilder toBuilder() => new GQLInputFieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQLInputField && type == other.type && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, type.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GQLInputField')
          ..add('type', type)
          ..add('name', name))
        .toString();
  }
}

class GQLInputFieldBuilder
    implements Builder<GQLInputField, GQLInputFieldBuilder> {
  _$GQLInputField _$v;

  GQLInputTypeBuilder _type;
  GQLInputTypeBuilder get type => _$this._type ??= new GQLInputTypeBuilder();
  set type(GQLInputTypeBuilder type) => _$this._type = type;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  GQLInputFieldBuilder();

  GQLInputFieldBuilder get _$this {
    if (_$v != null) {
      _type = _$v.type?.toBuilder();
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQLInputField other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GQLInputField;
  }

  @override
  void update(void updates(GQLInputFieldBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$GQLInputField build() {
    _$GQLInputField _$result;
    try {
      _$result = _$v ?? new _$GQLInputField._(type: type.build(), name: name);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'type';
        type.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GQLInputField', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
