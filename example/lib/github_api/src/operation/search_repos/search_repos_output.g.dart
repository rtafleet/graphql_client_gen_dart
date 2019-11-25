// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_repos_output.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SearchReposOutput> _$searchReposOutputSerializer =
    new _$SearchReposOutputSerializer();

class _$SearchReposOutputSerializer
    implements StructuredSerializer<SearchReposOutput> {
  @override
  final Iterable<Type> types = const [SearchReposOutput, _$SearchReposOutput];
  @override
  final String wireName = 'SearchReposOutput';

  @override
  Iterable<Object> serialize(Serializers serializers, SearchReposOutput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'search',
      serializers.serialize(object.search,
          specifiedType: const FullType(SearchResultItemConnection)),
    ];

    return result;
  }

  @override
  SearchReposOutput deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SearchReposOutputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'search':
          result.search.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SearchResultItemConnection))
              as SearchResultItemConnection);
          break;
      }
    }

    return result.build();
  }
}

class _$SearchReposOutput extends SearchReposOutput {
  @override
  final SearchResultItemConnection search;

  factory _$SearchReposOutput(
          [void Function(SearchReposOutputBuilder) updates]) =>
      (new SearchReposOutputBuilder()..update(updates)).build();

  _$SearchReposOutput._({this.search}) : super._() {
    if (search == null) {
      throw new BuiltValueNullFieldError('SearchReposOutput', 'search');
    }
  }

  @override
  SearchReposOutput rebuild(void Function(SearchReposOutputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchReposOutputBuilder toBuilder() =>
      new SearchReposOutputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchReposOutput && search == other.search;
  }

  @override
  int get hashCode {
    return $jf($jc(0, search.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchReposOutput')
          ..add('search', search))
        .toString();
  }
}

class SearchReposOutputBuilder
    implements Builder<SearchReposOutput, SearchReposOutputBuilder> {
  _$SearchReposOutput _$v;

  SearchResultItemConnectionBuilder _search;
  SearchResultItemConnectionBuilder get search =>
      _$this._search ??= new SearchResultItemConnectionBuilder();
  set search(SearchResultItemConnectionBuilder search) =>
      _$this._search = search;

  SearchReposOutputBuilder();

  SearchReposOutputBuilder get _$this {
    if (_$v != null) {
      _search = _$v.search?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchReposOutput other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchReposOutput;
  }

  @override
  void update(void Function(SearchReposOutputBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchReposOutput build() {
    _$SearchReposOutput _$result;
    try {
      _$result = _$v ?? new _$SearchReposOutput._(search: search.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'search';
        search.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SearchReposOutput', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
