// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_permission.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const RepositoryPermission _$ADMIN = const RepositoryPermission._('ADMIN');
const RepositoryPermission _$MAINTAIN =
    const RepositoryPermission._('MAINTAIN');
const RepositoryPermission _$WRITE = const RepositoryPermission._('WRITE');
const RepositoryPermission _$TRIAGE = const RepositoryPermission._('TRIAGE');
const RepositoryPermission _$READ = const RepositoryPermission._('READ');

RepositoryPermission _$valueOf(String name) {
  switch (name) {
    case 'ADMIN':
      return _$ADMIN;
    case 'MAINTAIN':
      return _$MAINTAIN;
    case 'WRITE':
      return _$WRITE;
    case 'TRIAGE':
      return _$TRIAGE;
    case 'READ':
      return _$READ;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<RepositoryPermission> _$values =
    new BuiltSet<RepositoryPermission>(const <RepositoryPermission>[
  _$ADMIN,
  _$MAINTAIN,
  _$WRITE,
  _$TRIAGE,
  _$READ,
]);

Serializer<RepositoryPermission> _$repositoryPermissionSerializer =
    new _$RepositoryPermissionSerializer();

class _$RepositoryPermissionSerializer
    implements PrimitiveSerializer<RepositoryPermission> {
  @override
  final Iterable<Type> types = const <Type>[RepositoryPermission];
  @override
  final String wireName = 'RepositoryPermission';

  @override
  Object serialize(Serializers serializers, RepositoryPermission object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  RepositoryPermission deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      RepositoryPermission.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
