import 'package:built_value/built_value.dart';
import 'package:graphql_parser/graphql_parser.dart';

part 'fragment_field.g.dart';

abstract class FragmentField
    implements Built<FragmentField, FragmentFieldBuilder> {
  FragmentField._();

  @nullable
  String get aliasName;

  String get actualName;

  @nullable
  String get fragmentReference;

  String get effectiveName => aliasName ?? actualName;

  factory FragmentField([updates(FragmentFieldBuilder b)]) = _$FragmentField;

  factory FragmentField.fromParserFieldName(FieldContext fragmentFieldContext) {
    String fragmentName;
    if (fragmentFieldContext.selectionSet != null) {
      // if the selection.field.selectionSet is not null, then we know that this should refer to another fragment
      SelectionSetContext subSelectionSet = fragmentFieldContext.selectionSet;
      if (subSelectionSet.selections.length != 1) {
        throw InvalidFragmentException(
            "sub-type does not have a single selection (fragment). $fragmentFieldContext");
      }
      SelectionContext fragmentSelection = subSelectionSet.selections[0];
      if (fragmentSelection.fragmentSpread == null) {
        throw InvalidFragmentException("sub-type does not provide a fragment");
      }
      FragmentSpreadContext subSelectionFragment =
          fragmentSelection.fragmentSpread;
      fragmentName = subSelectionFragment.name;
    }
    if (fragmentFieldContext.fieldName.alias == null) {
      return FragmentField((b) => b
        ..actualName = fragmentFieldContext.fieldName.name
        ..fragmentReference = fragmentName);
    }
    return FragmentField((b) => b
      ..actualName = fragmentFieldContext.fieldName.alias.name
      ..aliasName = fragmentFieldContext.fieldName.alias.alias
      ..fragmentReference = fragmentName);
  }
}

class InvalidFragmentException implements Exception {
  final String message;

  const InvalidFragmentException(this.message);
}
