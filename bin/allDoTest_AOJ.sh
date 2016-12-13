#!/bin/bash -ue

find -mindepth 2 -maxdepth 2 -type d | grep -v ".git" | xargs -n 1 bin/doTest_AOJ.sh 2> /dev/null
