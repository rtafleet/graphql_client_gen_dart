// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directive.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Directive> _$directiveSerializer = new _$DirectiveSerializer();

class _$DirectiveSerializer implements StructuredSerializer<Directive> {
  @override
  final Iterable<Type> types = const [Directive, _$Directive];
  @override
  final String wireName = 'Directive';

  @override
  Iterable serialize(Serializers serializers, Directive object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'locations',
      serializers.serialize(object.locations,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'args',
      serializers.serialize(object.args,
          specifiedType:
              const FullType(BuiltList, const [const FullType(InputValue)])),
    ];
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  Directive deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DirectiveBuilder();

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
        case 'locations':
          result.locations.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
        case 'args':
          result.args.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(InputValue)])) as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$Directive extends Directive {
  @override
  final String name;
  @override
  final String description;
  @override
  final BuiltList<String> locations;
  @override
  final BuiltList<InputValue> args;

  factory _$Directive([void updates(DirectiveBuilder b)]) =>
      (new DirectiveBuilder()..update(updates)).build();

  _$Directive._({this.name, this.description, this.locations, this.args})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('Directive', 'name');
    }
    if (locations == null) {
      throw new BuiltValueNullFieldError('Directive', 'locations');
    }
    if (args == null) {
      throw new BuiltValueNullFieldError('Directive', 'args');
    }
  }

  @override
  Directive rebuild(void updates(DirectiveBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DirectiveBuilder toBuilder() => new DirectiveBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Directive &&
        name == other.name &&
        description == other.description &&
        locations == other.locations &&
        args == other.args;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), description.hashCode),
            locations.hashCode),
        args.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Directive')
          ..add('name', name)
          ..add('description', description)
          ..add('locations', locations)
          ..add('args', args))
        .toString();
  }
}

class DirectiveBuilder implements Builder<Directive, DirectiveBuilder> {
  _$Directive _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  ListBuilder<String> _locations;
  ListBuilder<String> get locations =>
      _$this._locations ??= new ListBuilder<String>();
  set locations(ListBuilder<String> locations) => _$this._locations = locations;

  ListBuilder<InputValue> _args;
  ListBuilder<InputValue> get args =>
      _$this._args ??= new ListBuilder<InputValue>();
  set args(ListBuilder<InputValue> args) => _$this._args = args;

  DirectiveBuilder();

  DirectiveBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _description = _$v.description;
      _locations = _$v.locations?.toBuilder();
      _args = _$v.args?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Directive other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Directive;
  }

  @override
  void update(void updates(DirectiveBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Directive build() {
    _$Directive _$result;
    try {
      _$result = _$v ??
          new _$Directive._(
              name: name,
              description: description,
              locations: locations.build(),
              args: args.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'locations';
        locations.build();
        _$failedField = 'args';
        args.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Directive', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
