# M Agent Roadmap

> This document defines the product direction for the M Agent fork of Sanad Agent.

## North Star

M Agent is a local-first, cross-platform agent platform built on the existing Sanad runtime foundation and extended with stronger model routing, verification, self-repair, memory/RAG, skills, workers, and multi-agent execution.

## Current Baseline

- Upstream foundation: `EastStarAI/sanad-agent`
- Fork: `mohmmedsf/M-agent`
- Baseline release: `v1.0.6`
- Development branch: `m-agent/sprint-0-foundation`
- Primary runtime/client stack: Dart + Flutter

## V0 — Foundation

- Preserve the proven runtime, tool, provider, checkpoint, recovery, plugin, and cross-platform foundations.
- Establish M Agent identity and product boundaries.
- Keep upstream synchronization deliberate and traceable.
- Establish baseline tests and platform CI.
- Define M Agent-specific interfaces without breaking existing runtime contracts.

## V0.1 — Execution Kernel

- Runtime lifecycle hardening.
- Scheduler and task queue.
- Concurrency, cancellation, timeout, retry, and worker management.
- Tool registry and execution policies.

## V0.2 — Durable Execution

- Checkpoints.
- Journal/recovery.
- Idempotency and replay policy.
- Resume interrupted work safely.

## V0.3 — Safe Execution

- Process isolation.
- Permission boundaries.
- CPU, memory, time, disk, and network limits.
- Platform-specific sandbox adapters.

## V0.4 — Model Gateway

- Unified provider abstraction.
- OpenAI, Anthropic/Claude, Google/Gemini, DeepSeek, Qwen, Ollama, and OpenAI-compatible endpoints.
- Streaming, tool calling, structured output, capabilities, and model registry.
- Multiple accounts per provider.

## V0.5 — Agent Loop

- Goal → model → action → observation loop.
- Tool-aware context management.
- Robust streaming and interruption behavior.

## V0.6 — Planner

- Task decomposition.
- Task graph.
- Dependencies and parallelizable work.
- Planning checkpoints.

## V0.7 — Verification

- Explicit success criteria.
- Automated validation after actions.
- Evidence-based completion rather than model claims.

## V0.8 — Self-Repair

- Failure diagnosis.
- Repair plans.
- Bounded retries.
- Loop detection and escalation to the user when needed.

## V0.9 — Production Hardening

- Security review.
- Performance profiling.
- Reliability testing.
- Cross-platform release validation.

## V1.0 — Production M Agent

A complete desktop-first agent platform with:

- Durable execution.
- Multi-model support and routing.
- Tools and workers.
- Planner and task graph.
- Verification and self-repair.
- Python integration.
- Filesystem, terminal, Git, and artifact workflows.
- Permissions and security controls.
- Windows, macOS, and Linux support.

## V1.x — Intelligence and Ecosystem

- Working, project, and long-term memory.
- RAG for documents and codebases.
- Skills SDK.
- Plugin ecosystem.
- Multi-agent orchestration.
- Remote execution.

## V2 — Agent Platform

- Local + remote + cloud runtimes.
- Worker SDK.
- Provider SDK.
- Skill/tool ecosystem.
- Team and organization controls.
- Evaluation and observability platform.

## V3 — Scale

- Distributed worker scheduling.
- Durable queues.
- Autoscaling.
- Distributed storage.
- Advanced multi-agent coordination.

## Engineering Rules

1. Do not rewrite working Sanad subsystems without a measured reason.
2. Every M Agent-specific architectural boundary must have tests.
3. Cross-platform behavior is a first-class requirement.
4. Provider/model selection must remain decoupled from the core runtime.
5. Rust is introduced only after profiling demonstrates a material need.
6. Security boundaries are enforced by the operating system and explicit policy, not by language choice alone.
7. New capabilities should be observable, recoverable, and testable.
8. Upstream changes must be reviewed before synchronization.
