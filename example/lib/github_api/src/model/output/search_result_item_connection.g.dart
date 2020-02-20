// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_item_connection.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SearchResultItemConnection> _$searchResultItemConnectionSerializer =
    new _$SearchResultItemConnectionSerializer();

class _$SearchResultItemConnectionSerializer
    implements StructuredSerializer<SearchResultItemConnection> {
  @override
  final Iterable<Type> types = const [
    SearchResultItemConnection,
    _$SearchResultItemConnection
  ];
  @override
  final String wireName = 'SearchResultItemConnection';

  @override
  Iterable<Object> serialize(
      Serializers serializers, SearchResultItemConnection object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'repositoryCount',
      serializers.serialize(object.repositoryCount,
          specifiedType: const FullType(int)),
    ];
    if (object.nodes != null) {
      result
        ..add('nodes')
        ..add(serializers.serialize(object.nodes,
            specifiedType: const FullType(
                BuiltList, const [const FullType(SearchResultItem)])));
    }
    return result;
  }

  @override
  SearchResultItemConnection deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SearchResultItemConnectionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'repositoryCount':
          result.repositoryCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'nodes':
          result.nodes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SearchResultItem)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$SearchResultItemConnection extends SearchResultItemConnection {
  @override
  final int repositoryCount;
  @override
  final BuiltList<SearchResultItem> nodes;

  factory _$SearchResultItemConnection(
          [void Function(SearchResultItemConnectionBuilder) updates]) =>
      (new SearchResultItemConnectionBuilder()..update(updates)).build();

  _$SearchResultItemConnection._({this.repositoryCount, this.nodes})
      : super._() {
    if (repositoryCount == null) {
      throw new BuiltValueNullFieldError(
          'SearchResultItemConnection', 'repositoryCount');
    }
  }

  @override
  SearchResultItemConnection rebuild(
          void Function(SearchResultItemConnectionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchResultItemConnectionBuilder toBuilder() =>
      new SearchResultItemConnectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchResultItemConnection &&
        repositoryCount == other.repositoryCount &&
        nodes == other.nodes;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, repositoryCount.hashCode), nodes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchResultItemConnection')
          ..add('repositoryCount', repositoryCount)
          ..add('nodes', nodes))
        .toString();
  }
}

class SearchResultItemConnectionBuilder
    implements
        Builder<SearchResultItemConnection, SearchResultItemConnectionBuilder> {
  _$SearchResultItemConnection _$v;

  int _repositoryCount;
  int get repositoryCount => _$this._repositoryCount;
  set repositoryCount(int repositoryCount) =>
      _$this._repositoryCount = repositoryCount;

  ListBuilder<SearchResultItem> _nodes;
  ListBuilder<SearchResultItem> get nodes =>
      _$this._nodes ??= new ListBuilder<SearchResultItem>();
  set nodes(ListBuilder<SearchResultItem> nodes) => _$this._nodes = nodes;

  SearchResultItemConnectionBuilder();

  SearchResultItemConnectionBuilder get _$this {
    if (_$v != null) {
      _repositoryCount = _$v.repositoryCount;
      _nodes = _$v.nodes?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchResultItemConnection other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchResultItemConnection;
  }

  @override
  void update(void Function(SearchResultItemConnectionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchResultItemConnection build() {
    _$SearchResultItemConnection _$result;
    try {
      _$result = _$v ??
          new _$SearchResultItemConnection._(
              repositoryCount: repositoryCount, nodes: _nodes?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'nodes';
        _nodes?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SearchResultItemConnection', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
