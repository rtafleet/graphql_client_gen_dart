A library for generating Dart client libraries for GraphQL backend API's.

Please note that this project is still in preview and under active development and can change at any time without warning.

# About this library
## Why did we build this?
We built this library to accelerate development of our Flutter app which uses a GraphQL backend. We found that writing our API integrations manually with existing tools was labor intensive and error prone. When we make changes to our API we need a way to verify the impact these changes have on the client. For example, if we modify the schema to make a certain field required, we should be able to regenerate our client library and see compiler errors for the missing required fields. If we make changes that should have no impact on the client, we should be able to regenerate the client and see zero source changes.
## Why do we generate built_value classes?
We like `built_value` and find that it adds a lot of benefit to our apps. We get JSON serialization and value types for free. We also get "copyWith" style builders for free which really helps when generating data for our tests or mutating state. Notwithstanding all of these nice things, `built_value` does have its annoyances. For example, constructing classes is a bit ugly to look at out of the box. In this library we've tried to make using `built_value` as easy as possible by generating code that smooths some of these rough edges.
## What's with all the fragments?
We needed a way to map GraphQL types to Dart classes. Fragments are the natural fit for this. The library follows a convention that all type definitions that you include in your client generator need to be completely broken out into their own fragments and included in other types as fragment references. 

### For example:
The following is the way this library expects you to write your fragments:
```text
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
  avatarUrl(size: $avatarSize)
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
}
```
Notice how each included type is described by a fragment reference such as `...StargazerConnection`. This allows us to map each GraphQL type to a generated Dart type. 

The following format, while legal GraphQL, is _not_ supported by this library
```text
fragment Repository on Repository {
  id
  description
  hasIssuesEnabled
  isPrivate
  sshUrl
  name
  stargazers {
    totalCount
  }
  viewerHasStarred
  owner {
    username: login
    avatarUrl(size: $avatarSize)
    ... on Organization {
      name
      type: __typename
    }
    ... on User {
      name
      type: __typename
    }
  }
}
```
One of the primary reasons this pattern is unsupported is because we want to reuse all the types we get back from GraphQL in multiple contexts. GraphQL allows types to be connected with each other in many ways. What this means is that a type like `RepositoryOwner` may show up as `owner` when you receive a `Repository`, but it can also show up as a field of several other types. And if each query can request any of the included `RepositoryOwner` field, how would we form a concrete picture of what a `RepositoryOwner` looks like in Dart? It may have a non-null `username` included in one query, and another query may omit that property altogether. 

# Usage
Follow these steps to generate your own custom Dart client library that works with your existing GraphQL backend. For a complete example, please see the included example project.
  0. Install the generator as a developer dependency and graphql_dart as a regular dependency.
  1. Author your GraphQL documents. This includes files for your operations, fragments, and mappings for any custom scalar types in use.
  2. Write a client generator Dart program. In this simple program you configure a code generator instance and invoke the `generate()` method. The generator instance requires a basic Http client with any authentication that your server requires, a declaration of your project's package name, an output directory and library name for your generated client library, as well as relative path locations to the GraphQL documents you authored in step 1.
  3. Run your generator
  4. Invoke build_runner so that the built_value classes this library generates can be completed.
  5. Configure any discriminators for JSON parsing (more on this below)
  5. Enjoy your new client library!
  
# Installation
You need the following dev dependencies:
  1. [graphql_client_generator](https://github.com/rtafleet/graphql_client_gen_dart_history/tree/master/graphql_client_generator) (in this repo)
  2. [build_runner](https://pub.dev/packages/build_runner)
  3. [built_value_generator](https://pub.dev/packages/built_value_generator)
  
You also need the following regular dependencies:
  1. [graphql_dart](https://github.com/rtafleet/graphql_client_gen_dart_history/tree/master/graphql_dart) (in this repo) as the generated code references this package.
  2. [built_value](https://pub.dev/packages/built_value)
  3. [built_collection](https://pub.dev/packages/built_collection)

Here is an example `pubspec.yaml`:
```yaml
name: example
description: A sample command-line application.
# version: 1.0.0
# author: Dustin Graham <dgraham@rtafleet.com>

environment:
  sdk: '>=2.0.0 <3.0.0'

dependencies:
  built_value: ^6.1.1
  built_collection: ^4.0.0
  graphql_dart: any

dev_dependencies:
  test: ^1.0.0
  graphql_client_generator: any
  build_runner: ^1.1.2
  built_value_generator: ^6.2.0

dependency_overrides:
  graphql_client_generator:
    git:
      url: git@github.com:rtafleet/graphql_client_gen_dart.git
      path: packages/graphql_client_generator
  graphql_dart:
    git:
      url: git@github.com:rtafleet/graphql_client_gen_dart.git
      path: packages/graphql_dart
```

# Integration
## Discriminators
While GraphQL has types, JSON does not. The generated code, with the help of `built_value` can deserialize most of the JSON we get back from your API. However, GraphQL also supports interfaces and so you may have a field reference to an interface and the deserializer will not be able to know which concrete type a particular JSON object maps to without additional input from you. The example project contains an example of this case. Both `User` and `Organization` implement `RepositoryOwner`. So how does the parser know the difference, or _discriminate_, between one concrete type and another? You provide a _discriminator_ function when your app starts up. The discriminator is a simple function which receives the object being deserialized and the `FullType` (a `built_value` thing) which is the interface type it expects. You simply return back the stringified name of the concrete type.

```dart
import 'package:built_value/serializer.dart';
import 'package:example/github_api/github_api.dart';

void setupDiscriminator() {
  GithubApiJsonPlugin.discriminator = (Object object, FullType specifiedType) {
    if (specifiedType.root == SearchResultItem) {
      return "Repository";
    }
    if (specifiedType.root == RepositoryOwner) {
      final Map<String, dynamic> objectMap = object;
      return objectMap["type"];
    }
    return null;
  };
}
```

In the example app, all of our `SearchResultItem`'s are of type "Repository", so this one is easy (this is actually a union, not an interface). In the case of `User` and `Organization`, we used the built-in `__typename` GraphQL property so that the server can inform us of the concrete type. Note that this needs to be aliased to `type` as `__typename` would not generate good Dart code. Once you write this discriminator, make sure it gets called when your program starts:
```dart
import 'dart:io';

import 'package:graphql_dart/graphql_dart.dart';
import 'package:http/http.dart';

import 'github_api/github_api.dart';
import 'github_api_extensions/discriminator.dart' as Discriminator;

void main() async {
  // call the discriminator
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
```

## Custom Scalar Mapping
GraphQL has a feature that allows us to alias scalar types. One common one is `ID`, which is just a String, but it is a custom scalar to communicate that it is not meant to be human readable. The only drawback to GraphQL's implenentation of this feature (in our opinion) is that the published schema descriptions for these aliases simply describes the type as a "SCALAR". So we lose the underlying type information for the SCALAR. Is it a String, a Boolean or something else? For this reason, if you are using any custom scalars, you must provide a simple mapping file in a particular structure.

For example:
```json
{
  "custom_scalars": [
    {
      "name": "GitSSHRemote",
      "dart_type": "String"
    },
    {
      "name": "URI",
      "dart_type": "String"
    }
  ]
}
```  
Give a path to this file to your generator and it will generate the correct types for your code when it encounters these GraphQL types.