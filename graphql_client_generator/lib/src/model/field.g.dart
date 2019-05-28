// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Field> _$fieldSerializer = new _$FieldSerializer();

class _$FieldSerializer implements StructuredSerializer<Field> {
  @override
  final Iterable<Type> types = const [Field, _$Field];
  @override
  final String wireName = 'Field';

  @override
  Iterable serialize(Serializers serializers, Field object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'args',
      serializers.serialize(object.args,
          specifiedType:
              const FullType(BuiltList, const [const FullType(InputValue)])),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(TypeRef)),
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
  Field deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FieldBuilder();

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
        case 'args':
          result.args.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(InputValue)])) as BuiltList);
          break;
        case 'type':
          result.type.replace(serializers.deserialize(value,
              specifiedType: const FullType(TypeRef)) as TypeRef);
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

class _$Field extends Field {
  @override
  final String name;
  @override
  final String description;
  @override
  final BuiltList<InputValue> args;
  @override
  final TypeRef type;
  @override
  final bool isDeprecated;
  @override
  final String deprecationReason;

  factory _$Field([void updates(FieldBuilder b)]) =>
      (new FieldBuilder()..update(updates)).build();

  _$Field._(
      {this.name,
      this.description,
      this.args,
      this.type,
      this.isDeprecated,
      this.deprecationReason})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('Field', 'name');
    }
    if (args == null) {
      throw new BuiltValueNullFieldError('Field', 'args');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('Field', 'type');
    }
    if (isDeprecated == null) {
      throw new BuiltValueNullFieldError('Field', 'isDeprecated');
    }
  }

  @override
  Field rebuild(void updates(FieldBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  FieldBuilder toBuilder() => new FieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Field &&
        name == other.name &&
        description == other.description &&
        args == other.args &&
        type == other.type &&
        isDeprecated == other.isDeprecated &&
        deprecationReason == other.deprecationReason;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, name.hashCode), description.hashCode),
                    args.hashCode),
                type.hashCode),
            isDeprecated.hashCode),
        deprecationReason.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Field')
          ..add('name', name)
          ..add('description', description)
          ..add('args', args)
          ..add('type', type)
          ..add('isDeprecated', isDeprecated)
          ..add('deprecationReason', deprecationReason))
        .toString();
  }
}

class FieldBuilder implements Builder<Field, FieldBuilder> {
  _$Field _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  ListBuilder<InputValue> _args;
  ListBuilder<InputValue> get args =>
      _$this._args ??= new ListBuilder<InputValue>();
  set args(ListBuilder<InputValue> args) => _$this._args = args;

  TypeRefBuilder _type;
  TypeRefBuilder get type => _$this._type ??= new TypeRefBuilder();
  set type(TypeRefBuilder type) => _$this._type = type;

  bool _isDeprecated;
  bool get isDeprecated => _$this._isDeprecated;
  set isDeprecated(bool isDeprecated) => _$this._isDeprecated = isDeprecated;

  String _deprecationReason;
  String get deprecationReason => _$this._deprecationReason;
  set deprecationReason(String deprecationReason) =>
      _$this._deprecationReason = deprecationReason;

  FieldBuilder();

  FieldBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _description = _$v.description;
      _args = _$v.args?.toBuilder();
      _type = _$v.type?.toBuilder();
      _isDeprecated = _$v.isDeprecated;
      _deprecationReason = _$v.deprecationReason;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Field other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Field;
  }

  @override
  void update(void updates(FieldBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Field build() {
    _$Field _$result;
    try {
      _$result = _$v ??
          new _$Field._(
              name: name,
              description: description,
              args: args.build(),
              type: type.build(),
              isDeprecated: isDeprecated,
              deprecationReason: deprecationReason);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'args';
        args.build();
        _$failedField = 'type';
        type.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Field', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
