// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:example/github_api/src/model/output/search_result_item_connection.dart';
import 'package:example/github_api/src/serializers.dart';
import 'package:meta/meta.dart';

part 'search_repos_output.g.dart';

/// The query root of GitHub's GraphQL interface.
abstract class SearchReposOutput
    implements Built<SearchReposOutput, SearchReposOutputBuilder> {
  SearchReposOutput._();

  factory SearchReposOutput(
      {@required SearchResultItemConnection search,
      void updates(SearchReposOutputBuilder b)}) {
    assert(search != null, "search is required and must not be null");
    return _$SearchReposOutput((b) {
      b.search.replace(search);
      b.update(updates);
    });
  }

  static Serializer<SearchReposOutput> get serializer =>
      _$searchReposOutputSerializer;

  /// Perform a search across resources.
  SearchResultItemConnection get search;
  static SearchReposOutput fromGQLMap(Map<String, dynamic> data) =>
      serializers.deserializeWith(SearchReposOutput.serializer, data);
}
