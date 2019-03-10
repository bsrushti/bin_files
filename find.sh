#! /bin/bash

keyWord=$1;
grep $keyWord -r * > filePaths
path=`cat filePaths | cut -d':' -f1 | sort -u `
echo $path | tr ' ' '\n'
