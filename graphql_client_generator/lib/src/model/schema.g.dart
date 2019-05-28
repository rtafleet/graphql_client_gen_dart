// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Schema> _$schemaSerializer = new _$SchemaSerializer();

class _$SchemaSerializer implements StructuredSerializer<Schema> {
  @override
  final Iterable<Type> types = const [Schema, _$Schema];
  @override
  final String wireName = 'Schema';

  @override
  Iterable serialize(Serializers serializers, Schema object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'queryType',
      serializers.serialize(object.queryType,
          specifiedType: const FullType(TypeMini)),
      'types',
      serializers.serialize(object.types,
          specifiedType:
              const FullType(BuiltList, const [const FullType(TypeFull)])),
      'directives',
      serializers.serialize(object.directives,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Directive)])),
    ];
    if (object.mutationType != null) {
      result
        ..add('mutationType')
        ..add(serializers.serialize(object.mutationType,
            specifiedType: const FullType(TypeMini)));
    }
    if (object.subscriptionType != null) {
      result
        ..add('subscriptionType')
        ..add(serializers.serialize(object.subscriptionType,
            specifiedType: const FullType(TypeMini)));
    }

    return result;
  }

  @override
  Schema deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SchemaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'queryType':
          result.queryType.replace(serializers.deserialize(value,
              specifiedType: const FullType(TypeMini)) as TypeMini);
          break;
        case 'mutationType':
          result.mutationType.replace(serializers.deserialize(value,
              specifiedType: const FullType(TypeMini)) as TypeMini);
          break;
        case 'subscriptionType':
          result.subscriptionType.replace(serializers.deserialize(value,
              specifiedType: const FullType(TypeMini)) as TypeMini);
          break;
        case 'types':
          result.types.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(TypeFull)])) as BuiltList);
          break;
        case 'directives':
          result.directives.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(Directive)])) as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$Schema extends Schema {
  @override
  final TypeMini queryType;
  @override
  final TypeMini mutationType;
  @override
  final TypeMini subscriptionType;
  @override
  final BuiltList<TypeFull> types;
  @override
  final BuiltList<Directive> directives;

  factory _$Schema([void updates(SchemaBuilder b)]) =>
      (new SchemaBuilder()..update(updates)).build();

  _$Schema._(
      {this.queryType,
      this.mutationType,
      this.subscriptionType,
      this.types,
      this.directives})
      : super._() {
    if (queryType == null) {
      throw new BuiltValueNullFieldError('Schema', 'queryType');
    }
    if (types == null) {
      throw new BuiltValueNullFieldError('Schema', 'types');
    }
    if (directives == null) {
      throw new BuiltValueNullFieldError('Schema', 'directives');
    }
  }

  @override
  Schema rebuild(void updates(SchemaBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SchemaBuilder toBuilder() => new SchemaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Schema &&
        queryType == other.queryType &&
        mutationType == other.mutationType &&
        subscriptionType == other.subscriptionType &&
        types == other.types &&
        directives == other.directives;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, queryType.hashCode), mutationType.hashCode),
                subscriptionType.hashCode),
            types.hashCode),
        directives.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Schema')
          ..add('queryType', queryType)
          ..add('mutationType', mutationType)
          ..add('subscriptionType', subscriptionType)
          ..add('types', types)
          ..add('directives', directives))
        .toString();
  }
}

class SchemaBuilder implements Builder<Schema, SchemaBuilder> {
  _$Schema _$v;

  TypeMiniBuilder _queryType;
  TypeMiniBuilder get queryType => _$this._queryType ??= new TypeMiniBuilder();
  set queryType(TypeMiniBuilder queryType) => _$this._queryType = queryType;

  TypeMiniBuilder _mutationType;
  TypeMiniBuilder get mutationType =>
      _$this._mutationType ??= new TypeMiniBuilder();
  set mutationType(TypeMiniBuilder mutationType) =>
      _$this._mutationType = mutationType;

  TypeMiniBuilder _subscriptionType;
  TypeMiniBuilder get subscriptionType =>
      _$this._subscriptionType ??= new TypeMiniBuilder();
  set subscriptionType(TypeMiniBuilder subscriptionType) =>
      _$this._subscriptionType = subscriptionType;

  ListBuilder<TypeFull> _types;
  ListBuilder<TypeFull> get types =>
      _$this._types ??= new ListBuilder<TypeFull>();
  set types(ListBuilder<TypeFull> types) => _$this._types = types;

  ListBuilder<Directive> _directives;
  ListBuilder<Directive> get directives =>
      _$this._directives ??= new ListBuilder<Directive>();
  set directives(ListBuilder<Directive> directives) =>
      _$this._directives = directives;

  SchemaBuilder();

  SchemaBuilder get _$this {
    if (_$v != null) {
      _queryType = _$v.queryType?.toBuilder();
      _mutationType = _$v.mutationType?.toBuilder();
      _subscriptionType = _$v.subscriptionType?.toBuilder();
      _types = _$v.types?.toBuilder();
      _directives = _$v.directives?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Schema other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Schema;
  }

  @override
  void update(void updates(SchemaBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Schema build() {
    _$Schema _$result;
    try {
      _$result = _$v ??
          new _$Schema._(
              queryType: queryType.build(),
              mutationType: _mutationType?.build(),
              subscriptionType: _subscriptionType?.build(),
              types: types.build(),
              directives: directives.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'queryType';
        queryType.build();
        _$failedField = 'mutationType';
        _mutationType?.build();
        _$failedField = 'subscriptionType';
        _subscriptionType?.build();
        _$failedField = 'types';
        types.build();
        _$failedField = 'directives';
        directives.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Schema', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
