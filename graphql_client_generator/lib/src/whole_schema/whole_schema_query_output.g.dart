// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'whole_schema_query_output.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WholeSchemaQueryOutput> _$wholeSchemaQueryOutputSerializer =
    new _$WholeSchemaQueryOutputSerializer();

class _$WholeSchemaQueryOutputSerializer
    implements StructuredSerializer<WholeSchemaQueryOutput> {
  @override
  final Iterable<Type> types = const [
    WholeSchemaQueryOutput,
    _$WholeSchemaQueryOutput
  ];
  @override
  final String wireName = 'WholeSchemaQueryOutput';

  @override
  Iterable serialize(Serializers serializers, WholeSchemaQueryOutput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__schema',
      serializers.serialize(object.schema,
          specifiedType: const FullType(Schema)),
    ];

    return result;
  }

  @override
  WholeSchemaQueryOutput deserialize(
      Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WholeSchemaQueryOutputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__schema':
          result.schema.replace(serializers.deserialize(value,
              specifiedType: const FullType(Schema)) as Schema);
          break;
      }
    }

    return result.build();
  }
}

class _$WholeSchemaQueryOutput extends WholeSchemaQueryOutput {
  @override
  final Schema schema;

  factory _$WholeSchemaQueryOutput(
          [void updates(WholeSchemaQueryOutputBuilder b)]) =>
      (new WholeSchemaQueryOutputBuilder()..update(updates)).build();

  _$WholeSchemaQueryOutput._({this.schema}) : super._() {
    if (schema == null) {
      throw new BuiltValueNullFieldError('WholeSchemaQueryOutput', 'schema');
    }
  }

  @override
  WholeSchemaQueryOutput rebuild(
          void updates(WholeSchemaQueryOutputBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  WholeSchemaQueryOutputBuilder toBuilder() =>
      new WholeSchemaQueryOutputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WholeSchemaQueryOutput && schema == other.schema;
  }

  @override
  int get hashCode {
    return $jf($jc(0, schema.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WholeSchemaQueryOutput')
          ..add('schema', schema))
        .toString();
  }
}

class WholeSchemaQueryOutputBuilder
    implements Builder<WholeSchemaQueryOutput, WholeSchemaQueryOutputBuilder> {
  _$WholeSchemaQueryOutput _$v;

  SchemaBuilder _schema;
  SchemaBuilder get schema => _$this._schema ??= new SchemaBuilder();
  set schema(SchemaBuilder schema) => _$this._schema = schema;

  WholeSchemaQueryOutputBuilder();

  WholeSchemaQueryOutputBuilder get _$this {
    if (_$v != null) {
      _schema = _$v.schema?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WholeSchemaQueryOutput other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$WholeSchemaQueryOutput;
  }

  @override
  void update(void updates(WholeSchemaQueryOutputBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$WholeSchemaQueryOutput build() {
    _$WholeSchemaQueryOutput _$result;
    try {
      _$result = _$v ?? new _$WholeSchemaQueryOutput._(schema: schema.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'schema';
        schema.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'WholeSchemaQueryOutput', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
