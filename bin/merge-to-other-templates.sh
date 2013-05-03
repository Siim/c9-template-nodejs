#!/bin/bash -e
if which git-keep-alive >/dev/null; then
  git-keep-alive &
fi

cd `dirname $0`
cd ../..
for T in c9-template-*; do
  if [ $T == c9-template-root ]; then
    continue
  fi
  echo $T
  cd $T
  ( set -x
    git fetch -q --all
    git checkout -q master
    git pull -q --no-edit
    git merge --no-edit root/master
    git push -q origin master
  )
  cd ..
  echo
done

echo Done.
