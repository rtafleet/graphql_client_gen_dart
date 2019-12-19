// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';

part 'repository_owner.g.dart';

@BuiltValue(instantiable: false)
abstract class RepositoryOwner {
  /// The username used to login.
  String get username;

  /// A URL pointing to the owner's public avatar.
  String get avatarUrl;
  RepositoryOwner rebuild(void updates(RepositoryOwnerBuilder b));
  RepositoryOwnerBuilder toBuilder();
}
