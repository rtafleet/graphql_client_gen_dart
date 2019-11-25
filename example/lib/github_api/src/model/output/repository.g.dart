// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Repository> _$repositorySerializer = new _$RepositorySerializer();

class _$RepositorySerializer implements StructuredSerializer<Repository> {
  @override
  final Iterable<Type> types = const [Repository, _$Repository];
  @override
  final String wireName = 'Repository';

  @override
  Iterable<Object> serialize(Serializers serializers, Repository object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'hasIssuesEnabled',
      serializers.serialize(object.hasIssuesEnabled,
          specifiedType: const FullType(bool)),
      'isPrivate',
      serializers.serialize(object.isPrivate,
          specifiedType: const FullType(bool)),
      'sshUrl',
      serializers.serialize(object.sshUrl,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'stargazers',
      serializers.serialize(object.stargazers,
          specifiedType: const FullType(StargazerConnection)),
      'viewerHasStarred',
      serializers.serialize(object.viewerHasStarred,
          specifiedType: const FullType(bool)),
      'owner',
      serializers.serialize(object.owner,
          specifiedType: const FullType(RepositoryOwner)),
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
  Repository deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RepositoryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'hasIssuesEnabled':
          result.hasIssuesEnabled = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isPrivate':
          result.isPrivate = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'sshUrl':
          result.sshUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'stargazers':
          result.stargazers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(StargazerConnection))
              as StargazerConnection);
          break;
        case 'viewerHasStarred':
          result.viewerHasStarred = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'owner':
          result.owner = serializers.deserialize(value,
                  specifiedType: const FullType(RepositoryOwner))
              as RepositoryOwner;
          break;
      }
    }

    return result.build();
  }
}

class _$Repository extends Repository {
  @override
  final String id;
  @override
  final String description;
  @override
  final bool hasIssuesEnabled;
  @override
  final bool isPrivate;
  @override
  final String sshUrl;
  @override
  final String name;
  @override
  final StargazerConnection stargazers;
  @override
  final bool viewerHasStarred;
  @override
  final RepositoryOwner owner;

  factory _$Repository([void Function(RepositoryBuilder) updates]) =>
      (new RepositoryBuilder()..update(updates)).build();

  _$Repository._(
      {this.id,
      this.description,
      this.hasIssuesEnabled,
      this.isPrivate,
      this.sshUrl,
      this.name,
      this.stargazers,
      this.viewerHasStarred,
      this.owner})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Repository', 'id');
    }
    if (hasIssuesEnabled == null) {
      throw new BuiltValueNullFieldError('Repository', 'hasIssuesEnabled');
    }
    if (isPrivate == null) {
      throw new BuiltValueNullFieldError('Repository', 'isPrivate');
    }
    if (sshUrl == null) {
      throw new BuiltValueNullFieldError('Repository', 'sshUrl');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Repository', 'name');
    }
    if (stargazers == null) {
      throw new BuiltValueNullFieldError('Repository', 'stargazers');
    }
    if (viewerHasStarred == null) {
      throw new BuiltValueNullFieldError('Repository', 'viewerHasStarred');
    }
    if (owner == null) {
      throw new BuiltValueNullFieldError('Repository', 'owner');
    }
  }

  @override
  Repository rebuild(void Function(RepositoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RepositoryBuilder toBuilder() => new RepositoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Repository &&
        id == other.id &&
        description == other.description &&
        hasIssuesEnabled == other.hasIssuesEnabled &&
        isPrivate == other.isPrivate &&
        sshUrl == other.sshUrl &&
        name == other.name &&
        stargazers == other.stargazers &&
        viewerHasStarred == other.viewerHasStarred &&
        owner == other.owner;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), description.hashCode),
                                hasIssuesEnabled.hashCode),
                            isPrivate.hashCode),
                        sshUrl.hashCode),
                    name.hashCode),
                stargazers.hashCode),
            viewerHasStarred.hashCode),
        owner.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Repository')
          ..add('id', id)
          ..add('description', description)
          ..add('hasIssuesEnabled', hasIssuesEnabled)
          ..add('isPrivate', isPrivate)
          ..add('sshUrl', sshUrl)
          ..add('name', name)
          ..add('stargazers', stargazers)
          ..add('viewerHasStarred', viewerHasStarred)
          ..add('owner', owner))
        .toString();
  }
}

class RepositoryBuilder implements Builder<Repository, RepositoryBuilder> {
  _$Repository _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  bool _hasIssuesEnabled;
  bool get hasIssuesEnabled => _$this._hasIssuesEnabled;
  set hasIssuesEnabled(bool hasIssuesEnabled) =>
      _$this._hasIssuesEnabled = hasIssuesEnabled;

  bool _isPrivate;
  bool get isPrivate => _$this._isPrivate;
  set isPrivate(bool isPrivate) => _$this._isPrivate = isPrivate;

  String _sshUrl;
  String get sshUrl => _$this._sshUrl;
  set sshUrl(String sshUrl) => _$this._sshUrl = sshUrl;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  StargazerConnectionBuilder _stargazers;
  StargazerConnectionBuilder get stargazers =>
      _$this._stargazers ??= new StargazerConnectionBuilder();
  set stargazers(StargazerConnectionBuilder stargazers) =>
      _$this._stargazers = stargazers;

  bool _viewerHasStarred;
  bool get viewerHasStarred => _$this._viewerHasStarred;
  set viewerHasStarred(bool viewerHasStarred) =>
      _$this._viewerHasStarred = viewerHasStarred;

  RepositoryOwner _owner;
  RepositoryOwner get owner => _$this._owner;
  set owner(RepositoryOwner owner) => _$this._owner = owner;

  RepositoryBuilder();

  RepositoryBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _description = _$v.description;
      _hasIssuesEnabled = _$v.hasIssuesEnabled;
      _isPrivate = _$v.isPrivate;
      _sshUrl = _$v.sshUrl;
      _name = _$v.name;
      _stargazers = _$v.stargazers?.toBuilder();
      _viewerHasStarred = _$v.viewerHasStarred;
      _owner = _$v.owner;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Repository other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Repository;
  }

  @override
  void update(void Function(RepositoryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Repository build() {
    _$Repository _$result;
    try {
      _$result = _$v ??
          new _$Repository._(
              id: id,
              description: description,
              hasIssuesEnabled: hasIssuesEnabled,
              isPrivate: isPrivate,
              sshUrl: sshUrl,
              name: name,
              stargazers: stargazers.build(),
              viewerHasStarred: viewerHasStarred,
              owner: owner);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'stargazers';
        stargazers.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Repository', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
