import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:example/github_api/src/model/output/stargazer_connection.dart';
import 'package:example/github_api/src/model/output/repository_owner.dart';
import 'package:example/github_api/src/model/output/search_result_item.dart';
import 'package:meta/meta.dart';
part 'repository.g.dart';

/// A repository contains the content for a project.
abstract class Repository
    implements Built<Repository, RepositoryBuilder>, SearchResultItem {
  Repository._();

  factory Repository(
      {@required String id,
      @required bool hasIssuesEnabled,
      @required bool isPrivate,
      @required String sshUrl,
      @required String name,
      @required StargazerConnection stargazers,
      @required bool viewerHasStarred,
      @required RepositoryOwner owner,
      String description,
      void updates(RepositoryBuilder b)}) {
    assert(id != null, "id is required and must not be null");
    assert(hasIssuesEnabled != null,
        "hasIssuesEnabled is required and must not be null");
    assert(isPrivate != null, "isPrivate is required and must not be null");
    assert(sshUrl != null, "sshUrl is required and must not be null");
    assert(name != null, "name is required and must not be null");
    assert(stargazers != null, "stargazers is required and must not be null");
    assert(viewerHasStarred != null,
        "viewerHasStarred is required and must not be null");
    assert(owner != null, "owner is required and must not be null");
    return _$Repository((b) {
      b.id = id;
      if (description != null) {
        b.description = description;
      }
      b.hasIssuesEnabled = hasIssuesEnabled;
      b.isPrivate = isPrivate;
      b.sshUrl = sshUrl;
      b.name = name;
      b.stargazers.replace(stargazers);
      b.viewerHasStarred = viewerHasStarred;
      b.owner = owner;
      b.update(updates);
    });
  }

  static Serializer<Repository> get serializer => _$repositorySerializer;
  String get id;

  /// The description of the repository.
  @nullable
  String get description;

  /// Indicates if the repository has issues feature enabled.
  bool get hasIssuesEnabled;

  /// Identifies if the repository is private.
  bool get isPrivate;

  /// The SSH URL to clone this repository
  String get sshUrl;

  /// The name of the repository.
  String get name;

  /// A list of users who have starred this starrable.
  StargazerConnection get stargazers;

  /// Returns a boolean indicating whether the viewing user has starred this starrable.
  bool get viewerHasStarred;

  /// The User owner of the repository.
  RepositoryOwner get owner;
}
