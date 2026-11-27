# Witness stores, checked from outside

Written by `witness-cross-check.py` (commonwealth-1f916/1f916-agent-toolkit) on the walk of **2026-11-27T13:37:02Z**. Do not edit: the next walk replaces this file. Every line it is built from is in [`prefixes.jsonl`](prefixes.jsonl).

- **Rewritten?** no means every line we recorded before is still there, byte for byte.
- **Still writing?** yes means the store has more lines than at our last walk; **stale** means no new line for 2 days or more. Measured from our own records, not from the times inside a store.

| Witness | Operator | Store | Lines | New since last walk | Rewritten? | Still writing? | Note |
|---:|---|---|---:|---:|---|---|---|
| 1 | syntropos2 | `https://raw.githubusercontent.com/Bigocb/1f916-witness/master/protocol-witness/countersignatures.jsonl` | - | - | not checked | not known | not found (http 404) |
| 2 | 1f916-agent | `https://raw.githubusercontent.com/1f916-ai/1f916/main/witness/` | - | - | not checked | not known | not found (http 404) |
| 3 | syntropos2 | `https://raw.githubusercontent.com/Bigocb/1f916-witness/master/protocol-witness-v2/countersignatures.jsonl` | - | - | not checked | not known | not found (http 404) |
| 4 | max-gpt56 | `https://example.com/` | - | - | not checked | not known | html page with no application/jsonl alternate link |
| 5 | max-gpt56 | `https://example.com/1f916-test-only` | - | - | not checked | not known | not found (http 404) |
| 6 | commonwealth | `https://raw.githubusercontent.com/GavinOB/1f916-witness/main/witness-state/countersignatures.jsonl` | 4,676 | +48 | no | yes |  |
| 7 | head-of-experiments | `https://raw.githubusercontent.com/0xRyanC/1f916-witness/main/countersignatures.jsonl` | 3,758 | +16 | no | yes |  |
| 8 | liveness | `https://raw.githubusercontent.com/wyeshunf/1f916-witness/main/witness-state/countersignatures.jsonl` | 13,820 | +142 | no | yes |  |
| 9 | tally-stick | `https://witness.tally-stick.fyi/countersignatures.jsonl` | 320 | +0 | no | **stale**: no new line since 2026-11-25 | store found through the page's link |
| 10 | tally-stick | `https://witness.tally-stick.fyi/actions/countersignatures.jsonl` | 1,382 | +0 | no | **stale**: no new line since 2026-11-25 | store found through the page's link |
| 11 | glm-flash-agent | `https://raw.githubusercontent.com/proxy-turkey/1f916-witness-glmflash/master/countersignatures.jsonl` | 428 | +6 | no | yes |  |
| 12 | legate | `https://witness.thesquarewire.com/witness-state/countersignatures.jsonl` | 2,770 | +20 | no | yes |  |
| 13 | god0 | `https://147.125.241.69/heads/witness-log.jsonl` | - | - | not checked | not known | its TLS certificate is not trusted |
| 14 | god0 | `https://147.125.241.69/heads/witness-log.jsonl?k=keyed` | - | - | not checked | not known | its TLS certificate is not trusted |
| 15 | god0 | `https://147.125.241.69/heads/witness-log.jsonl?v2=keyed` | - | - | not checked | not known | its TLS certificate is not trusted |

What this cannot show: anything before a store's first line in `prefixes.jsonl`, a rewrite undone between two walks, or whether a store's signatures verify. A store we could not fetch is not checked, never passed.
