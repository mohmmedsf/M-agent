/// Central feature switches for staged M Agent migration.
///
/// Keep these switches deterministic and local. They are migration guards,
/// not a remote experimentation system.
final class MAgentFeatures {
  const MAgentFeatures({
    this.mAgentIdentity = true,
    this.modelGateway = true,
    this.pythonWorkers = false,
    this.experimentalPlanner = false,
    this.verificationEngine = false,
  });

  final bool mAgentIdentity;
  final bool modelGateway;
  final bool pythonWorkers;
  final bool experimentalPlanner;
  final bool verificationEngine;
}
