// GENERATED CODE - DO NOT MODIFY BY HAND

import 'dart:async';

import 'package:example/github_api/src/operation/search_repos/search_repos_input.dart';
import 'package:example/github_api/src/operation/search_repos/search_repos_output.dart';
import 'package:graphql_dart/graphql_dart.dart';

var _searchReposDoc = """
query searchRepos(\$queryString: String!, \$first: Int!, \$avatarSize: Int!) {
  search(type: REPOSITORY, query: \$queryString, first: \$first) {
    ...SearchResultItemConnection
  }
}

fragment SearchResultItemConnection on SearchResultItemConnection {
  repositoryCount
  nodes {
    ...SearchResultItem
  }
}

fragment SearchResultItem on SearchResultItem {
  ...Repository
}

fragment Repository on Repository {
  id
  description
  hasIssuesEnabled
  isPrivate
  sshUrl
  name
  stargazers {
    ...StargazerConnection
  }
  viewerHasStarred
  owner {
    ...RepositoryOwner
  }
}

fragment StargazerConnection on StargazerConnection {
  totalCount
}

fragment RepositoryOwner on RepositoryOwner {
  username: login
  avatarUrl(size: \$avatarSize)
  ...Organization
  ...User
}

fragment Organization on Organization {
  name
  type: __typename
}

fragment User on User {
  name
  type: __typename
}"""
    .replaceAll("\n", " ");

Future<SearchReposOutput> searchRepos(
    GQLClient graphQLClient, SearchReposInput input) async {
  final responseMap =
      await graphQLClient.query(_searchReposDoc, args: input.toGQLMap());
  return SearchReposOutput.fromGQLMap(responseMap);
}
