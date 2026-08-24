import 'package:test/test.dart';

import 'package:sanad_agent/m_agent/model_gateway/model.dart';
import 'package:sanad_agent/m_agent/model_gateway/model_gateway.dart';
import 'package:sanad_agent/m_agent/model_gateway/model_provider.dart';
import 'package:sanad_agent/m_agent/model_gateway/model_registry.dart';
import 'package:sanad_agent/m_agent/model_gateway/model_router.dart';

class _FakeProvider implements ModelProvider {
  _FakeProvider(this.id, this.models);

  @override
  final String id;

  final Set<String> models;

  @override
  String get displayName => id;

  @override
  bool supports(String model) => models.contains(model);

  @override
  Set<ModelCapability> capabilities(String model) => {
        ModelCapability.streaming,
        ModelCapability.toolCalling,
      };

  @override
  Future<ModelResponse> complete(ModelRequest request) async =>
      ModelResponse(
        provider: id,
        model: request.model,
        output: 'ok',
      );

  @override
  Stream<ModelStreamChunk> stream(ModelRequest request) async* {
    yield const ModelStreamChunk(text: 'ok');
    yield const ModelStreamChunk(text: '', isFinal: true);
  }
}

void main() {
  test('registry resolves a model to a capable provider', () {
    final registry = ModelRegistry([
      _FakeProvider('provider-a', {'model-a'}),
      _FakeProvider('provider-b', {'model-b'}),
    ]);

    expect(registry.resolve('model-b').id, 'provider-b');
  });

  test('router honors an explicit provider', () {
    final registry = ModelRegistry([
      _FakeProvider('provider-a', {'model-a'}),
      _FakeProvider('provider-b', {'model-a'}),
    ]);

    final router = ModelRouter(registry);
    expect(
      router
          .resolve(const ModelRoute(model: 'model-a', providerId: 'provider-b'))
          .id,
      'provider-b',
    );
  });

  test('gateway delegates completion to the resolved provider', () async {
    final registry = ModelRegistry([
      _FakeProvider('provider-a', {'model-a'}),
    ]);
    final gateway = ModelGateway(registry: registry);

    final response = await gateway.complete(
      const ModelRequest(model: 'model-a', input: 'hello'),
    );

    expect(response.provider, 'provider-a');
    expect(response.output, 'ok');
  });

  test('registry fails clearly for an unsupported model', () {
    final registry = ModelRegistry([_FakeProvider('provider-a', {'model-a'})]);

    expect(
      () => registry.resolve('missing-model'),
      throwsA(isA<StateError>()),
    );
  });
}
