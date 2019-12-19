// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'repository_permission.g.dart';

/// The access level to a repository
class RepositoryPermission extends EnumClass {
  const RepositoryPermission._(String name) : super(name);

  /// Can read, clone, and push to this repository. Can also manage issues, pull requests, and repository settings, including adding collaborators
  static const RepositoryPermission ADMIN = _$ADMIN;

  /// Can read, clone, and push to this repository. They can also manage issues, pull requests, and some repository settings
  static const RepositoryPermission MAINTAIN = _$MAINTAIN;

  /// Can read, clone, and push to this repository. Can also manage issues and pull requests
  static const RepositoryPermission WRITE = _$WRITE;

  /// Can read and clone this repository. Can also manage issues and pull requests
  static const RepositoryPermission TRIAGE = _$TRIAGE;

  /// Can read and clone this repository. Can also open and comment on issues and pull requests
  static const RepositoryPermission READ = _$READ;

  static Serializer<RepositoryPermission> get serializer =>
      _$repositoryPermissionSerializer;
  static BuiltSet<RepositoryPermission> get values => _$values;
  static RepositoryPermission valueOf(String name) => _$valueOf(name);
}
