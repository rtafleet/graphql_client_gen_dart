// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_lock_reason.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const RepositoryLockReason _$MOVING = const RepositoryLockReason._('MOVING');
const RepositoryLockReason _$BILLING = const RepositoryLockReason._('BILLING');
const RepositoryLockReason _$RENAME = const RepositoryLockReason._('RENAME');
const RepositoryLockReason _$MIGRATING =
    const RepositoryLockReason._('MIGRATING');

RepositoryLockReason _$valueOf(String name) {
  switch (name) {
    case 'MOVING':
      return _$MOVING;
    case 'BILLING':
      return _$BILLING;
    case 'RENAME':
      return _$RENAME;
    case 'MIGRATING':
      return _$MIGRATING;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<RepositoryLockReason> _$values =
    new BuiltSet<RepositoryLockReason>(const <RepositoryLockReason>[
  _$MOVING,
  _$BILLING,
  _$RENAME,
  _$MIGRATING,
]);

Serializer<RepositoryLockReason> _$repositoryLockReasonSerializer =
    new _$RepositoryLockReasonSerializer();

class _$RepositoryLockReasonSerializer
    implements PrimitiveSerializer<RepositoryLockReason> {
  @override
  final Iterable<Type> types = const <Type>[RepositoryLockReason];
  @override
  final String wireName = 'RepositoryLockReason';

  @override
  Object serialize(Serializers serializers, RepositoryLockReason object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  RepositoryLockReason deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      RepositoryLockReason.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
