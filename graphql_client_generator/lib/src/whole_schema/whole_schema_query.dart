import 'dart:async';

import 'package:graphql_client_generator/src/model/schema.dart';
import 'package:graphql_client_generator/src/whole_schema/whole_schema_query_output.dart';
import 'package:graphql_dart/graphql_dart.dart';

String _wholeSchemaQuery = """
query IntrospectionQuery {
  __schema {
    queryType {
      ...Type_mini
    }
    mutationType {
      ...Type_mini
    }
    subscriptionType {
      ...Type_mini
    }
    types {
      ...Type_full
    }
    directives {
      ...Directive
    }
  }
}

fragment Type_mini on __Type {
  name
}

fragment Type_full on __Type {
  kind
  name
  description
  fields(includeDeprecated: true) {
    ...Field
  }
  inputFields {
    ...InputValue
  }
  interfaces {
    ...Type_ref
  }
  enumValues(includeDeprecated: true) {
    ...EnumValue
  }
  possibleTypes {
    ...Type_ref
  }
}

fragment Directive on __Directive {
  name
  description
  locations
  args {
    ...InputValue
  }
}

fragment EnumValue on __EnumValue {
  name
  description
  isDeprecated
  deprecationReason
}

fragment Field on __Field {
  name
  description
  args {
    ...InputValue
  }
  type {
    ...Type_ref
  }
  isDeprecated
  deprecationReason
}

fragment InputValue on __InputValue {
  name
  description
  type {
    ...Type_ref
  }
  defaultValue
}

fragment Type_ref on __Type {
  kind
  name
  ofType {
    kind
    name
    ofType {
      kind
      name
      ofType {
        kind
        name
        ofType {
          kind
          name
          ofType {
            kind
            name
            ofType {
              kind
              name
              ofType {
                kind
                name
              }
            }
          }
        }
      }
    }
  }
}
"""
    .replaceAll("\n", " ");

Future<Schema> getWholeSchema(GQLClient client) async {
  final result = await client.query(_wholeSchemaQuery);
//  final result = json.decode(_offline);
  final output = WholeSchemaQueryOutput.fromGQLMap(result);
  return output.schema;
}
