import 'package:code_builder/code_builder.dart';
import 'package:recase/recase.dart';

class ImportResolver {
  final String packageName;
  final String clientName;

  ImportResolver(this.packageName, this.clientName);

  String get _basePackageImportPath => "package:$packageName/$clientName";

  Directive get serializerImportDirective =>
      Directive.import("$_basePackageImportPath/src/serializers.dart");

  /// takes a model name like "User" or "user" and returns a fully qualified package
  /// import directive like: "import 'package:my_package/client_name/src/model/output/user.dart'
  Directive outputModelNamed(String named) {
    final nameSnake = ReCase(named).snakeCase;
    return Directive.import(
        "$_basePackageImportPath/src/model/output/$nameSnake.dart");
  }

  /// takes a model name like "User" or "user" and returns a fully qualified package
  /// import directive like: "import 'package:my_package/client_name/src/model/input/user.dart'
  Directive inputModelNamed(String named) {
    final nameSnake = ReCase(named).snakeCase;
    return Directive.import(
        "$_basePackageImportPath/src/model/input/$nameSnake.dart");
  }

  Directive enumModelNamed(String name) {
    final nameSnake = ReCase(name).snakeCase;
    return Directive.import(
        "$_basePackageImportPath/src/model/enum/$nameSnake.dart");
  }

  /// takes an [operationName] like "getUser" and returns a fully qualified package
  /// import directive for the operation file like: "import 'package:my_package/client_name/src/operations/get_user/get_user_query.dart'
  Directive operationNamed(String operationName, OperationType operationType) {
    final nameSnake = ReCase(operationName).snakeCase;
    return Directive.import(
        "$_basePackageImportPath/src/operation/$nameSnake/${nameSnake}_${operationType == OperationType.query ? "query" : "mutation"}.dart");
  }

  /// takes an [operationName] like "getUser" and returns a fully qualified package
  /// import directive for the output object like: "import 'package:my_package/client_name/src/operations/get_user/get_user_output.dart'
  Directive operationOutputNamed(String operationName) {
    final nameSnake = ReCase(operationName).snakeCase;
    return Directive.import(
        "$_basePackageImportPath/src/operation/$nameSnake/${nameSnake}_output.dart");
  }

  Directive operationInputNamed(String operationName) {
    final nameSnake = ReCase(operationName).snakeCase;
    return Directive.import(
        "$_basePackageImportPath/src/operation/$nameSnake/${nameSnake}_input.dart");
  }

  Directive modelExportsLibrary() {
    return Directive.import("$_basePackageImportPath/src/model/model.dart");
  }

  Directive operationExportsLibrary() {
    return Directive.import(
        "$_basePackageImportPath/src/operation/operation.dart");
  }

  Directive jsonPlugin() {
    return Directive.import(
        "$_basePackageImportPath/src/${ReCase(clientName).snakeCase}_json_plugin.dart");
  }
}

enum OperationType {
  query,
  mutation,
}
