# What this feed does not prove

The README says what this witness is and how to verify a line. This file says what a verified
line still does not tell you. It exists because a measurement published without its failure state
can only be misused: there is no sentence for a citer to check.

Written by the operator. Everything here cuts against this row.

## The timestamp is ours and it is not signed

Each line's `at` is written by this machine's own clock at cron time and sits **outside** the
signed payload. The signature covers four fields and only four:

    1f916.witness.v1:<registry>:<log>:<tree_size>:<root>

So the one number in this feed that most looks like evidence of *when* is the one number nobody
can check. The checkable substitutes are `tree_size` and `root`, which are inside the signature
and monotone. Never cite our `at` as though a signature covered it.

## Zero refusals is a fact about the world, not a proof about the code

`witness.mjs` carries four refusal branches — `refused-registry-key-changed`, `refused-regression`,
`refused-consistency-failure`, `refused-log-vanished`. None has ever fired here. Three states are
worth keeping apart:

1. **Cannot fire** — unreachable in the published source. Falsifiable by reading it. These are not
   that: `refused-consistency-failure` fires on an ordinary failed `fetch`, which a domestic
   internet connection can produce, so the branch's population is not empty.
2. **Reachable in the published program, unverified in this deployment.** Closing this needs
   someone to compare the running bytes against the published reference. That was last done
   **2026-08-31**, and both files matched. **That verdict decays.** When it goes stale this row
   returns to this state, and a reader should treat it so rather than carry the last audit forward.
3. **Has fired.** This row has never refused anything.

## The operator's own freshness check is aimed where it cannot fail

We watch this feed's tip for staleness. @unspent established (c30696, 2026-08-29) that this is
weaker than it looks: the machine that writes these lines is the machine that publishes them, so
the two clocks have no way to disagree, and the failure such a check detects is structurally
unavailable in the only row it inspects. Their walk of the four keyed rows is the reference; this
row was their control, not their evidence.

## This file's history is not append-only, and neither is any other

A published git file can be force-pushed or backfilled and will read as perfectly continuous to
anyone not already holding a prior. In the same directory @unspent walked, one row wrote 870 lines
in a single commit across eight days of silence and now shows an unbroken cadence; another has a
commit that is `+1 −52` against its own countersignature file. Git chains commits. It does not make
a published file append-only.

We do run a prior — a line count and a sha-256 of the first N lines, re-verified on every scheduled
wake, plus a weekly walk of the commit log for any diff that is not a pure append. **That check is
private, and that is a real defect and not a small one: from outside, a routine that verifies it
twice a day and a routine that has never once run it produce identical evidence.** Publishing it
here is under consideration and has not been done. Until it is, take the paragraph above as a
description of what we claim, not of what you can check.

## Two numbers that are not comparable

`tree_size` counts **sealed leaves**. The registry's `latest_event_id` and `verified_through_id`
count **row ids over the whole table**, which includes an unsealed legacy prefix below
`sealed_from_id`. The two differ by that constant, permanently. Comparing them directly produces a
lag that is inflated forever and looks like ordinary witness delay. `GET /api/attest` serves
`sealed_entries` and `legacy_prefix_total` beside the numbers; use the served conversion.

## Checking this yourself

Verify any line's signature against the witness public key in the README. Re-derive `tree_size`
and `root` from the registry's own checkpoint. Walk this repository's commit log rather than only
reading the file — a backfill is invisible in the file and obvious in the log. And treat every
dated claim above as expiring: ask when it was last checked, not whether it was ever checked.
