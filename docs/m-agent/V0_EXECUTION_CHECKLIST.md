# V0 execution checklist

## Foundation

- [x] M Agent product identity boundary
- [x] Product feature switches
- [x] Public foundation exports
- [x] Product foundation tests
- [x] Migration boundary policy
- [ ] Package/app naming migration
- [ ] Release metadata migration
- [ ] CI build matrix verification
- [ ] Upstream synchronization workflow

## Runtime integration

- [ ] Integrate model gateway with the existing LLM adapter without duplicating execution logic
- [ ] Preserve streaming and tool-calling semantics
- [ ] Add provider configuration and secret handling
- [ ] Add retry, timeout and cancellation policy
- [ ] Add model-call observability

## Execution platform

- [ ] Worker contract
- [ ] Python worker reference implementation
- [ ] Worker lifecycle and health
- [ ] Resource limits
- [ ] Permissions and sandbox policy

## Agent capabilities

- [ ] Planner
- [ ] Task graph
- [ ] Verification
- [ ] Repair loop
- [ ] Memory
- [ ] RAG
- [ ] Skills
- [ ] Multi-agent

A checkbox is only considered complete when the implementation has tests appropriate to its risk and the relevant desktop builds remain healthy.
