import 'model_provider.dart';
import 'model_registry.dart';

class ModelRoute {
  const ModelRoute({
    required this.model,
    this.providerId,
  });

  final String model;
  final String? providerId;
}

class ModelRouter {
  const ModelRouter(this.registry);

  final ModelRegistry registry;

  ModelProvider resolve(ModelRoute route) {
    if (route.providerId != null) {
      final provider = registry.byId(route.providerId!);
      if (provider == null) {
        throw StateError('Unknown model provider: ${route.providerId}');
      }
      if (!provider.supports(route.model)) {
        throw StateError(
          'Provider ${route.providerId} does not support ${route.model}',
        );
      }
      return provider;
    }

    return registry.resolve(route.model);
  }
}
