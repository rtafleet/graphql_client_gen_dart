import 'package:graphql_client_generator/src/generator/enum_generator.dart';
import 'package:graphql_client_generator/src/generator/input_generator.dart';
import 'package:graphql_client_generator/src/model/custom_scalar_map.dart';
import 'package:graphql_client_generator/src/model/schema.dart';
import 'package:graphql_client_generator/src/model/type.dart';

class InputGroup {
  final List<InputGenerator> inputGenerators;
  final List<EnumGenerator> enumGenerators;
  final CustomScalarMap customScalarMap;
  final Map<String, String> customInterfaceOverrides;

  InputGroup._(this.inputGenerators, this.enumGenerators, this.customScalarMap, this.customInterfaceOverrides);

  factory InputGroup.fromRootType(
      TypeFull rootType, Schema schema, CustomScalarMap customScalarMap, Map<String, String> customInterfaceOverrides) {
    assert(rootType.kind == "INPUT_OBJECT");
    List<InputGenerator> inputs = [
      InputGenerator(rootType, false, customScalarMap, customInterfaceOverrides)
    ];
    List<EnumGenerator> enums = [];
    rootType.inputFields.forEach((f) {
      if (f.type.concreteType.kind == "INPUT_OBJECT") {
        // get the full type from the schema
        final full = schema.typeForName(f.type.concreteType.name);
        final subGroup = InputGroup.fromRootType(full, schema, customScalarMap, customInterfaceOverrides);
        inputs.addAll(subGroup.inputGenerators);
        enums.addAll(subGroup.enumGenerators);
      } else if (f.type.concreteType.kind == "ENUM") {
        // get the full type from the schema
        final full = schema.typeForName(f.type.concreteType.name);
        enums.add(EnumGenerator(full));
      }
    });
    return InputGroup._(inputs, enums, customScalarMap, customInterfaceOverrides);
  }
}
