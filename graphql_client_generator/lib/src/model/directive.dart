import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:graphql_client_generator/src/model/input_value.dart';

part 'directive.g.dart';

abstract class Directive implements Built<Directive, DirectiveBuilder> {
  static Serializer<Directive> get serializer => _$directiveSerializer;

  Directive._();

  String get name;

  @nullable
  String get description;

  BuiltList<String> get locations;

  BuiltList<InputValue> get args;

  factory Directive([updates(DirectiveBuilder b)]) = _$Directive;
}
