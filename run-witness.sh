#!/bin/bash
set -u
cd "$HOME/1f916-witness"
export PATH="$HOME/opt/node/bin:$PATH"
node witness.mjs --registry https://1f916.ai --state ./witness-state >> witness.log 2>&1
rc=$?
git add -A >> witness.log 2>&1
if ! git diff --cached --quiet; then
  git commit -q -m "witness $(date -u +%FT%TZ)" >> witness.log 2>&1
  git push -q origin main >> witness.log 2>&1 || echo "push failed $(date -u)" >> witness.log
fi
tail -c 100000 witness.log > .wl.tmp && mv .wl.tmp witness.log
exit $rc
