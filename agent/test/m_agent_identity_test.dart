import 'package:sanad_agent/m_agent/identity.dart';
import 'package:test/test.dart';

void main() {
  test('exposes the M Agent product identity', () {
    expect(MAgentIdentity.productName, 'M Agent');
    expect(MAgentIdentity.packageName, 'm_agent');
    expect(MAgentIdentity.description,
        'A local-first, cross-platform AI agent platform.');
    expect(MAgentIdentity.architectureVersion, '0.1');
  });
}
