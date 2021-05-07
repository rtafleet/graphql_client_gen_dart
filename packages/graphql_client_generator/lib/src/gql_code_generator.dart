import 'dart:async';
import 'dart:io';

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:graphql_client_generator/src/generator/enum_generator.dart';
import 'package:graphql_client_generator/src/generator/input_generator.dart';
import 'package:graphql_client_generator/src/generator/interface_generator.dart';
import 'package:graphql_client_generator/src/generator/json_plugin_generator.dart';
import 'package:graphql_client_generator/src/generator/object_generator.dart';
import 'package:graphql_client_generator/src/generator/operation_generator.dart';
import 'package:graphql_client_generator/src/generator/operation_group.dart';
import 'package:graphql_client_generator/src/generator/operation_input_generator.dart';
import 'package:graphql_client_generator/src/generator/serializer_generator.dart';
import 'package:graphql_client_generator/src/generator/utils.dart';
import 'package:graphql_client_generator/src/model/custom_scalar_map.dart';
import 'package:graphql_client_generator/src/model/schema.dart';
import 'package:graphql_client_generator/src/model/type.dart';
import 'package:graphql_client_generator/src/utils/import_resolver.dart';
import 'package:graphql_client_generator/src/whole_schema/whole_schema_query.dart';
import 'package:graphql_dart/graphql_dart.dart';
import 'package:graphql_parser/graphql_parser.dart';
import 'package:recase/recase.dart';

class GQLCodeGenerator {
  final _dartfmt = DartFormatter();
  final GQLClient gql;
  final String fragmentFilePath;
  final String operationsFilePath;
  final String outputDirectoryPath;
  final String customScalarMapPath;
  final String libraryName;
  final String packageName;
  final String url;
  final Map<String, String> customInterfaceOverrides;

  GQLCodeGenerator(
      {this.gql,
      this.fragmentFilePath,
      this.operationsFilePath,
      this.outputDirectoryPath,
      this.customScalarMapPath,
      this.libraryName,
      this.packageName,
        this.customInterfaceOverrides,
      this.url});

