import 'package:built_value/built_value.dart';

part 'operation_input.g.dart';

abstract class OperationInput
    implements Built<OperationInput, OperationInputBuilder> {
  OperationInput._();

  String get inputName;

  String get inputType;

  bool get isNullable;

  factory OperationInput([updates(OperationInputBuilder b)]) = _$OperationInput;
}
