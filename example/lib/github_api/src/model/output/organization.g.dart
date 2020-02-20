// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Organization> _$organizationSerializer =
    new _$OrganizationSerializer();

class _$OrganizationSerializer implements StructuredSerializer<Organization> {
  @override
  final Iterable<Type> types = const [Organization, _$Organization];
  @override
  final String wireName = 'Organization';

  @override
  Iterable<Object> serialize(Serializers serializers, Organization object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'avatarUrl',
      serializers.serialize(object.avatarUrl,
          specifiedType: const FullType(String)),
    ];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.type != null) {
      result
        ..add('type')
        ..add(serializers.serialize(object.type,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Organization deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrganizationBuilder();

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
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'avatarUrl':
          result.avatarUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Organization extends Organization {
  @override
  final String name;
  @override
  final String type;
  @override
  final String username;
  @override
  final String avatarUrl;

  factory _$Organization([void Function(OrganizationBuilder) updates]) =>
      (new OrganizationBuilder()..update(updates)).build();

  _$Organization._({this.name, this.type, this.username, this.avatarUrl})
      : super._() {
    if (username == null) {
      throw new BuiltValueNullFieldError('Organization', 'username');
    }
    if (avatarUrl == null) {
      throw new BuiltValueNullFieldError('Organization', 'avatarUrl');
    }
  }

  @override
  Organization rebuild(void Function(OrganizationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrganizationBuilder toBuilder() => new OrganizationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Organization &&
        name == other.name &&
        type == other.type &&
        username == other.username &&
        avatarUrl == other.avatarUrl;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), type.hashCode), username.hashCode),
        avatarUrl.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Organization')
          ..add('name', name)
          ..add('type', type)
          ..add('username', username)
          ..add('avatarUrl', avatarUrl))
        .toString();
  }
}

class OrganizationBuilder
    implements
        Builder<Organization, OrganizationBuilder>,
        RepositoryOwnerBuilder,
        SearchResultItemBuilder {
  _$Organization _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _avatarUrl;
  String get avatarUrl => _$this._avatarUrl;
  set avatarUrl(String avatarUrl) => _$this._avatarUrl = avatarUrl;

  OrganizationBuilder();

  OrganizationBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _type = _$v.type;
      _username = _$v.username;
      _avatarUrl = _$v.avatarUrl;
      _$v = null;
    }
    return this;
  }

  @override
// ignore: override_on_non_overriding_method
  void replace(covariant Organization other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Organization;
  }

  @override
  void update(void Function(OrganizationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Organization build() {
    final _$result = _$v ??
        new _$Organization._(
            name: name, type: type, username: username, avatarUrl: avatarUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
