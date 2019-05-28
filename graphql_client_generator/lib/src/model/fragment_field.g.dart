// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fragment_field.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FragmentField extends FragmentField {
  @override
  final String aliasName;
  @override
  final String actualName;
  @override
  final String fragmentReference;

  factory _$FragmentField([void updates(FragmentFieldBuilder b)]) =>
      (new FragmentFieldBuilder()..update(updates)).build();

  _$FragmentField._({this.aliasName, this.actualName, this.fragmentReference})
      : super._() {
    if (actualName == null) {
      throw new BuiltValueNullFieldError('FragmentField', 'actualName');
    }
  }

  @override
  FragmentField rebuild(void updates(FragmentFieldBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  FragmentFieldBuilder toBuilder() => new FragmentFieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FragmentField &&
        aliasName == other.aliasName &&
        actualName == other.actualName &&
        fragmentReference == other.fragmentReference;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, aliasName.hashCode), actualName.hashCode),
        fragmentReference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FragmentField')
          ..add('aliasName', aliasName)
          ..add('actualName', actualName)
          ..add('fragmentReference', fragmentReference))
        .toString();
  }
}

class FragmentFieldBuilder
    implements Builder<FragmentField, FragmentFieldBuilder> {
  _$FragmentField _$v;

  String _aliasName;
  String get aliasName => _$this._aliasName;
  set aliasName(String aliasName) => _$this._aliasName = aliasName;

  String _actualName;
  String get actualName => _$this._actualName;
  set actualName(String actualName) => _$this._actualName = actualName;

  String _fragmentReference;
  String get fragmentReference => _$this._fragmentReference;
  set fragmentReference(String fragmentReference) =>
      _$this._fragmentReference = fragmentReference;

  FragmentFieldBuilder();

  FragmentFieldBuilder get _$this {
    if (_$v != null) {
      _aliasName = _$v.aliasName;
      _actualName = _$v.actualName;
      _fragmentReference = _$v.fragmentReference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FragmentField other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FragmentField;
  }

  @override
  void update(void updates(FragmentFieldBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$FragmentField build() {
    final _$result = _$v ??
        new _$FragmentField._(
            aliasName: aliasName,
            actualName: actualName,
            fragmentReference: fragmentReference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
