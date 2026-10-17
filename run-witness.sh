#!/bin/bash
set -u
cd "$HOME/1f916-witness" || exit 3
export PATH="$HOME/opt/node/bin:$PATH"
node witness.mjs --registry https://1f916.ai --state ./witness-state >> witness.log 2>&1
rc=$?
# Publishing is add, commit, push. Until 2026-09-27 each failure was logged and
# swallowed, so a publish that failed for twelve hours exited 0 every hour.
pub=0
git add -A >> witness.log 2>&1 || { echo "add failed $(date -u)" >> witness.log; pub=1; }
if [ "$pub" = 0 ] && ! git diff --cached --quiet; then
  git commit -q -m "witness $(date -u +%FT%TZ)" >> witness.log 2>&1 || { echo "commit failed $(date -u)" >> witness.log; pub=1; }
  [ "$pub" = 0 ] && { git push -q origin main >> witness.log 2>&1 || { echo "push failed $(date -u)" >> witness.log; pub=1; }; }
fi
# Registry push (2026-10-17): after the rows are public, hand the newest row per
# log to POST /api/witnesses/6/countersignatures, so the registry signs when it
# received them -- the outside clock this witness lacks. Only after a clean
# publish, so a receipt never predates the public row. A failure is logged as
# "countersig failed", which witness-alert's publish check deliberately does not
# match, and never changes the exit status: the witness's job is the file.
if [ "$rc" -eq 0 ] && [ "$pub" -eq 0 ]; then
  for log in identity_events ledger; do
    body=$(node -e '
      const fs=require("fs"); const want=process.argv[1];
      const rows=fs.readFileSync("witness-state/countersignatures.jsonl","utf8").trim().split("\n").map(l=>JSON.parse(l));
      const r=rows.filter(x=>x.log===want&&x.status==="countersigned").pop();
      if(!r) process.exit(2);
      process.stdout.write(JSON.stringify({log:r.log,tree_size:Number(r.tree_size),root:r.root,witness_sig:r.witness_sig}));
    ' "$log") || { echo "countersig failed no-row $log $(date -u)" >> witness.log; continue; }
    code=$(printf '%s' "$body" | curl -q -sS --proto '=https' --max-time 20 -o "$HOME/.witness-push.out" -w '%{http_code}' \
      -H 'Content-Type: application/json' --data-binary @- \
      https://1f916.ai/api/witnesses/6/countersignatures 2>>witness.log) || code=000
    case "$code" in
      200|201) { tr -d '\n' < "$HOME/.witness-push.out"; echo; } >> witness-state/push-receipts.jsonl ;;
      *) echo "countersig failed http $code $log $(date -u)" >> witness.log ;;
    esac
    rm -f "$HOME/.witness-push.out"
  done
fi
tail -c 100000 witness.log > .wl.tmp && mv .wl.tmp witness.log
# The reader's own status wins; a reader that succeeded but could not publish exits 4.
[ "$rc" -ne 0 ] && exit "$rc"
[ "$pub" -ne 0 ] && exit 4
exit 0
