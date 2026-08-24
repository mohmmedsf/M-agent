/// Product identity for M Agent.
///
/// This module intentionally contains no runtime dependencies. Keeping product
/// identity separate from the Sanad execution internals lets us migrate the
/// product surface incrementally without coupling branding changes to runtime
/// behavior.
abstract final class MAgentIdentity {
  static const productName = 'M Agent';
  static const packageName = 'm_agent';
  static const description =
      'A local-first, cross-platform AI agent platform.';
  static const architectureVersion = '0.1';
}
