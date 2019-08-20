import 'package:graphql_client_generator/src/model/custom_scalar_map.dart';
import 'package:graphql_client_generator/src/model/type.dart';

String getDartTypeNameForScalar(
    TypeRef typeRef, CustomScalarMap customScalarMap) {
  assert(typeRef.concreteType.kind == "SCALAR");
  final type = typeRef.concreteType.name;
  if (type == "Int") {
    return "int";
  } else if (type == "Boolean") {
    return "bool";
  } else if (type == "ID" || type == "String") {
    return "String";
  } else if (type == "Float") {
    return "double";
  }
  final customScalar = customScalarMap.customScalars
      .firstWhere((scalar) => scalar.name == type, orElse: () => null);
  if (customScalar != null) {
    return customScalar.dartType;
  }
  return type;
}
