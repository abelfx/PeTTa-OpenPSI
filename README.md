# PeTTa-OpenPSI
A PeTTa port to hyperon openpsi

An optional PRISM action-control adapter is available at
`main/mind-agents/action-planner/prism-openpsi.metta`. It uses this repository's
native `action-planner-v2.metta` rule matching and successor generation while
PRISM ranks reachable next states. Import both modules from the calling MeTTa
entry point; the original planner is unchanged. The feedback loop also exposes
`psi-agent-loop-prism` as an opt-in dispatcher while `psi-agent-loop` keeps its
legacy planner. The integration contract and
reproducible test are documented in the workspace PRISM checkout at
`prism/docs/openpsi-integration.md`.
