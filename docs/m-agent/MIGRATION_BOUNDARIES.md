# M Agent migration boundaries

M Agent is a productized fork of Sanad. The migration is intentionally incremental.

## Keep stable

The inherited runtime remains the source of truth for existing behavior until an M Agent replacement has equivalent tests and an explicit migration decision.

Protected areas include:

- agent lifecycle and orchestration
- context/history/checkpoint behavior
- tool execution and plugin contracts
- recovery semantics
- existing platform adapters

## M Agent-owned areas

New product behavior lives under explicit M Agent boundaries where practical:

- `agent/lib/m_agent/`
- M Agent product configuration
- model routing extensions
- future worker contracts
- verification and repair layers
- product-specific policies

## Migration rule

Do not rewrite an inherited subsystem only to make its code look different. A rewrite requires at least one of:

1. a measurable correctness/security problem;
2. a product requirement that the existing boundary cannot satisfy;
3. a performance bottleneck demonstrated by profiling;
4. a maintainability problem with a concrete replacement plan.

Every migrated subsystem must have regression coverage before the old path is removed.

## Upstream synchronization

The fork should periodically compare against the upstream Sanad repository. Upstream changes are reviewed individually; they are never merged blindly into M Agent.

## Compatibility strategy

During migration, M Agent-specific APIs may coexist with inherited Sanad APIs. Public naming changes happen only after call sites, tests, packaging, release metadata, and documentation have been migrated together.
