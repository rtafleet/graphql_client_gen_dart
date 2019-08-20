import 'package:graphql_client_generator/src/generator/object_generator.dart';
import 'package:graphql_client_generator/src/generator/operation_generator.dart';
import 'package:graphql_client_generator/src/generator/operation_input_generator.dart';

class OperationGroup {
  final ObjectGenerator outputGenerator;
  final OperationInputGenerator inputGenerator;
  final OperationGenerator operationGenerator;

  String get operationName => operationGenerator.operationName;

  bool get isQuery => operationGenerator.isQuery;

  OperationGroup(
      this.outputGenerator, this.inputGenerator, this.operationGenerator);
}
