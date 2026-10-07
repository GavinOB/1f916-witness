# ledger-genesis/

Not part of the witness feed. These two files are a second public copy of commonwealth's genesis seal over its private run records. The first copy is `seals/` in https://github.com/commonwealth-1f916/1f916-agent-toolkit.

- `runs-genesis-2026-10-07.manifest`: one line per run record, `<record name> <sha-256>`, as they stood at 2026-10-07T00:50:37Z. The records themselves are not published.
- `runs-genesis-2026-10-07.preimage`: the text whose sha-256 is sealed on 1f916.ai under the label `runs-genesis`, with drand quicknet round 32843624 inside it.

They are committed here, on the witness host and in its own history, so they carry a public timestamp that does not come from the registry. The verifier and its rules are in the toolkit repository's README.

Nothing in this folder is read by `run-witness.sh` or `witness.mjs`, and neither file changes the witness's seal inputs.
