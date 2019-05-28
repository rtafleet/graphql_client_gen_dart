import 'package:code_builder/code_builder.dart';
import 'package:graphql_client_generator/src/generator/utils.dart';
import 'package:graphql_client_generator/src/model/schema.dart';
import 'package:graphql_client_generator/src/model/type.dart';
import 'package:graphql_client_generator/src/utils/import_resolver.dart';
import 'package:graphql_parser/graphql_parser.dart';

final regex = RegExp(r'(\$.*?[:\),])');

List<FragmentDefinitionContext> allRequiredFragmentsForSelections(
    List<SelectionContext> selections,
    List<FragmentDefinitionContext> allFragmentDefinitions) {
  final List<FragmentDefinitionContext> requiredFragments = [];
  for (var selection in selections) {
    String fragmentName;
    if (isSelectionFragmentReference(selection)) {
      // this selection references another type, go look it up
      fragmentName =
          selection.field.selectionSet.selections[0].fragmentSpread.name;
    } else if (isSelectionInterfaceImplementationFragmentReference(selection)) {
      // as per our convention, a fragment spread at this location references a type that implements an interface
      fragmentName = selection.fragmentSpread.name;
    } else {
      continue;
    }
    final referencedFragmentContext = allFragmentDefinitions
        .firstWhere((f) => f.name == fragmentName, orElse: () => null);
    if (referencedFragmentContext == null) {
      throw "fragment reference '$fragmentName' not found while gathering all required fragments.";
    }
    requiredFragments
      ..add(referencedFragmentContext)
      ..addAll(allRequiredFragmentsForSelections(
          referencedFragmentContext.selectionSet.selections,
          allFragmentDefinitions));
  }
  return requiredFragments;
}

String _escapeDocument(String originalDoc) {
  final escapedDoc =
      originalDoc.replaceAllMapped(regex, (match) => "\\${match.group(0)}");
  return escapedDoc;
}

class OperationGenerator {
  final OperationDefinitionContext operationDefinition;
  final List<FragmentDefinitionContext> allFragmentDefinitions;
  final Schema schema;
  final String outputType;
  final String inputType;

  String get operationName => operationDefinition.name;

  bool get isQuery => operationDefinition.isQuery;

  String get originalOperationStringEscaped {
    final originalDoc = originalDocumentForDefinition(operationDefinition);
    return _escapeDocument(originalDoc);
  }

  List<String> get allRequiredFragmentsForOperationEscaped {
    final selections = operationDefinition.selectionSet.selections;
    return _allRequiredFragmentsForSelections(selections);
  }

  List<String> _allRequiredFragmentsForSelections(
          List<SelectionContext> selections) =>
      allRequiredFragmentsForSelections(selections, allFragmentDefinitions)
          .fold(Set<String>(), (Set<String> acc, f) {
        final fragmentDoc = originalDocumentForDefinition(f);
        return acc..add(_escapeDocument(fragmentDoc));
      }).toList();

  OperationGenerator(
    this.operationDefinition,
    this.schema,
    this.outputType,
    this.inputType,
    this.allFragmentDefinitions,
  );

  Library generateLibrary(ImportResolver importResolver) {
    final operationName = operationDefinition.name;
    final String operationDocument =
        "\n${originalOperationStringEscaped}\n\n${allRequiredFragmentsForOperationEscaped.join("\n\n")}";

    var queryDocumentFieldName = "_${operationDefinition.name}Doc";

    final inputParameters = <Parameter>[
      Parameter((b) => b
        ..type = refer("GQLClient")
        ..name = "graphQLClient")
    ];
    if (inputType != null) {
      final inputParameter = Parameter((b) => b
        ..type = refer(inputType)
        ..name = "input");
      inputParameters.add(inputParameter);
    }

    final importDirectives = <Directive>[
      Directive.import("dart:async"),
      Directive.import("package:graphql_dart/graphql_dart.dart"),
      importResolver.operationOutputNamed(operationName),
    ];
    if (inputType != null) {
      importDirectives.add(importResolver.operationInputNamed(operationName));
    }

    final operationLibrary = Library((b) => b
      ..body.addAll([
        Field((b) {
          return b
            ..name = queryDocumentFieldName
            ..assignment =
                Code('"""$operationDocument""".replaceAll("\\n", " ")');
        }),
        Code("\n"),
        Method((b) => b
          ..returns = TypeReference((b) => b
            ..symbol = "Future"
            ..types.add(refer(outputType)))
          ..name = operationName
          ..requiredParameters.addAll(inputParameters)
          ..modifier = MethodModifier.async
          ..lambda = false
          ..body = Block.of([
            ToCodeExpression(CodeExpression(Code(
                    "graphQLClient.query(${queryDocumentFieldName}${inputType != null ? ", args: input.toGQLMap()" : ""});"))
                .awaited
                .assignFinal("responseMap")),
            ToCodeExpression(
                CodeExpression(Code("${outputType}.fromGQLMap(responseMap);"))
                    .returned),
          ])),
      ])
      ..directives.addAll(importDirectives));
    return operationLibrary;
  }
}
