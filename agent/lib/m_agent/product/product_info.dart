/// Product identity and compatibility metadata for M Agent.
///
/// This is intentionally isolated from the inherited Sanad runtime so the
/// product can evolve without coupling product concerns to execution code.
final class MAgentProduct {
  MAgentProduct._();

  static const id = 'm-agent';
  static const name = 'M Agent';
  static const codename = 'foundation';
  static const runtimeFamily = 'sanad-compatible';

  /// Current migration generation. This is not the application version.
  static const migrationGeneration = 1;

  /// Minimum contract generation understood by M Agent-specific extensions.
  static const minimumContractGeneration = 1;
}
