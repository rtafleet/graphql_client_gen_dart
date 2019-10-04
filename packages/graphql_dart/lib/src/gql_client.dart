import 'dart:async';
import 'dart:convert';

import 'package:graphql_dart/src/exceptions.dart';
import 'package:http/http.dart';

class GQLClient {
  final Client client;
  final String url;
  final Map<String, String> headers;
  final Encoding encoding;

  GQLClient(this.client, this.url, this.headers,
      {this.encoding = const Utf8Codec()});

  Future<Map<String, dynamic>> upload(String queryString, {Map<String, dynamic> args}) async {

    Map<String, dynamic> operations = <String, dynamic>{
      'variables': args,
      'query': queryString
    };

    final request = await _prepareRequest(url, operations, headers);

    final response = await request.send();

    final int statusCode = response.statusCode;
    final String reasonPhrase = response.reasonPhrase;

    var stringBody = await response.stream.bytesToString();
    if (statusCode < 200 || statusCode >= 400) {
      final errorMessage = stringBody;
      throw ClientException(
        'Network Error: $statusCode $reasonPhrase: $errorMessage',
      );
    }


    final Map<String, dynamic> jsonResponse = json.decode(stringBody);

    if (jsonResponse['errors'] != null && jsonResponse['errors'].length > 0) {
      var gqlException =
      GQLException(jsonResponse['errors'], queryString, args, jsonResponse);
      if (GQLExceptionReporter.gqlExceptionHandler != null) {
        GQLExceptionReporter.gqlExceptionHandler(gqlException);
      }
      throw gqlException;
    }

    return jsonResponse['data'];
  }

  // https://github.com/zino-app/graphql-flutter/blob/75d02c28154c6b5c2aacea4cfde623c8cdbe443d/packages/graphql/lib/src/link/http/link_http.dart
  Future<Map<String, MultipartFile>> _getFileMap(
      dynamic body, {
        Map<String, MultipartFile> currentMap,
        List<String> currentPath = const <String>[],
      }) async {
    currentMap ??= <String, MultipartFile>{};
    if (body is Map<String, dynamic>) {
      final Iterable<MapEntry<String, dynamic>> entries = body.entries;
      for (MapEntry<String, dynamic> element in entries) {
        currentMap.addAll(await _getFileMap(
          element.value,
          currentMap: currentMap,
          currentPath: List<String>.from(currentPath)..add(element.key),
        ));
      }
      return currentMap;
    }
    if (body is List<dynamic>) {
      for (int i = 0; i < body.length; i++) {
        currentMap.addAll(await _getFileMap(
          body[i],
          currentMap: currentMap,
          currentPath: List<String>.from(currentPath)..add(i.toString()),
        ));
      }
      return currentMap;
    }
    if (body is MultipartFile) {
      return currentMap
        ..addAll(<String, MultipartFile>{currentPath.join('.'): body});
    }

    // else should only be either String, num, null; NOTHING else
    return currentMap;
  }

  Future<BaseRequest> _prepareRequest(
      String url,
      Map<String, dynamic> body,
      Map<String, String> httpHeaders,
      ) async {
    final Map<String, MultipartFile> fileMap = await _getFileMap(body);
    if (fileMap.isEmpty) {
      final Request r = Request('post', Uri.parse(url));
      r.headers.addAll(httpHeaders);
      r.body = json.encode(body);
      return r;
    }

    final MultipartRequest r = MultipartRequest('post', Uri.parse(url));
    r.headers.addAll(httpHeaders);
    r.fields['operations'] = json.encode(body, toEncodable: (dynamic object) {
      if (object is MultipartFile) {
        return null;
      }
      return object.toJson();
    });

    final Map<String, List<String>> fileMapping = <String, List<String>>{};
    final List<MultipartFile> fileList = <MultipartFile>[];

    final List<MapEntry<String, MultipartFile>> fileMapEntries =
    fileMap.entries.toList(growable: false);

    for (int i = 0; i < fileMapEntries.length; i++) {
      final MapEntry<String, MultipartFile> entry = fileMapEntries[i];
      final String indexString = i.toString();
      fileMapping.addAll(<String, List<String>>{
        indexString: <String>[entry.key],
      });
      final MultipartFile f = entry.value;
      fileList.add(MultipartFile(
        indexString,
        f.finalize(),
        f.length,
        contentType: f.contentType,
        filename: f.filename,
      ));
    }

    r.fields['map'] = json.encode(fileMapping);

    r.files.addAll(fileList);
    return r;
  }

  Future<Map<String, dynamic>> query(String queryString,
      {Map<String, dynamic> args}) async {
    Map<String, dynamic> body = <String, dynamic>{
      'variables': args,
      'query': queryString
    };
    final standardHeaders = <String, String>{
      "Content-Type": "application/json"
    };

    final Response response = await client.post(
      url,
      headers: standardHeaders..addAll(headers),
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

    var stringBody = encoding.decode(response.bodyBytes);
    final Map<String, dynamic> jsonResponse = json.decode(stringBody);

    if (jsonResponse['errors'] != null && jsonResponse['errors'].length > 0) {
      var gqlException =
          GQLException(jsonResponse['errors'], queryString, args, jsonResponse);
      if (GQLExceptionReporter.gqlExceptionHandler != null) {
        GQLExceptionReporter.gqlExceptionHandler(gqlException);
      }
      throw gqlException;
    }

    return jsonResponse['data'];
  }
}
