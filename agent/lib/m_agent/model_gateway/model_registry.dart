import 'model_provider.dart';

class ModelRegistry {
  ModelRegistry([Iterable<ModelProvider> providers = const <ModelProvider>[]])
      : _providers = <String, ModelProvider>{
          for (final provider in providers) provider.id: provider,
        };

  final Map<String, ModelProvider> _providers;

  Iterable<ModelProvider> get providers => _providers.values;

  void register(ModelProvider provider) {
    _providers[provider.id] = provider;
  }

  bool remove(String providerId) => _providers.remove(providerId) != null;

  ModelProvider? byId(String providerId) => _providers[providerId];

  ModelProvider resolve(String model) {
    for (final provider in _providers.values) {
      if (provider.supports(model)) return provider;
    }
    throw StateError('No model provider registered for: $model');
  }
}
