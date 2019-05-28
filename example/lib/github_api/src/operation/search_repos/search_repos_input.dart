import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:example/github_api/src/serializers.dart';
import 'package:meta/meta.dart';
part 'search_repos_input.g.dart';

abstract class SearchReposInput
    implements Built<SearchReposInput, SearchReposInputBuilder> {
  SearchReposInput._();

  factory SearchReposInput(
      {@required String queryString,
      @required int first,
      @required int avatarSize,
      void updates(SearchReposInputBuilder b)}) {
    assert(queryString != null, "queryString is required and must not be null");
    assert(first != null, "first is required and must not be null");
    assert(avatarSize != null, "avatarSize is required and must not be null");
    return _$SearchReposInput((b) {
      b.queryString = queryString;
      b.first = first;
      b.avatarSize = avatarSize;
      b.update(updates);
    });
  }

  static Serializer<SearchReposInput> get serializer =>
      _$searchReposInputSerializer;
  String get queryString;

  /// Returns the first _n_ elements from the list.
  int get first;
  int get avatarSize;
  Map<String, dynamic> toGQLMap() =>
      serializers.serializeWith(SearchReposInput.serializer, this);
}
