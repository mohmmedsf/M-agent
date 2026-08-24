import 'model.dart';
import 'model_provider.dart';
import 'model_registry.dart';
import 'model_router.dart';
import 'model_routing_policy.dart';

class ModelGateway {
  const ModelGateway({required this.registry});

  final ModelRegistry registry;

  Future<ModelResponse> complete(
    ModelRequest request, {
    String? providerId,
    ModelRoutingPolicy? policy,
  }) {
    final provider = _resolve(
      request.model,
      providerId: providerId,
      policy: policy,
    );
    return provider.complete(request);
  }

  Stream<ModelStreamChunk> stream(
    ModelRequest request, {
    String? providerId,
    ModelRoutingPolicy? policy,
  }) {
    final provider = _resolve(
      request.model,
      providerId: providerId,
      policy: policy,
    );
    return provider.stream(request);
  }

  ModelProvider _resolve(
    String model, {
    String? providerId,
    ModelRoutingPolicy? policy,
  }) {
    if (policy != null) {
      return policy.resolve(registry: registry, model: model);
    }

    return ModelRouter(registry).resolve(
      ModelRoute(model: model, providerId: providerId),
    );
  }
}
