import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:graphql_client_generator/src/model/directive.dart';
import 'package:graphql_client_generator/src/model/type.dart';

part 'schema.g.dart';

abstract class Schema implements Built<Schema, SchemaBuilder> {
  static Serializer<Schema> get serializer => _$schemaSerializer;
  Schema._();

  TypeMini get queryType;

  @nullable
  TypeMini get mutationType;

  @nullable
  TypeMini get subscriptionType;

  BuiltList<TypeFull> get types;

  BuiltList<Directive> get directives;

  TypeFull get fullQueryType => typeForName(queryType.name);

  TypeFull get fullMutationType => typeForName(mutationType.name);

  TypeFull typeForName(String typeName) {
    return types.firstWhere((t) => t.name == typeName, orElse: () => null);
  }

  factory Schema([updates(SchemaBuilder b)]) = _$Schema;
}
