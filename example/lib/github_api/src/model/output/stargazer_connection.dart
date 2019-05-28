import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';
part 'stargazer_connection.g.dart';

/// The connection type for User.
abstract class StargazerConnection
    implements Built<StargazerConnection, StargazerConnectionBuilder> {
  StargazerConnection._();

  factory StargazerConnection(
      {@required int totalCount, void updates(StargazerConnectionBuilder b)}) {
    assert(totalCount != null, "totalCount is required and must not be null");
    return _$StargazerConnection((b) {
      b.totalCount = totalCount;
      b.update(updates);
    });
  }

  static Serializer<StargazerConnection> get serializer =>
      _$stargazerConnectionSerializer;

  /// Identifies the total count of items in the connection.
  int get totalCount;
}
