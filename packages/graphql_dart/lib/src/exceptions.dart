typedef String GQLErrorPrinter(GQLError error);

/// A location where a [GQLError] appears.
class Location {
  /// The line of the error in the query.
  final int line;

  /// The column of the error in the query.
  final int column;

  /// Constructs a [Location] from a JSON map.
  Location.fromJSON(Map<String, dynamic> data)
      : line = data['line'] as int,
        column = data['column'] as int;

  @override
  String toString() => '{ line: $line, column: $column }';
}

/// A GQL error (returned by a GQL server).
class GQLError {
  static GQLErrorPrinter? _errorPrinter;

  static set errorPrinter(GQLErrorPrinter printer) {
    _errorPrinter = printer;
  }

  /// The message of the error.
  final String message;

  /// Locations where the error appear.
  final List<Location>? locations;

  /// The path of the field in error.
  final List<dynamic>? path;

  /// Custom error data returned by your GraphQL API server
  final Map<String, dynamic>? extensions;

  GQLError(this.message, this.locations, this.path, this.extensions);

  /// Constructs a [GQLError] from a JSON map.
  GQLError.fromJSON(Map<String, dynamic> data)
      : message = data['message'] as String,
        locations = data['locations'] is List
            ? List<Location>.from(
                (data['locations'] as List).map((d) => Location.fromJSON(d as Map<String, dynamic>)))
            : null,
        path = data['path'] as List<dynamic>?,
        extensions = data['extensions'] as Map<String, dynamic>?;

  Map<String, dynamic> toJSON() {
    return {
      'message': message,
      'locations': locations,
      'path': path,
      'extensions': extensions,
    };
  }

  @override
  String toString() {
    if (_errorPrinter != null) {
      return _errorPrinter!(this);
    }
    return '$message: ${path?.join(' -> ') ?? ''}';
  }
}

/// A Exception that is raised if the GQL response has a [GQLError].
class GQLException implements Exception {
  final String? messageOverride;

  String get message {
    if (messageOverride != null) {
      return messageOverride!;
    }
    if (gqlErrors.isEmpty) {
      return 'No errors';
    }
    if (gqlErrors.length > 1) {
      final allMessages = StringBuffer();
      for (final error in gqlErrors) {
        allMessages.writeln(error.toString());
      }
      return 'Multiple errors: $allMessages';
    } else {
      return gqlErrors.first.toString();
    }
  }

  /// The list of [GQLError] in the response.
  final List<GQLError> gqlErrors;

  final String queryString;

  final Map<String, dynamic>? variables;

  final Map<String, dynamic> response;

  /// The message is derived from the underlying error, but can be explicitly set
  GQLException(
    List<dynamic> rawGQLError,
    this.queryString,
    this.variables,
    this.response, {
    this.messageOverride,
  }) : gqlErrors = List<GQLError>.from(
            rawGQLError.map((d) => GQLError.fromJSON(d as Map<String, dynamic>)));

  Map<String, dynamic> toJSON() {
    return {
      'message': message,
      'errors': gqlErrors.map((error) => error.toJSON()).toList(),
    };
  }

  @override
  String toString() =>
      '$message: ${gqlErrors.map((e) => '[${e.toString()}]').join('')}';
}

class NoConnectionException implements Exception {}

typedef OnGQLException = void Function(GQLException exception);

class GQLExceptionReporter {
  static OnGQLException? gqlExceptionHandler;
}
