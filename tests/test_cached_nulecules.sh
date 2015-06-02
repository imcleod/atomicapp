#!/bin/sh

let failures=0

for testdir in `ls cached_nulecules`; do
  pushd cached_nulecules/$testdir
  echo Doing pretend test here
  #atomicapp --verbose --dry-run run ./
  if ../../../atomicapp/cli/main.py --verbose --dry-run run ./; then
      echo success!
  else
      echo FAILED
      let failures+=1
  fi
  popd
done

if [ "$failures" -eq "0" ]; then
    echo No failures
    exit 0
else
    echo $failures failures
    exit 1
fi
