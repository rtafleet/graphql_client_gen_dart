import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
part 'repository_permission.g.dart';

/// The access level to a repository
class RepositoryPermission extends EnumClass {
  const RepositoryPermission._(String name) : super(name);

  /// Can read, clone, push, and add collaborators
  static const RepositoryPermission ADMIN = _$ADMIN;

  /// Can read, clone and push
  static const RepositoryPermission WRITE = _$WRITE;

  /// Can read and clone
  static const RepositoryPermission READ = _$READ;

  static Serializer<RepositoryPermission> get serializer =>
      _$repositoryPermissionSerializer;
  static BuiltSet<RepositoryPermission> get values => _$values;
  static RepositoryPermission valueOf(String name) => _$valueOf(name);
}
