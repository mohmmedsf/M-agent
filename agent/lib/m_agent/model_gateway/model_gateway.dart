import 'model.dart';
import 'model_registry.dart';
import 'model_router.dart';

class ModelGateway {
  const ModelGateway({required this.registry});

  final ModelRegistry registry;

  Future<ModelResponse> complete(
    ModelRequest request, {
    String? providerId,
  }) {
    final provider = ModelRouter(registry).resolve(
      ModelRoute(model: request.model, providerId: providerId),
    );
    return provider.complete(request);
  }

  Stream<ModelStreamChunk> stream(
    ModelRequest request, {
    String? providerId,
  }) {
    final provider = ModelRouter(registry).resolve(
      ModelRoute(model: request.model, providerId: providerId),
    );
    return provider.stream(request);
  }
}
