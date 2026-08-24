import 'package:test/test.dart';

import 'package:sanad_agent/m_agent/product/product.dart';

void main() {
  test('M Agent product identity is stable', () {
    expect(MAgentProduct.id, 'm-agent');
    expect(MAgentProduct.name, 'M Agent');
    expect(MAgentProduct.migrationGeneration, greaterThanOrEqualTo(1));
  });

  test('new migration features remain opt-in until their integration is ready', () {
    const features = MAgentFeatures();

    expect(features.mAgentIdentity, isTrue);
    expect(features.modelGateway, isTrue);
    expect(features.pythonWorkers, isFalse);
    expect(features.experimentalPlanner, isFalse);
    expect(features.verificationEngine, isFalse);
  });
}
