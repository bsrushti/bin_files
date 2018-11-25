#! /bin/bash
file=$1
length=$(cat $file | tr " -~" "1" | sort | tail -1 | wc -c)
echo "$length"
