import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:example/github_api/src/model/model.dart';
import 'package:example/github_api/src/operation/operation.dart';
import 'package:example/github_api/src/github_api_json_plugin.dart';
part 'serializers.g.dart';

@SerializersFor([
  SearchResultItemConnection,
  Repository,
  StargazerConnection,
  Organization,
  User,
  RepositoryLockReason,
  RepositoryPermission,
  SubscriptionState,
  SearchReposOutput,
  SearchReposInput
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(GithubApiJsonPlugin(StandardJsonPlugin())))
    .build();
