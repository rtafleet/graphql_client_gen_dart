// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_repos_input.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SearchReposInput> _$searchReposInputSerializer =
    new _$SearchReposInputSerializer();

class _$SearchReposInputSerializer
    implements StructuredSerializer<SearchReposInput> {
  @override
  final Iterable<Type> types = const [SearchReposInput, _$SearchReposInput];
  @override
  final String wireName = 'SearchReposInput';

  @override
  Iterable<Object> serialize(Serializers serializers, SearchReposInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'queryString',
      serializers.serialize(object.queryString,
          specifiedType: const FullType(String)),
      'first',
      serializers.serialize(object.first, specifiedType: const FullType(int)),
      'avatarSize',
      serializers.serialize(object.avatarSize,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  SearchReposInput deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SearchReposInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'queryString':
          result.queryString = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'first':
          result.first = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'avatarSize':
          result.avatarSize = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$SearchReposInput extends SearchReposInput {
  @override
  final String queryString;
  @override
  final int first;
  @override
  final int avatarSize;

  factory _$SearchReposInput(
          [void Function(SearchReposInputBuilder) updates]) =>
      (new SearchReposInputBuilder()..update(updates)).build();

  _$SearchReposInput._({this.queryString, this.first, this.avatarSize})
      : super._() {
    if (queryString == null) {
      throw new BuiltValueNullFieldError('SearchReposInput', 'queryString');
    }
    if (first == null) {
      throw new BuiltValueNullFieldError('SearchReposInput', 'first');
    }
    if (avatarSize == null) {
      throw new BuiltValueNullFieldError('SearchReposInput', 'avatarSize');
    }
  }

  @override
  SearchReposInput rebuild(void Function(SearchReposInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchReposInputBuilder toBuilder() =>
      new SearchReposInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchReposInput &&
        queryString == other.queryString &&
        first == other.first &&
        avatarSize == other.avatarSize;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, queryString.hashCode), first.hashCode),
        avatarSize.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchReposInput')
          ..add('queryString', queryString)
          ..add('first', first)
          ..add('avatarSize', avatarSize))
        .toString();
  }
}

class SearchReposInputBuilder
    implements Builder<SearchReposInput, SearchReposInputBuilder> {
  _$SearchReposInput _$v;

  String _queryString;
  String get queryString => _$this._queryString;
  set queryString(String queryString) => _$this._queryString = queryString;

  int _first;
  int get first => _$this._first;
  set first(int first) => _$this._first = first;

  int _avatarSize;
  int get avatarSize => _$this._avatarSize;
  set avatarSize(int avatarSize) => _$this._avatarSize = avatarSize;

  SearchReposInputBuilder();

  SearchReposInputBuilder get _$this {
    if (_$v != null) {
      _queryString = _$v.queryString;
      _first = _$v.first;
      _avatarSize = _$v.avatarSize;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchReposInput other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchReposInput;
  }

  @override
  void update(void Function(SearchReposInputBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchReposInput build() {
    final _$result = _$v ??
        new _$SearchReposInput._(
            queryString: queryString, first: first, avatarSize: avatarSize);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