  Future generate() async {
    print("fetching schema…");
    final wholeSchema = await getWholeSchema(gql);

    print("parsing GQL documents");
    final fragmentFile = File(fragmentFilePath);
    final operationsFile = File(operationsFilePath);

    final fragmentsString = await fragmentFile.readAsString();
    final operationsString = await operationsFile.readAsString();

    CustomScalarMap customScalarMap;
    if (customScalarMapPath != null) {
      final customScalarMapFile = File(customScalarMapPath);
      final customScalarMapString = await customScalarMapFile.readAsString();
      customScalarMap = CustomScalarMap.fromJson(customScalarMapString);
    } else {
      customScalarMap = CustomScalarMap();
    }
    // 2. parse fragments document - raw
    final fragmentDoc = parseDocument(fragmentsString);
    // 3. parse operatons document - raw
    final operationDoc = parseDocument(operationsString);

    final Map<String, InterfaceGenerator> interfaceGenerators = {};
    // fragmentName -> interfaceFragmentName
    final Map<String, String> interfaceImplementations = {};
    // fragment type -> [union types]
    final Map<String, List<String>> unionMap = {};
    final Map<String, InputGenerator> inputGenerators = {};
    final Map<String, ObjectGenerator> objectGenerators = {};
    final Map<String, EnumGenerator> enumGenerators = {};
    final List<OperationGroup> operationGroups = [];

    // check for duplicate definitions
    final Set<String> fragmentNames = Set();
    fragmentDoc.definitions.forEach((d) {
      FragmentDefinitionContext fragmentDefinition = d;
      final fragmentName = fragmentDefinition.name;
      if (fragmentNames.contains(fragmentName)) {
        throw "duplicate fragment definition found: $fragmentName";
      }
      fragmentNames.add(fragmentName);
    });

    // process interfaces first because we need to know interfaces before we can deal with everything else.
    final interfaces = fragmentDoc.definitions
        .cast<FragmentDefinitionContext>()
        .where((f) =>
            wholeSchema.types.firstWhere(
                (t) => t.name == f.typeCondition.typeName.name, orElse: () {
              throw "could not find type for fragment: ${f.name}";
            })?.kind ==
            "INTERFACE");
    for (var fragmentDefinition in interfaces) {
      // if the fragment provided has fragment spreads, we need to declare an interface and make sure that all the declared fragment spreads turn into concrete impelemtnations of this interface
      // otherwise we just create a basic output object for this interface
      final typeName = fragmentDefinition.typeCondition.typeName.name;
      final fullType = wholeSchema.types.firstWhere((t) => t.name == typeName);
      enumGenerators.addAll(Map.fromIterable(
          requiredEnumsForType(fullType, wholeSchema),
          key: (e) => (e as EnumGenerator).typeName,
          value: (e) => e));
      final implementationFragmentNames = fragmentDefinition
          .selectionSet.selections
          .where((s) => s.fragmentSpread != null)
          .map((s) => s.fragmentSpread.name);
      if (implementationFragmentNames.length > 0) {
        final Map<String, String> implementationMap = Map.fromIterable(
            implementationFragmentNames,
            key: (e) => e,
            value: (_) => typeName);
        interfaceImplementations.addAll(implementationMap);
        interfaceGenerators[fragmentDefinition.name] =
            InterfaceGenerator(fullType, fragmentDefinition, customScalarMap);
      }
    }

    // process unions so we can apply them to applicable types later on
    final unions = fragmentDoc.definitions
        .cast<FragmentDefinitionContext>()
        .where((f) =>
            wholeSchema.types.firstWhere(
                (t) => t.name == f.typeCondition.typeName.name, orElse: () {
              throw "could not find type for fragment: ${f.name}";
            })?.kind ==
            "UNION");
    for (var fragmentDefinition in unions) {
      final typeName = fragmentDefinition.typeCondition.typeName.name;
      final fullType = wholeSchema.types.firstWhere((t) => t.name == typeName);
      for (var possibleType in fullType.possibleTypes) {
        if (unionMap.containsKey(possibleType)) {
          unionMap[possibleType].add(typeName);
        } else {
          unionMap[possibleType.name] = <String>[typeName];
        }
      }
      // unlike interfaces, unions don't have fields of their own, so we always create an interface
      interfaceGenerators[fragmentDefinition.name] =
          InterfaceGenerator(fullType, fragmentDefinition, customScalarMap);
    }

    final operations =
        operationDoc.definitions.cast<OperationDefinitionContext>();
    for (var operation in operations) {
      // crawl the operation doc and the schema to find all required inputs
      List<TypeFull> inputs = [];
      final inputVariableDefinitions =
          operation.variableDefinitions?.variableDefinitions;
      if (inputVariableDefinitions != null &&
          inputVariableDefinitions.length > 0) {
        inputVariableDefinitions.forEach((d) {
          final typeName =
              concreteTypeContextForTypeContext(d.type).typeName.name;
          // shortcut, if we found the root variable, we found all descendants too
          if (inputGenerators.containsKey(typeName) ||
              enumGenerators.containsKey(typeName)) return;
          inputs
              .addAll(gatherRequiredInputsForTypeContext(d.type, wholeSchema));
        });
      }

      // make generators for each of the inputs
      for (var input in inputs) {
        var inputTypeName = input.name;
        if (input.kind == "ENUM" &&
            !enumGenerators.containsKey(inputTypeName)) {
          enumGenerators[inputTypeName] = EnumGenerator(input);
        } else if (input.kind == "INPUT_OBJECT" &&
            !inputGenerators.containsKey(inputTypeName)) {
          inputGenerators[inputTypeName] =
              InputGenerator(input, false, customScalarMap, customInterfaceOverrides);
        }
      }

      // make generators for each of the outputs
      final operationSelections = operation.selectionSet.selections;
      for (var operationSelection in operationSelections) {
        final operationName = operationSelection.field.fieldName.alias?.name ??
            operationSelection.field.fieldName.name;
        TypeFull operationType;
        if (operation.isQuery) {
          operationType = wholeSchema.fullQueryType;
        } else {
          operationType = wholeSchema.fullMutationType;
        }
        final operationField = operationType.fields
            .firstWhere((f) => f.name == operationName, orElse: () => null);

        if (operationField == null) {
          throw "unable to find operation name: $operationName";
        }

        // verify that we have all the necessary input parameters present
        // these are the arguments given in the provided document
        final List<ArgumentContext> documentArgs =
            List.of(operationSelection.field.arguments);
        // each document arg should match a variable in the enclosing operation group
        print(documentArgs);
        for (var documentArg in documentArgs) {
          if (documentArg.valueOrVariable.variable != null) {
            final matchingArg = operation
                .variableDefinitions.variableDefinitions
                .firstWhere((ctx) {
              return ctx.variable.name ==
                  documentArg.valueOrVariable.variable.name;
            }, orElse: () => null);
            if (matchingArg == null) {
              throw "could not find ${documentArg.valueOrVariable.variable.name} in argumetns for ${operation.name}";
            }
          }
        }
        operationField.args.forEach((opArgs) {
          // in order to find out if the user has included arguments in the document that are not suppored by the operation, try to remove each arg from [documentArgs]. if there are any left after we're done, throw an error
          documentArgs.removeWhere((docArg) => docArg.name == opArgs.name);
          if (opArgs.type.kind == "NON_NULL") {
            // the schema specifies that this field must be present, it is an error if it is not
            final matchingArg = operationSelection.field.arguments.firstWhere(
                (docArgs) {
              return docArgs.name == opArgs.name;
            },
                orElse: () =>
                    throw "required arg ${operationName}#${opArgs.name} not found");

            var fieldVariable = matchingArg.valueOrVariable.variable;
            if (fieldVariable != null) {
              // the field variable should map to a non-null argument on the enclosing operation
              final operationVariable = operation
                  .variableDefinitions.variableDefinitions
                  .firstWhere((operationVariable) {
                return operationVariable.variable.name == fieldVariable.name;
              },
                      orElse: () =>
                          throw "declared variable ${fieldVariable.name} not declared in operation header ${operation.name}");
              if (operationVariable.type.EXCLAMATION == null) {
                throw "the arg ${operationName}#${opArgs.name} is required, The variable ${operationVariable.variable.name} found on the enclosing operation group needs to be NON_NULL for this to work. mark it with ! and try again";
              }
            }
          }
        });
        if (documentArgs.length > 0) {
          print(
              "found one or more extraneous input arguments for $operationName");
          documentArgs.forEach((docArg) => print("${docArg.name}"));
        }

        // verify that our outputs are correct
        final schemaReturnType = operationField.type.concreteType;
        final operationReturnFragmentName = operationSelection
            .field.selectionSet.selections[0].fragmentSpread.name;
        final FragmentDefinitionContext returnFragmentDefinition =
            fragmentDoc.definitions.firstWhere(
                (d) =>
                    (d as FragmentDefinitionContext).name ==
                    operationReturnFragmentName,
                orElse: () =>
                    throw "return type not found: $operationReturnFragmentName");
        if (schemaReturnType.name !=
            returnFragmentDefinition.typeCondition.typeName.name) {
          throw "The fragment $operationReturnFragmentName references a ${returnFragmentDefinition.typeCondition.typeName.name} which is not the required return type for $operationName which returns a ${schemaReturnType.name}";
        }
      }
      final allRequiredFragments = allRequiredFragmentsForSelections(
          operationSelections, fragmentDoc.definitions.cast());
      for (var definition in allRequiredFragments) {
        var fragmentName = definition.name;
        if (interfaceGenerators.containsKey(fragmentName)) {
          // this fragment is already accounted for as an interface
          continue;
        }
        if (objectGenerators.containsKey(fragmentName)) {
          continue;
        }
        final typeName = definition.typeCondition.typeName.name;
        final fullType =
            wholeSchema.types.firstWhere((t) => t.name == typeName);
        enumGenerators.addAll(Map.fromIterable(
            requiredEnumsForType(fullType, wholeSchema),
            key: (e) => (e as EnumGenerator).typeName,
            value: (e) => e));
        final interfaceName = interfaceImplementations[fragmentName];
        TypeFull interfaceType;
        FragmentDefinitionContext interfaceDefinition;
        if (interfaceName != null) {
          interfaceType =
              wholeSchema.types.firstWhere((t) => t.name == interfaceName);
          interfaceDefinition = allRequiredFragments.firstWhere((f) {
            return f.typeCondition.typeName.name == interfaceName;
          }, orElse: () => throw "interface not found for type: $fragmentName");
        }
        final unions = unionMap[typeName];
        objectGenerators[fragmentName] = ObjectGenerator(
            fullType, customInterfaceOverrides, definition, false, interfaceType, unions, customScalarMap,
            interfaceFragmentDefinitionContext: interfaceDefinition);
      }

      // build the input object if there are inputs required
      OperationInputGenerator inputGenerator;
      if (operation.variableDefinitions != null) {
        inputGenerator =
            OperationInputGenerator(operation, wholeSchema, customScalarMap, customInterfaceOverrides);
      }

      // build the operation output object
      final fullOperationType = operation.isQuery
          ? wholeSchema.fullQueryType
          : wholeSchema.fullMutationType;
      final outputGenerator = ObjectGenerator(
          fullOperationType, customInterfaceOverrides, operation, true, null, null, customScalarMap,
          typeNameSuffix: "Output");


      print(operation);
      // assemble the operation group
      final operationGenerator = OperationGenerator(
          operation,
          wholeSchema,
          outputGenerator.fragmentName,
          inputGenerator?.typeName,
          fragmentDoc.definitions.cast<FragmentDefinitionContext>());
      final operationGroup =
          OperationGroup(outputGenerator, inputGenerator, operationGenerator);
      operationGroups.add(operationGroup);
    }
    final importResolver = ImportResolver(packageName, libraryName);
    // create output directories
    final outputDirectory = await Directory("$outputDirectoryPath/$libraryName")
        .create(recursive: true);
    final srcDirectory =
        await _directoryFromParent(outputDirectory, "src").create();
    final modelOutputDirectory =
        await _directoryFromParent(srcDirectory, "model").create();
    final inputModelDirectory =
        await Directory("${modelOutputDirectory.path}/input").create();
    final outputModelDirectory =
        await Directory("${modelOutputDirectory.path}/output").create();
    final enumDirectory =
        await Directory("${modelOutputDirectory.path}/enum").create();
    final operationsDirectory =
        await Directory("${srcDirectory.path}/operation").create();

    // collect all the serializable types for later
    Map<Directive, List<String>> serializableModelDirectiveMap = {};
    Map<Directive, List<String>> serializableOperationDirectiveMap = {};
    List<Directive> operationExports = [];

    // write the operation files
    await Future.forEach<OperationGroup>(operationGroups, (og) async {
      final operationFolderName = ReCase(og.operationName).snakeCase;
      final operationDirectory =
          await Directory("${operationsDirectory.path}/$operationFolderName")
              .create(recursive: true);

      // write the operation file
      final queryFile = File(
          "${operationDirectory.path}/${operationFolderName}_${og.isQuery ? "query" : "mutation"}.dart");
      final operationLibrary =
          og.operationGenerator.generateLibrary(importResolver);
      final operationFileContent = _specToString(operationLibrary);
      await queryFile.writeAsString(operationFileContent);

      // write the input file if there is one
      if (og.inputGenerator != null) {
        final operationInputFileName = "${operationFolderName}_input.dart";
        final inputFile =
            File("${operationDirectory.path}/$operationInputFileName");
        final inputLibrary = og.inputGenerator.generateLibrary(importResolver);
        var operationInputFileContent = _specToString(inputLibrary);
        await inputFile.writeAsString(operationInputFileContent);
      }

      // write the output file
      final outputFileName = "${operationFolderName}_output.dart";
      final outputFile = File("${operationDirectory.path}/$outputFileName");
      final outputLibrary = og.outputGenerator.generateLibrary(importResolver);
      var operationOutputFileContent = _specToString(outputLibrary);
      await outputFile.writeAsString(operationOutputFileContent);

      // collect serializer info
      var outputTypeName = og.outputGenerator.fragmentName;
      final outputDirective =
          importResolver.operationOutputNamed(og.operationName);
      serializableOperationDirectiveMap[outputDirective] = [outputTypeName];
      if (og.inputGenerator != null) {
        var inputTypeName = og.inputGenerator.typeName;
        final inputDirective =
            importResolver.operationInputNamed(og.operationName);
        serializableOperationDirectiveMap[inputDirective] = [inputTypeName];
      }

      // export our operation
      operationExports.add(importResolver
          .operationNamed(og.operationName,
              og.isQuery ? OperationType.query : OperationType.mutation)
          .rebuild((b) => b.type = DirectiveType.export));
    });

    // write the model output files
    await Future.forEach<ObjectGenerator>(objectGenerators.values, (og) async {
      final fileName = ReCase(og.fragmentName).snakeCase;
      final file = File("${outputModelDirectory.path}/$fileName.dart");
      final library = og.generateLibrary(importResolver);
      final contents = _specToString(library);
      await file.writeAsString(contents);

      // collect serializer info
      final importDirective = importResolver.outputModelNamed(og.fragmentName);
      serializableModelDirectiveMap[importDirective] = [og.fragmentName];
    });

    // write the model output interface files
    await Future.forEach<InterfaceGenerator>(interfaceGenerators.values,
        (ig) async {
      final fileName = ReCase(ig.typeName).snakeCase;
      final file = File("${outputModelDirectory.path}/$fileName.dart");
      final library = ig.generateLibrary(importResolver);
      final contents = _specToString(library);
      await file.writeAsString(contents);

      // interfaces don't get serialized directly, so we don't collect info here
    });

    // write the input files
    await Future.forEach<InputGenerator>(inputGenerators.values, (ig) async {
      final fileName = ReCase(ig.typeName).snakeCase;
      final file = File("${inputModelDirectory.path}/$fileName.dart");
      final library = ig.generateLibrary(importResolver);
      final contents = _specToString(library);
      await file.writeAsString(contents);

      // collect serializer info
      final importDirective = importResolver.inputModelNamed(ig.typeName);
      serializableModelDirectiveMap[importDirective] = [ig.typeName];
    });

    // write the enum files
    await Future.forEach<EnumGenerator>(enumGenerators.values, (eg) async {
      final fileName = ReCase(eg.typeName).snakeCase;
      final file = File("${enumDirectory.path}/$fileName.dart");
      final library = eg.generateLibrary();
      final contents = _specToString(library);
      await file.writeAsString(contents);

      // collect serializer info
      final importDirective = importResolver.enumModelNamed(eg.typeName);
      serializableModelDirectiveMap[importDirective] = [eg.typeName];
    });

    // write the models.dart export file
    final modelsExportFile = File("${modelOutputDirectory.path}/model.dart");
    final serializableExports = serializableModelDirectiveMap.keys
        .map((d) => d.rebuild((b) => b..type = DirectiveType.export));
    final allModelExports = List.of(serializableExports)
      ..addAll(interfaceGenerators.values.map((ig) => importResolver
          .outputModelNamed(ig.typeName)
          .rebuild((b) => b..type = DirectiveType.export)));
    final modelsLibrary = Library((b) => b..directives.addAll(allModelExports));

    modelsExportFile.writeAsString(_specToString(modelsLibrary));

    // write the operations.dart export file
    final operationsExportFile =
        File("${operationsDirectory.path}/operation.dart");
    final operationModelExports = serializableOperationDirectiveMap.keys
        .map((d) => d.rebuild((b) => b..type = DirectiveType.export));
    final allOperationExports = List.of(operationModelExports)
      ..addAll(operationExports);
    final operationsLibrary =
        Library((b) => b..directives.addAll(allOperationExports));

    operationsExportFile.writeAsString(_specToString(operationsLibrary));

    // write the serializer file
    // combine serializable types
    final allSerializableTypes = Map.of(serializableModelDirectiveMap)
      ..addAll(serializableOperationDirectiveMap);
    final serializerGenerator = SerializerGenerator(allSerializableTypes);
    final serializerFile = File("${srcDirectory.path}/serializers.dart");
    final library =
        serializerGenerator.generateLibrary(importResolver, libraryName);
    final contents = _specToString(library);

    await serializerFile.writeAsString(contents);

    // write the json plugin file
    final jsonPluginGenerator = JsonPluginGenerator(libraryName, packageName,
        interfaceGenerators.values.map((ig) => ig.fragmentDefinition).toList());
    final jsonPluginLibrary = jsonPluginGenerator.generateLibrary();
    final jsonPluginLibraryFile = File(
        "${srcDirectory.path}/${ReCase(libraryName).snakeCase}_json_plugin.dart");

    await jsonPluginLibraryFile.writeAsString(_specToString(jsonPluginLibrary));

    // write the package export file
    final libraryFile = File("${outputDirectory.path}/$libraryName.dart");
    final jsonPluginExport = importResolver
        .jsonPlugin()
        .rebuild((b) => b..type = DirectiveType.export);
    final modelExport = importResolver
        .modelExportsLibrary()
        .rebuild((b) => b..type = DirectiveType.export);
    final operationExport = importResolver
        .operationExportsLibrary()
        .rebuild((b) => b..type = DirectiveType.export);
    final serializerExport = importResolver.serializerImportDirective
        .rebuild((b) => b..type = DirectiveType.export);
    final libraryLibrary = Library((b) => b
      ..directives.addAll([
        modelExport,
        operationExport,
        jsonPluginExport,
        serializerExport,
      ]));

    libraryFile.writeAsString(_specToString(libraryLibrary));
  }

