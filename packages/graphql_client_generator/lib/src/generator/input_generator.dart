import 'package:code_builder/code_builder.dart';
import 'package:graphql_client_generator/src/generator/utils.dart';
import 'package:graphql_client_generator/src/model/custom_scalar_map.dart';
import 'package:graphql_client_generator/src/model/type.dart';
import 'package:graphql_client_generator/src/utils/import_resolver.dart';
import 'package:recase/recase.dart';

class InputGenerator {
  final TypeFull typeInfo;
  final bool addGQLMapSerializer;
  final CustomScalarMap customScalarMap;
  final Map<String, String> customInterfaceOverrides;

  String get fileName => ReCase(typeName).snakeCase;

  String get fileNameWithExtension => "$fileName.dart";

  String get typeName => typeInfo.name;

  InputGenerator(
    this.typeInfo,
    this.addGQLMapSerializer,
    this.customScalarMap,
      this.customInterfaceOverrides,
  ) : assert(typeInfo.kind == "INPUT_OBJECT");

  Library generateLibrary(ImportResolver importResolver) {
    final Map<String, Directive> includedImports =
        standardBuiltValueImportDirectives();
    final List<Spec> libraryBodySpecs = [partFileSpec(fileName)];

    final List<MethodInfo> classFields = typeInfo.inputFields.map((f) {
      final MethodInfo methodInfo = methodInfoForTypeRef(
          f.name,
          f.type,
          null,
          f.description,
          importResolver,
          (typeName) => importResolver.inputModelNamed(typeName),
          customScalarMap);
      includedImports.addAll(methodInfo.requiredImports);
      return methodInfo;
    }).toList();
    final List<MethodInfo> otherMembers = [];

    if (addGQLMapSerializer) {
      includedImports["serializers"] = importResolver.serializerImportDirective;

      final gqlSerializerMethod = Method((b) {
        b.static = false;
        b.lambda = true;
        b.returns = TypeReference((b) {
          b.symbol = "Map";
          b.types.addAll([refer("String"), refer("dynamic")]);
        });
        b.name = "toGQLMap";
        b.body =
            Code("serializers.serializeWith(${typeName}.serializer, this)");
      });
      otherMembers.add(MethodInfo(gqlSerializerMethod, {}, false, true));
    }

    final classDef = standardBuiltValueClass(
        typeName, customInterfaceOverrides, classFields, otherMembers, <MethodInfo>[],
        description: typeInfo.description);
    libraryBodySpecs.add(classDef);

    final imports = includedImports.values.toList();
    if (classFields.any((mi) => mi.isRequired)) {
      imports.add(Directive.import("package:meta/meta.dart"));
    }
    final library = Library((b) {
      b.body.addAll(libraryBodySpecs);
      b.directives.addAll(imports);
    });
    return library;
  }
}
