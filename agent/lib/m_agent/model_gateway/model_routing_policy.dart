import 'model_provider.dart';
import 'model_registry.dart';

class ModelRoutingPolicy {
  const ModelRoutingPolicy({
    this.preferredProviderId,
    this.fallbackProviderIds = const <String>[],
    this.requiredCapabilities = const <ModelCapability>{},
  });

  final String? preferredProviderId;
  final List<String> fallbackProviderIds;
  final Set<ModelCapability> requiredCapabilities;

  ModelProvider resolve({
    required ModelRegistry registry,
    required String model,
  }) {
    final candidateIds = <String>[
      if (preferredProviderId != null) preferredProviderId!,
      ...fallbackProviderIds,
    ];

    for (final id in candidateIds) {
      final provider = registry.byId(id);
      if (provider == null || !provider.supports(model)) continue;
      final capabilities = provider.capabilities(model);
      if (capabilities.containsAll(requiredCapabilities)) return provider;
    }

    final provider = registry.resolve(model);
    final capabilities = provider.capabilities(model);
    if (!capabilities.containsAll(requiredCapabilities)) {
      throw StateError(
        'No provider supports $model with required capabilities: '
        '$requiredCapabilities',
      );
    }
    return provider;
  }
}
