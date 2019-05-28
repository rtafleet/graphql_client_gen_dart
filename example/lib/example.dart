import 'dart:io';

import 'package:graphql_dart/graphql_dart.dart';
import 'package:http/http.dart';

import 'github_api/github_api.dart';
import 'github_api_extensions/discriminator.dart' as Discriminator;

void main() async {
  Discriminator.setupDiscriminator();
  final client = Client();
  final url = "https://api.github.com/graphql";
  final token = await (File(".github_key.txt")).readAsString();
  final gqlClient = GQLClient(client, url, "Bearer $token");
  final result = await searchRepos(gqlClient,
      SearchReposInput(queryString: "flutter", first: 20, avatarSize: 250));
  print("found Flutter repos");
  for (Repository repo in result.search.nodes) {
    print("${repo.name}");
  }
}
