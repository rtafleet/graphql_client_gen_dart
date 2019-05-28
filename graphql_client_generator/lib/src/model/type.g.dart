// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TypeRef> _$typeRefSerializer = new _$TypeRefSerializer();
Serializer<TypeMini> _$typeMiniSerializer = new _$TypeMiniSerializer();
Serializer<TypeFull> _$typeFullSerializer = new _$TypeFullSerializer();

class _$TypeRefSerializer implements StructuredSerializer<TypeRef> {
  @override
  final Iterable<Type> types = const [TypeRef, _$TypeRef];
  @override
  final String wireName = 'TypeRef';

  @override
  Iterable serialize(Serializers serializers, TypeRef object,
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
            specifiedType: const FullType(TypeRef)));
    }

    return result;
  }

  @override
  TypeRef deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TypeRefBuilder();

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
              specifiedType: const FullType(TypeRef)) as TypeRef);
          break;
      }
    }

    return result.build();
  }
}

class _$TypeMiniSerializer implements StructuredSerializer<TypeMini> {
  @override
  final Iterable<Type> types = const [TypeMini, _$TypeMini];
  @override
  final String wireName = 'TypeMini';

  @override
  Iterable serialize(Serializers serializers, TypeMini object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  TypeMini deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TypeMiniBuilder();

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

class _$TypeFullSerializer implements StructuredSerializer<TypeFull> {
  @override
  final Iterable<Type> types = const [TypeFull, _$TypeFull];
  @override
  final String wireName = 'TypeFull';

  @override
  Iterable serialize(Serializers serializers, TypeFull object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'kind',
      serializers.serialize(object.kind, specifiedType: const FullType(String)),
      'fields',
      serializers.serialize(object.fields,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Field)])),
      'interfaces',
      serializers.serialize(object.interfaces,
          specifiedType:
              const FullType(BuiltList, const [const FullType(TypeRef)])),
      'enumValues',
      serializers.serialize(object.enumValues,
          specifiedType:
              const FullType(BuiltList, const [const FullType(EnumValue)])),
      'possibleTypes',
      serializers.serialize(object.possibleTypes,
          specifiedType:
              const FullType(BuiltList, const [const FullType(TypeRef)])),
      'inputFields',
      serializers.serialize(object.inputFields,
          specifiedType:
              const FullType(BuiltList, const [const FullType(InputValue)])),
    ];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  TypeFull deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TypeFullBuilder();

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
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fields':
          result.fields.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Field)]))
              as BuiltList);
          break;
        case 'interfaces':
          result.interfaces.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(TypeRef)])) as BuiltList);
          break;
        case 'enumValues':
          result.enumValues.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(EnumValue)])) as BuiltList);
          break;
        case 'possibleTypes':
          result.possibleTypes.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(TypeRef)])) as BuiltList);
          break;
        case 'inputFields':
          result.inputFields.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(InputValue)])) as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$TypeRef extends TypeRef {
  @override
  final String kind;
  @override
  final String name;
  @override
  final TypeRef ofType;

  factory _$TypeRef([void updates(TypeRefBuilder b)]) =>
      (new TypeRefBuilder()..update(updates)).build();

  _$TypeRef._({this.kind, this.name, this.ofType}) : super._() {
    if (kind == null) {
      throw new BuiltValueNullFieldError('TypeRef', 'kind');
    }
  }

  @override
  TypeRef rebuild(void updates(TypeRefBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TypeRefBuilder toBuilder() => new TypeRefBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TypeRef &&
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
    return (newBuiltValueToStringHelper('TypeRef')
          ..add('kind', kind)
          ..add('name', name)
          ..add('ofType', ofType))
        .toString();
  }
}

class TypeRefBuilder implements Builder<TypeRef, TypeRefBuilder> {
  _$TypeRef _$v;

  String _kind;
  String get kind => _$this._kind;
  set kind(String kind) => _$this._kind = kind;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  TypeRefBuilder _ofType;
  TypeRefBuilder get ofType => _$this._ofType ??= new TypeRefBuilder();
  set ofType(TypeRefBuilder ofType) => _$this._ofType = ofType;

  TypeRefBuilder();

  TypeRefBuilder get _$this {
    if (_$v != null) {
      _kind = _$v.kind;
      _name = _$v.name;
      _ofType = _$v.ofType?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TypeRef other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TypeRef;
  }

  @override
  void update(void updates(TypeRefBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$TypeRef build() {
    _$TypeRef _$result;
    try {
      _$result = _$v ??
          new _$TypeRef._(kind: kind, name: name, ofType: _ofType?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'ofType';
        _ofType?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TypeRef', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$TypeMini extends TypeMini {
  @override
  final String name;

  factory _$TypeMini([void updates(TypeMiniBuilder b)]) =>
      (new TypeMiniBuilder()..update(updates)).build();

  _$TypeMini._({this.name}) : super._();

  @override
  TypeMini rebuild(void updates(TypeMiniBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TypeMiniBuilder toBuilder() => new TypeMiniBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TypeMini && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(0, name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TypeMini')..add('name', name))
        .toString();
  }
}

class TypeMiniBuilder implements Builder<TypeMini, TypeMiniBuilder> {
  _$TypeMini _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  TypeMiniBuilder();

  TypeMiniBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TypeMini other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TypeMini;
  }

  @override
  void update(void updates(TypeMiniBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$TypeMini build() {
    final _$result = _$v ?? new _$TypeMini._(name: name);
    replace(_$result);
    return _$result;
  }
}

class _$TypeFull extends TypeFull {
  @override
  final String kind;
  @override
  final String name;
  @override
  final String description;
  @override
  final BuiltList<Field> fields;
  @override
  final BuiltList<TypeRef> interfaces;
  @override
  final BuiltList<EnumValue> enumValues;
  @override
  final BuiltList<TypeRef> possibleTypes;
  @override
  final BuiltList<InputValue> inputFields;

  factory _$TypeFull([void updates(TypeFullBuilder b)]) =>
      (new TypeFullBuilder()..update(updates)).build();

  _$TypeFull._(
      {this.kind,
      this.name,
      this.description,
      this.fields,
      this.interfaces,
      this.enumValues,
      this.possibleTypes,
      this.inputFields})
      : super._() {
    if (kind == null) {
      throw new BuiltValueNullFieldError('TypeFull', 'kind');
    }
    if (fields == null) {
      throw new BuiltValueNullFieldError('TypeFull', 'fields');
    }
    if (interfaces == null) {
      throw new BuiltValueNullFieldError('TypeFull', 'interfaces');
    }
    if (enumValues == null) {
      throw new BuiltValueNullFieldError('TypeFull', 'enumValues');
    }
    if (possibleTypes == null) {
      throw new BuiltValueNullFieldError('TypeFull', 'possibleTypes');
    }
    if (inputFields == null) {
      throw new BuiltValueNullFieldError('TypeFull', 'inputFields');
    }
  }

  @override
  TypeFull rebuild(void updates(TypeFullBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TypeFullBuilder toBuilder() => new TypeFullBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TypeFull &&
        kind == other.kind &&
        name == other.name &&
        description == other.description &&
        fields == other.fields &&
        interfaces == other.interfaces &&
        enumValues == other.enumValues &&
        possibleTypes == other.possibleTypes &&
        inputFields == other.inputFields;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, kind.hashCode), name.hashCode),
                            description.hashCode),
                        fields.hashCode),
                    interfaces.hashCode),
                enumValues.hashCode),
            possibleTypes.hashCode),
        inputFields.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TypeFull')
          ..add('kind', kind)
          ..add('name', name)
          ..add('description', description)
          ..add('fields', fields)
          ..add('interfaces', interfaces)
          ..add('enumValues', enumValues)
          ..add('possibleTypes', possibleTypes)
          ..add('inputFields', inputFields))
        .toString();
  }
}

class TypeFullBuilder implements Builder<TypeFull, TypeFullBuilder> {
  _$TypeFull _$v;

  String _kind;
  String get kind => _$this._kind;
  set kind(String kind) => _$this._kind = kind;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  ListBuilder<Field> _fields;
  ListBuilder<Field> get fields => _$this._fields ??= new ListBuilder<Field>();
  set fields(ListBuilder<Field> fields) => _$this._fields = fields;

  ListBuilder<TypeRef> _interfaces;
  ListBuilder<TypeRef> get interfaces =>
      _$this._interfaces ??= new ListBuilder<TypeRef>();
  set interfaces(ListBuilder<TypeRef> interfaces) =>
      _$this._interfaces = interfaces;

  ListBuilder<EnumValue> _enumValues;
  ListBuilder<EnumValue> get enumValues =>
      _$this._enumValues ??= new ListBuilder<EnumValue>();
  set enumValues(ListBuilder<EnumValue> enumValues) =>
      _$this._enumValues = enumValues;

  ListBuilder<TypeRef> _possibleTypes;
  ListBuilder<TypeRef> get possibleTypes =>
      _$this._possibleTypes ??= new ListBuilder<TypeRef>();
  set possibleTypes(ListBuilder<TypeRef> possibleTypes) =>
      _$this._possibleTypes = possibleTypes;

  ListBuilder<InputValue> _inputFields;
  ListBuilder<InputValue> get inputFields =>
      _$this._inputFields ??= new ListBuilder<InputValue>();
  set inputFields(ListBuilder<InputValue> inputFields) =>
      _$this._inputFields = inputFields;

  TypeFullBuilder();

  TypeFullBuilder get _$this {
    if (_$v != null) {
      _kind = _$v.kind;
      _name = _$v.name;
      _description = _$v.description;
      _fields = _$v.fields?.toBuilder();
      _interfaces = _$v.interfaces?.toBuilder();
      _enumValues = _$v.enumValues?.toBuilder();
      _possibleTypes = _$v.possibleTypes?.toBuilder();
      _inputFields = _$v.inputFields?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TypeFull other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TypeFull;
  }

  @override
  void update(void updates(TypeFullBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$TypeFull build() {
    _$TypeFull _$result;
    try {
      _$result = _$v ??
          new _$TypeFull._(
              kind: kind,
              name: name,
              description: description,
              fields: fields.build(),
              interfaces: interfaces.build(),
              enumValues: enumValues.build(),
              possibleTypes: possibleTypes.build(),
              inputFields: inputFields.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'fields';
        fields.build();
        _$failedField = 'interfaces';
        interfaces.build();
        _$failedField = 'enumValues';
        enumValues.build();
        _$failedField = 'possibleTypes';
        possibleTypes.build();
        _$failedField = 'inputFields';
        inputFields.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TypeFull', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
