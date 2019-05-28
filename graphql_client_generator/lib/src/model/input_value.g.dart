// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_value.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InputValue> _$inputValueSerializer = new _$InputValueSerializer();

class _$InputValueSerializer implements StructuredSerializer<InputValue> {
  @override
  final Iterable<Type> types = const [InputValue, _$InputValue];
  @override
  final String wireName = 'InputValue';

  @override
  Iterable serialize(Serializers serializers, InputValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(TypeRef)),
    ];
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.defaultValue != null) {
      result
        ..add('defaultValue')
        ..add(serializers.serialize(object.defaultValue,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  InputValue deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InputValueBuilder();

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
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type.replace(serializers.deserialize(value,
              specifiedType: const FullType(TypeRef)) as TypeRef);
          break;
        case 'defaultValue':
          result.defaultValue = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$InputValue extends InputValue {
  @override
  final String name;
  @override
  final String description;
  @override
  final TypeRef type;
  @override
  final String defaultValue;

  factory _$InputValue([void updates(InputValueBuilder b)]) =>
      (new InputValueBuilder()..update(updates)).build();

  _$InputValue._({this.name, this.description, this.type, this.defaultValue})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('InputValue', 'name');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('InputValue', 'type');
    }
  }

  @override
  InputValue rebuild(void updates(InputValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  InputValueBuilder toBuilder() => new InputValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InputValue &&
        name == other.name &&
        description == other.description &&
        type == other.type &&
        defaultValue == other.defaultValue;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), description.hashCode), type.hashCode),
        defaultValue.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InputValue')
          ..add('name', name)
          ..add('description', description)
          ..add('type', type)
          ..add('defaultValue', defaultValue))
        .toString();
  }
}

class InputValueBuilder implements Builder<InputValue, InputValueBuilder> {
  _$InputValue _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  TypeRefBuilder _type;
  TypeRefBuilder get type => _$this._type ??= new TypeRefBuilder();
  set type(TypeRefBuilder type) => _$this._type = type;

  String _defaultValue;
  String get defaultValue => _$this._defaultValue;
  set defaultValue(String defaultValue) => _$this._defaultValue = defaultValue;

  InputValueBuilder();

  InputValueBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _description = _$v.description;
      _type = _$v.type?.toBuilder();
      _defaultValue = _$v.defaultValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InputValue other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InputValue;
  }

  @override
  void update(void updates(InputValueBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$InputValue build() {
    _$InputValue _$result;
    try {
      _$result = _$v ??
          new _$InputValue._(
              name: name,
              description: description,
              type: type.build(),
              defaultValue: defaultValue);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'type';
        type.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'InputValue', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
