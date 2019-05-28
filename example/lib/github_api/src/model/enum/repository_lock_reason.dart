import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
part 'repository_lock_reason.g.dart';

/// The possible reasons a given repository could be in a locked state.
class RepositoryLockReason extends EnumClass {
  const RepositoryLockReason._(String name) : super(name);

  /// The repository is locked due to a move.
  static const RepositoryLockReason MOVING = _$MOVING;

  /// The repository is locked due to a billing related reason.
  static const RepositoryLockReason BILLING = _$BILLING;

  /// The repository is locked due to a rename.
  static const RepositoryLockReason RENAME = _$RENAME;

  /// The repository is locked due to a migration.
  static const RepositoryLockReason MIGRATING = _$MIGRATING;

  static Serializer<RepositoryLockReason> get serializer =>
      _$repositoryLockReasonSerializer;
  static BuiltSet<RepositoryLockReason> get values => _$values;
  static RepositoryLockReason valueOf(String name) => _$valueOf(name);
}
