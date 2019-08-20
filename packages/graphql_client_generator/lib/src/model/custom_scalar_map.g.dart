// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_scalar_map.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CustomScalarMap> _$customScalarMapSerializer =
    new _$CustomScalarMapSerializer();
Serializer<CustomScalar> _$customScalarSerializer =
    new _$CustomScalarSerializer();

class _$CustomScalarMapSerializer
    implements StructuredSerializer<CustomScalarMap> {
  @override
  final Iterable<Type> types = const [CustomScalarMap, _$CustomScalarMap];
  @override
  final String wireName = 'CustomScalarMap';

  @override
  Iterable serialize(Serializers serializers, CustomScalarMap object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'custom_scalars',
      serializers.serialize(object.customScalars,
          specifiedType:
              const FullType(BuiltList, const [const FullType(CustomScalar)])),
    ];

    return result;
  }

  @override
  CustomScalarMap deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CustomScalarMapBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'custom_scalars':
          result.customScalars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CustomScalar)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$CustomScalarSerializer implements StructuredSerializer<CustomScalar> {
  @override
  final Iterable<Type> types = const [CustomScalar, _$CustomScalar];
  @override
  final String wireName = 'CustomScalar';

  @override
  Iterable serialize(Serializers serializers, CustomScalar object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'dart_type',
      serializers.serialize(object.dartType,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  CustomScalar deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CustomScalarBuilder();

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
        case 'dart_type':
          result.dartType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CustomScalarMap extends CustomScalarMap {
  @override
  final BuiltList<CustomScalar> customScalars;

  factory _$CustomScalarMap([void updates(CustomScalarMapBuilder b)]) =>
      (new CustomScalarMapBuilder()..update(updates)).build();

  _$CustomScalarMap._({this.customScalars}) : super._() {
    if (customScalars == null) {
      throw new BuiltValueNullFieldError('CustomScalarMap', 'customScalars');
    }
  }

  @override
  CustomScalarMap rebuild(void updates(CustomScalarMapBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CustomScalarMapBuilder toBuilder() =>
      new CustomScalarMapBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CustomScalarMap && customScalars == other.customScalars;
  }

  @override
  int get hashCode {
    return $jf($jc(0, customScalars.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CustomScalarMap')
          ..add('customScalars', customScalars))
        .toString();
  }
}

class CustomScalarMapBuilder
    implements Builder<CustomScalarMap, CustomScalarMapBuilder> {
  _$CustomScalarMap _$v;

  ListBuilder<CustomScalar> _customScalars;
  ListBuilder<CustomScalar> get customScalars =>
      _$this._customScalars ??= new ListBuilder<CustomScalar>();
  set customScalars(ListBuilder<CustomScalar> customScalars) =>
      _$this._customScalars = customScalars;

  CustomScalarMapBuilder();

  CustomScalarMapBuilder get _$this {
    if (_$v != null) {
      _customScalars = _$v.customScalars?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CustomScalarMap other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CustomScalarMap;
  }

  @override
  void update(void updates(CustomScalarMapBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$CustomScalarMap build() {
    _$CustomScalarMap _$result;
    try {
      _$result =
          _$v ?? new _$CustomScalarMap._(customScalars: customScalars.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'customScalars';
        customScalars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CustomScalarMap', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CustomScalar extends CustomScalar {
  @override
  final String name;
  @override
  final String dartType;

  factory _$CustomScalar([void updates(CustomScalarBuilder b)]) =>
      (new CustomScalarBuilder()..update(updates)).build();

  _$CustomScalar._({this.name, this.dartType}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('CustomScalar', 'name');
    }
    if (dartType == null) {
      throw new BuiltValueNullFieldError('CustomScalar', 'dartType');
    }
  }

  @override
  CustomScalar rebuild(void updates(CustomScalarBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CustomScalarBuilder toBuilder() => new CustomScalarBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CustomScalar &&
        name == other.name &&
        dartType == other.dartType;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), dartType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CustomScalar')
          ..add('name', name)
          ..add('dartType', dartType))
        .toString();
  }
}

class CustomScalarBuilder
    implements Builder<CustomScalar, CustomScalarBuilder> {
  _$CustomScalar _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _dartType;
  String get dartType => _$this._dartType;
  set dartType(String dartType) => _$this._dartType = dartType;

  CustomScalarBuilder();

  CustomScalarBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _dartType = _$v.dartType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CustomScalar other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CustomScalar;
  }

  @override
  void update(void updates(CustomScalarBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$CustomScalar build() {
    final _$result =
        _$v ?? new _$CustomScalar._(name: name, dartType: dartType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
