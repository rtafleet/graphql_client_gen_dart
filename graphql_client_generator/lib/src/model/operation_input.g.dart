// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation_input.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OperationInput extends OperationInput {
  @override
  final String inputName;
  @override
  final String inputType;
  @override
  final bool isNullable;

  factory _$OperationInput([void updates(OperationInputBuilder b)]) =>
      (new OperationInputBuilder()..update(updates)).build();

  _$OperationInput._({this.inputName, this.inputType, this.isNullable})
      : super._() {
    if (inputName == null) {
      throw new BuiltValueNullFieldError('OperationInput', 'inputName');
    }
    if (inputType == null) {
      throw new BuiltValueNullFieldError('OperationInput', 'inputType');
    }
    if (isNullable == null) {
      throw new BuiltValueNullFieldError('OperationInput', 'isNullable');
    }
  }

  @override
  OperationInput rebuild(void updates(OperationInputBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  OperationInputBuilder toBuilder() =>
      new OperationInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OperationInput &&
        inputName == other.inputName &&
        inputType == other.inputType &&
        isNullable == other.isNullable;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, inputName.hashCode), inputType.hashCode),
        isNullable.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OperationInput')
          ..add('inputName', inputName)
          ..add('inputType', inputType)
          ..add('isNullable', isNullable))
        .toString();
  }
}

class OperationInputBuilder
    implements Builder<OperationInput, OperationInputBuilder> {
  _$OperationInput _$v;

  String _inputName;
  String get inputName => _$this._inputName;
  set inputName(String inputName) => _$this._inputName = inputName;

  String _inputType;
  String get inputType => _$this._inputType;
  set inputType(String inputType) => _$this._inputType = inputType;

  bool _isNullable;
  bool get isNullable => _$this._isNullable;
  set isNullable(bool isNullable) => _$this._isNullable = isNullable;

  OperationInputBuilder();

  OperationInputBuilder get _$this {
    if (_$v != null) {
      _inputName = _$v.inputName;
      _inputType = _$v.inputType;
      _isNullable = _$v.isNullable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OperationInput other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$OperationInput;
  }

  @override
  void update(void updates(OperationInputBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$OperationInput build() {
    final _$result = _$v ??
        new _$OperationInput._(
            inputName: inputName, inputType: inputType, isNullable: isNullable);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
