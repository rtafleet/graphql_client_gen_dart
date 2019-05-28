import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:example/github_api/src/model/output/repository_owner.dart';
import 'package:example/github_api/src/model/output/search_result_item.dart';
import 'package:meta/meta.dart';
part 'organization.g.dart';

/// An account on GitHub, with one or more owners, that has repositories, members and teams.
abstract class Organization
    implements
        Built<Organization, OrganizationBuilder>,
        RepositoryOwner,
        SearchResultItem {
  Organization._();

  factory Organization(
      {@required String username,
      @required String avatarUrl,
      String name,
      String type,
      void updates(OrganizationBuilder b)}) {
    assert(username != null, "username is required and must not be null");
    assert(avatarUrl != null, "avatarUrl is required and must not be null");
    return _$Organization((b) {
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

  static Serializer<Organization> get serializer => _$organizationSerializer;

  /// The organization's public profile name.
  @nullable
  String get name;

  /// A convenience field for discriminating between interface implementations
  @nullable
  String get type;
}
