import 'dart:io';

import 'package:graphql_client_generator/graphql_client_generator.dart';
import 'package:graphql_dart/graphql_dart.dart';
import 'package:http/http.dart';

void main() async {
  final client = Client();
  final url = "https://api.github.com/graphql";
  final token = await (File(".github_key.txt")).readAsString();
  final gqlClient = GQLClient(client, url, "Bearer $token");
  final generator = GQLCodeGenerator(
    gql: gqlClient,
    fragmentFilePath: "gql_docs/fragments.gql",
    operationsFilePath: "gql_docs/operations.gql",
    customScalarMapPath: "gql_docs/custom_scalar_map.json",
    outputDirectoryPath: "lib/",
    libraryName: "github_api",
    packageName: "example",
    url: url,
  );
  try {
    await generator.generate();
  } catch (e) {
    print("error generating github client: $e");
  }

  await Process.start("flutter", [
    "packages",
    "pub",
    "run",
    "build_runner",
    "build",
    "--delete-conflicting-outputs"
  ]);
}
