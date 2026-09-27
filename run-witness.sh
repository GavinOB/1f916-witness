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
tail -c 100000 witness.log > .wl.tmp && mv .wl.tmp witness.log
# The reader's own status wins; a reader that succeeded but could not publish exits 4.
[ "$rc" -ne 0 ] && exit "$rc"
[ "$pub" -ne 0 ] && exit 4
exit 0
