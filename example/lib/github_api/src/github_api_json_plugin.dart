import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:example/github_api/src/model/model.dart';

typedef String InterfaceDiscriminator(Object object, FullType specifiedType);

class GithubApiJsonPlugin implements SerializerPlugin {
  GithubApiJsonPlugin(this.standardJsonPlugin);

  static InterfaceDiscriminator _discriminator;

  static const List<Type> _interfaceTypes = [RepositoryOwner, SearchResultItem];

  final StandardJsonPlugin standardJsonPlugin;

  static set discriminator(InterfaceDiscriminator discriminator) {
    _discriminator = discriminator;
  }

  static InterfaceDiscriminator get discriminator {
    return _discriminator ?? (obj, type) => null;
  }

  @override
  Object afterDeserialize(Object object, FullType specifiedType) {
    return standardJsonPlugin.afterDeserialize(object, specifiedType);
  }

  @override
  Object afterSerialize(Object object, FullType specifiedType) {
    return standardJsonPlugin.afterSerialize(object, specifiedType);
  }

  @override
  Object beforeDeserialize(Object object, FullType specifiedType) {
    if (_interfaceTypes.contains(specifiedType.root)) {
      final discriminatorValue = discriminator(object, specifiedType);
      if (discriminatorValue == null) {
        throw GithubApiSerializationError(
            "no discriminator value found when parsing interface: $specifiedType");
      }
      (object as Map<String, dynamic>)["\$"] = discriminatorValue;
    }
    return standardJsonPlugin.beforeDeserialize(object, specifiedType);
  }

  @override
  Object beforeSerialize(Object object, FullType specifiedType) {
    return standardJsonPlugin.beforeSerialize(object, specifiedType);
  }
}

class GithubApiSerializationError extends Error {
  GithubApiSerializationError(this.message);

  String message;
}
