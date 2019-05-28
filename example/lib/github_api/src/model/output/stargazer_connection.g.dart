// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stargazer_connection.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StargazerConnection> _$stargazerConnectionSerializer =
    new _$StargazerConnectionSerializer();

class _$StargazerConnectionSerializer
    implements StructuredSerializer<StargazerConnection> {
  @override
  final Iterable<Type> types = const [
    StargazerConnection,
    _$StargazerConnection
  ];
  @override
  final String wireName = 'StargazerConnection';

  @override
  Iterable serialize(Serializers serializers, StargazerConnection object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'totalCount',
      serializers.serialize(object.totalCount,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  StargazerConnection deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StargazerConnectionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'totalCount':
          result.totalCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$StargazerConnection extends StargazerConnection {
  @override
  final int totalCount;

  factory _$StargazerConnection([void updates(StargazerConnectionBuilder b)]) =>
      (new StargazerConnectionBuilder()..update(updates)).build();

  _$StargazerConnection._({this.totalCount}) : super._() {
    if (totalCount == null) {
      throw new BuiltValueNullFieldError('StargazerConnection', 'totalCount');
    }
  }

  @override
  StargazerConnection rebuild(void updates(StargazerConnectionBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  StargazerConnectionBuilder toBuilder() =>
      new StargazerConnectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StargazerConnection && totalCount == other.totalCount;
  }

  @override
  int get hashCode {
    return $jf($jc(0, totalCount.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StargazerConnection')
          ..add('totalCount', totalCount))
        .toString();
  }
}

class StargazerConnectionBuilder
    implements Builder<StargazerConnection, StargazerConnectionBuilder> {
  _$StargazerConnection _$v;

  int _totalCount;
  int get totalCount => _$this._totalCount;
  set totalCount(int totalCount) => _$this._totalCount = totalCount;

  StargazerConnectionBuilder();

  StargazerConnectionBuilder get _$this {
    if (_$v != null) {
      _totalCount = _$v.totalCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StargazerConnection other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StargazerConnection;
  }

  @override
  void update(void updates(StargazerConnectionBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$StargazerConnection build() {
    final _$result = _$v ?? new _$StargazerConnection._(totalCount: totalCount);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
