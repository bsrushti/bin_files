#! /bin/bash

cat test/*|awk '/\/\*/,/\*\//' > commented_code
cat test/*|grep "//" >> commented_code
lines=$(cat commented_code|wc -l)
cat commented_code
rm commented_code
if [ $lines -ne 0 ]
then
  read -p "Would you like to continue?(y/n)" choice
  if [ $choice = "y" ]
  then
    git commit
  fi
fi
exit 1;
