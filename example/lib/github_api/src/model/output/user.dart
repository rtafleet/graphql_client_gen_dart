// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:example/github_api/src/model/output/repository_owner.dart';
import 'package:example/github_api/src/model/output/search_result_item.dart';
import 'package:meta/meta.dart';

part 'user.g.dart';

/// A user is an individual's account on GitHub that owns repositories and can make new content.
abstract class User
    implements Built<User, UserBuilder>, RepositoryOwner, SearchResultItem {
  User._();

  factory User(
      {@required String username,
      @required String avatarUrl,
      String name,
      String type,
      void updates(UserBuilder b)}) {
    assert(username != null, "username is required and must not be null");
    assert(avatarUrl != null, "avatarUrl is required and must not be null");
    return _$User((b) {
      if (name != null) {
        b.name = name;
      }
      if (type != null) {
        b.type = type;
      }
      b.username = username;
      b.avatarUrl = avatarUrl;
      b.update(updates);
    });
  }

  static Serializer<User> get serializer => _$userSerializer;

  /// The user's public profile name.
  @nullable
  String get name;

  /// A convenience field for discriminating between interface implementations
  @nullable
  String get type;
}
