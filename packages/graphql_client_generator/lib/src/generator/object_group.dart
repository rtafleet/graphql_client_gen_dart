import 'package:graphql_client_generator/src/generator/enum_generator.dart';
import 'package:graphql_client_generator/src/generator/interface_generator.dart';
import 'package:graphql_client_generator/src/generator/object_generator.dart';

class ObjectsGroup {
  final List<ObjectGenerator> objectGenerators;
  final List<EnumGenerator> enumGenerator;
  final List<InterfaceGenerator> interfaceGenerators;

  ObjectsGroup(
      this.objectGenerators, this.enumGenerator, this.interfaceGenerators);
}
