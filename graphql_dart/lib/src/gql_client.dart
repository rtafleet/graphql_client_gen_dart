import 'dart:async';
import 'dart:convert';

import 'package:graphql_dart/src/exceptions.dart';
import 'package:http/http.dart';

class GQLClient {
  final Client client;
  final String url;
  final String authorization;

  GQLClient(this.client, this.url, this.authorization);

  Future<Map<String, dynamic>> query(String queryString,
      {Map<String, dynamic> args}) async {
    Map<String, dynamic> body = <String, dynamic>{
      'variables': args,
      'query': queryString
    };

    final Response response = await client.post(
      url,
      headers: {
        "authorization": authorization,
        "Content-Type": "application/json"
      },
      body: json.encode(body),
    );

    final int statusCode = response.statusCode;
    final String reasonPhrase = response.reasonPhrase;

    if (statusCode < 200 || statusCode >= 400) {
      final errorMessage = response.body;
      throw ClientException(
        'Network Error: $statusCode $reasonPhrase: $errorMessage',
      );
    }

    var stringBody = response.body;
    final Map<String, dynamic> jsonResponse = json.decode(stringBody);

    if (jsonResponse['errors'] != null && jsonResponse['errors'].length > 0) {
      var gqlException = GQLException(
          'Error returned by the server in the query',
          jsonResponse['errors'],
          queryString,
          args,
          jsonResponse);
      if (GQLExceptionReporter.gqlExceptionHandler != null) {
        GQLExceptionReporter.gqlExceptionHandler(gqlException);
      }
      throw gqlException;
    }

    return jsonResponse['data'];
  }
}