  String _specToString(Spec spec) {
    return _dartfmt.format('''
    // GENERATED CODE - DO NOT MODIFY BY HAND
    
    ${spec.accept(DartEmitter())}
    ''');
  }

  Directory _directoryFromParent(Directory parent, String directoryName) {
    return Directory("${parent.path}/$directoryName");
  }

  List<TypeFull> gatherRequiredInputsForTypeContext(
      TypeContext typeContext, Schema schema) {
    if (typeContext.listType != null) {
      return gatherRequiredInputsForTypeContext(
          typeContext.listType.type, schema);
    }
    // we need to generate a type for this one at least
    final fullType = schema.typeForName(typeContext.typeName.name);
    if (fullType == null) {
      throw "The type, ${typeContext.typeName
          .name} could not be found in schema";
    }
    final requiredTypes = <TypeFull>[fullType];
    // go through each of its inputFields and find all the other types that need to come along
    if (fullType.kind == "INPUT_OBJECT") {
      requiredTypes
          .addAll(gatherRequiredTypesForRootInputType(fullType, schema));
    }
    return requiredTypes;
  }

  List<TypeFull> gatherRequiredTypesForRootInputType(
        TypeFull typeFull, Schema schema, {int level = 0, previousName = ""}) {
      assert(typeFull.kind == "INPUT_OBJECT");
      List<TypeFull> requiredTypes = [];
      for (var inputValue in typeFull.inputFields) {
        final concreteType = inputValue.type.concreteType;
        var typeForName = schema.typeForName(concreteType.name);
        if (concreteType.kind == "ENUM") {
          requiredTypes.add(typeForName);
          continue;
        }

        if (concreteType.kind == "INPUT_OBJECT" && previousName != concreteType.name) {
          requiredTypes
            ..add(typeForName)
            ..addAll(gatherRequiredTypesForRootInputType(typeForName, schema, level: 1, previousName: concreteType.name));
        }
      }
      return requiredTypes;
    }



  List<EnumGenerator> requiredEnumsForType(TypeFull type, Schema schema) {
    return type.enumTypeRefs
        .map((t) => EnumGenerator(schema.typeForName(t.concreteType.name)))
        .toList();
  }

  DocumentContext parseDocument(String doc) {
    var tokens = scan(doc);
    var parser = new Parser(tokens);

    if (parser.errors.isNotEmpty) {
      throw "invalid document";
    }

    return parser.parseDocument();
  }
}
