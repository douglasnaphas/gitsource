#!/bin/bash
cd /usr/local/src/git/
git reset --hard
git fetch origin
git checkout master
git merge origin/master
make && make install && make man && make install-man
