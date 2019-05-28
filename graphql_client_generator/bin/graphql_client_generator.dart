import 'dart:io';

import 'package:args/args.dart';
import 'package:graphql_client_generator/graphql_client_generator.dart';
import 'package:graphql_dart/graphql_dart.dart';
import 'package:http/http.dart';

const fragmentFileArg = 'fragments-file';
const operationsFileArg = 'operations-file';
const outputDirectoryArg = 'output-directory';
const libraryNameArg = 'library-name';
const authorizationArg = 'authorization';
const packageName = 'package-name';
const url = 'url';

ArgResults argResults;

void main(List<String> args) async {
  exitCode = 0;
  final parser = ArgParser()
    ..addOption(fragmentFileArg, abbr: 'f')
    ..addOption(operationsFileArg, abbr: 'p')
    ..addOption(outputDirectoryArg, abbr: 'o')
    ..addOption(libraryNameArg, abbr: 'n')
    ..addOption(authorizationArg, abbr: 'a')
    ..addOption(packageName, abbr: 'c')
    ..addOption(url, abbr: 'u');

  argResults = parser.parse(args);
  final authorization = argResults[authorizationArg];
  final client = Client();
  var gql = new GQLClient(client, url, authorization);
  final generator = GQLCodeGenerator(
    gql: gql,
    fragmentFilePath: argResults[fragmentFileArg],
    operationsFilePath: argResults[operationsFileArg],
    outputDirectoryPath: argResults[outputDirectoryArg],
    libraryName: argResults[libraryNameArg],
    packageName: argResults[packageName],
    url: argResults[url],
  );
  await generator.generate();
}
