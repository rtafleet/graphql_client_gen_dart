// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:example/github_api/src/model/output/search_result_item.dart';
import 'package:meta/meta.dart';

part 'search_result_item_connection.g.dart';

/// A list of results that matched against a search query.
abstract class SearchResultItemConnection
    implements
        Built<SearchResultItemConnection, SearchResultItemConnectionBuilder> {
  SearchResultItemConnection._();

  factory SearchResultItemConnection(
      {@required int repositoryCount,
      Iterable<SearchResultItem> nodes,
      void updates(SearchResultItemConnectionBuilder b)}) {
    assert(repositoryCount != null,
        "repositoryCount is required and must not be null");
    return _$SearchResultItemConnection((b) {
      b.repositoryCount = repositoryCount;
      if (nodes != null) {
        b.nodes.replace(nodes);
      }
      b.update(updates);
    });
  }

  static Serializer<SearchResultItemConnection> get serializer =>
      _$searchResultItemConnectionSerializer;

  /// The number of repositories that matched the search query.
  int get repositoryCount;

  /// A list of nodes.
  @nullable
  BuiltList<SearchResultItem> get nodes;
}
