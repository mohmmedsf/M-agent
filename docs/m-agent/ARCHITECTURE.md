# M Agent Architecture Direction

## Principle

M Agent is developed as a focused product fork: retain proven Sanad runtime capabilities where they are strong, then add M Agent-specific execution, intelligence, security, and product layers.

## High-level model

```text
Flutter / CLI / Web clients
            |
            v
      Agent Gateway
            |
            v
       Agent Runtime
            |
   +--------+---------+----------------+
   |        |         |                |
 Planner  Scheduler  Memory        Model Gateway
   |        |         |                |
   +--------+---------+----------------+
            |
       Tool / Worker Layer
            |
     gRPC / Protobuf contracts
            |
   +--------+---------+----------------+
   |                  |                |
 Python workers   Native workers   External workers
```

## Runtime boundaries

### Core runtime

Owns orchestration, lifecycle, task state, events, checkpoints, recovery, policy evaluation, and model/tool coordination.

### Model gateway

The runtime depends on a provider-neutral model interface. Provider credentials, model capabilities, streaming, tool calling, structured output, and routing remain behind that boundary.

### Tool layer

Tools are explicit capabilities with schemas, permissions, timeouts, side-effect metadata, and execution policies.

### Worker layer

Long-running or language-specific execution is isolated behind a language-neutral contract. Python is the first extended worker ecosystem. Native workers can be introduced later when justified.

### Platform layer

Operating-system-specific process, filesystem, shell, credential, notification, and sandbox behavior must remain behind platform adapters.

## Model routing

The product should support both explicit user selection and policy-driven routing.

```text
Task
  |
  v
Model Router
  +--> planning model
  +--> coding model
  +--> vision model
  +--> fallback model
```

The router must not leak provider-specific implementation details into the runtime.

## Durable execution

Every long-running execution should be designed around observable state transitions:

```text
Run -> Turn -> Step -> ToolCall -> ToolResult
                 |
                 +--> Checkpoint
                 |
                 +--> Recovery
```

Recovery must distinguish safe replay from operations with external side effects.

## Verification and repair

Completion is evidence-based:

```text
Plan -> Execute -> Verify
                 |
              failure
                 |
              Diagnose
                 |
               Repair
                 |
              Verify
```

The repair loop is bounded and observable.

## Cross-platform contract

Windows, macOS, and Linux are first-class targets. Shared runtime behavior stays platform-neutral while OS-specific implementations live behind adapters.

## Rust policy

Rust is not a default runtime dependency. A subsystem can be rewritten or augmented in Rust only after benchmark and profiling evidence identifies a meaningful bottleneck or a native/security requirement that justifies the additional language boundary.

## Upstream strategy

The fork should remain synchronizable with upstream while M Agent-specific changes are isolated and documented. Before importing upstream changes:

1. Identify the affected subsystem.
2. Compare upstream and M Agent behavior.
3. Run the relevant regression suite.
4. Resolve conflicts deliberately.
5. Record any intentional divergence.
