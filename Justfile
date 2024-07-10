rebase-from-fork:
  git remote add forked git@github.com:tweag/rust-alpine-mimalloc.git || true
  git rebase forked/master
