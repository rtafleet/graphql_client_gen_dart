import 'package:built_value/serializer.dart';
import 'package:example/github_api/github_api.dart';

void setupDiscriminator() {
  GithubApiJsonPlugin.discriminator = (Object object, FullType specifiedType) {
    if (specifiedType.root == SearchResultItem) {
      return "Repository";
    }
    if (specifiedType.root == RepositoryOwner) {
      final Map<String, dynamic> objectMap = object;
      return objectMap["type"];
    }
    return null;
  };
}