import 'model.dart';

enum ModelCapability {
  streaming,
  toolCalling,
  vision,
  structuredOutput,
}

abstract interface class ModelProvider {
  String get id;

  String get displayName;

  bool supports(String model);

  Set<ModelCapability> capabilities(String model);

  Future<ModelResponse> complete(ModelRequest request);

  Stream<ModelStreamChunk> stream(ModelRequest request);
}
