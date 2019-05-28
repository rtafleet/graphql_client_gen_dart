typedef String GQLErrorPrinter(GQLError error);

/// A location where a [GQLError] appears.
class Location {
  /// The line of the error in the query.
  final int line;

  /// The column of the error in the query.
  final int column;

  /// Constructs a [Location] from a JSON map.
  Location.fromJSON(Map data)
      : line = data['line'],
        column = data['column'];

  @override
  String toString() => '{ line: $line, column: $column }';
}

/// A GQL error (returned by a GQL server).
class GQLError {
  static GQLErrorPrinter _errorPrinter;

  static set errorPrinter(GQLErrorPrinter printer) {
    _errorPrinter = printer;
  }

  /// The message of the error.
  final String message;

  /// Locations where the error appear.
  final List<Location> locations;

  /// The path of the field in error.
  final List<dynamic> path;

  /// Custom error data returned by your GraphQL API server
  final Map<String, dynamic> extensions;

  GQLError(this.message, this.locations, this.path, this.extensions);

  /// Constructs a [GQLError] from a JSON map.
  GQLError.fromJSON(Map data)
      : message = data['message'],
        locations = data["locations"] is List
            ? new List.from(
                (data['locations']).map((d) => new Location.fromJSON(d)))
            : null,
        path = data['path'],
        extensions = data['extensions'];

  Map<String, dynamic> toJSON() {
    return {
      "message": message,
      "locations": locations,
      "path": path,
      "extensions": extensions,
    };
  }

  @override
  String toString() {
    if (_errorPrinter != null) {
      return _errorPrinter(this);
    }
    return '$message: ${locations is List ? locations.map((l) => '[${l.toString()}]').join('') : ""}';
  }
}

/// A Exception that is raised if the GQL response has a [GQLError].
class GQLException implements Exception {
  /// The Exception message.
  final String message;

  /// The list of [GQLError] in the response.
  final List<GQLError> gqlErrors;

  final String queryString;

  final Map<String, dynamic> variables;

  final Map<String, dynamic> response;

  /// Creates a new [GQLException].
  ///
  /// It requires a message and a JSON list from a GQL response
  /// (returned by a GQL server).
  GQLException(this.message, List rawGQLError, this.queryString, this.variables,
      this.response)
      : gqlErrors =
            new List.from(rawGQLError.map((d) => new GQLError.fromJSON(d)));

  Map<String, dynamic> toJSON() {
    return {
      "message": message,
      "errors": gqlErrors.map((error) => error.toJSON()).toList(),
    };
  }

  @override
  String toString() =>
      '$message: ${gqlErrors.map((e) => '[${e.toString()}]').join('')}';
}

class NoConnectionException implements Exception {}

typedef OnGQLException(GQLException exception);

class GQLExceptionReporter {
  static OnGQLException gqlExceptionHandler;
}