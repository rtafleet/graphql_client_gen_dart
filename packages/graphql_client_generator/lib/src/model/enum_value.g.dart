// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum_value.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EnumValue> _$enumValueSerializer = new _$EnumValueSerializer();

class _$EnumValueSerializer implements StructuredSerializer<EnumValue> {
  @override
  final Iterable<Type> types = const [EnumValue, _$EnumValue];
  @override
  final String wireName = 'EnumValue';

  @override
  Iterable serialize(Serializers serializers, EnumValue object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'isDeprecated',
      serializers.serialize(object.isDeprecated,
          specifiedType: const FullType(bool)),
    ];
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.deprecationReason != null) {
      result
        ..add('deprecationReason')
        ..add(serializers.serialize(object.deprecationReason,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  EnumValue deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EnumValueBuilder();

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
        case 'isDeprecated':
          result.isDeprecated = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'deprecationReason':
          result.deprecationReason = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$EnumValue extends EnumValue {
  @override
  final String name;
  @override
  final String description;
  @override
  final bool isDeprecated;
  @override
  final String deprecationReason;

  factory _$EnumValue([void updates(EnumValueBuilder b)]) =>
      (new EnumValueBuilder()..update(updates)).build();

  _$EnumValue._(
      {this.name, this.description, this.isDeprecated, this.deprecationReason})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('EnumValue', 'name');
    }
    if (isDeprecated == null) {
      throw new BuiltValueNullFieldError('EnumValue', 'isDeprecated');
    }
  }

  @override
  EnumValue rebuild(void updates(EnumValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  EnumValueBuilder toBuilder() => new EnumValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EnumValue &&
        name == other.name &&
        description == other.description &&
        isDeprecated == other.isDeprecated &&
        deprecationReason == other.deprecationReason;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), description.hashCode),
            isDeprecated.hashCode),
        deprecationReason.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EnumValue')
          ..add('name', name)
          ..add('description', description)
          ..add('isDeprecated', isDeprecated)
          ..add('deprecationReason', deprecationReason))
        .toString();
  }
}

class EnumValueBuilder implements Builder<EnumValue, EnumValueBuilder> {
  _$EnumValue _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  bool _isDeprecated;
  bool get isDeprecated => _$this._isDeprecated;
  set isDeprecated(bool isDeprecated) => _$this._isDeprecated = isDeprecated;

  String _deprecationReason;
  String get deprecationReason => _$this._deprecationReason;
  set deprecationReason(String deprecationReason) =>
      _$this._deprecationReason = deprecationReason;

  EnumValueBuilder();

  EnumValueBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _description = _$v.description;
      _isDeprecated = _$v.isDeprecated;
      _deprecationReason = _$v.deprecationReason;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnumValue other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EnumValue;
  }

  @override
  void update(void updates(EnumValueBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$EnumValue build() {
    final _$result = _$v ??
        new _$EnumValue._(
            name: name,
            description: description,
            isDeprecated: isDeprecated,
            deprecationReason: deprecationReason);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
