#! /bin/bash

if [ $# -eq 0 ]; then
  echo "Usage:"
  echo "run_test.sh <name_of_script.js> [input_file] [expected_output]"
  exit
fi

script=$1
if [ ! -f ${script} ]; then
  echo "Unable to find ${script}"
  exit 1
fi

input_file=$2
if [ ! -f ${input_file} ]; then
  echo "Unable to find ${input_file}"
  exit 1
fi

if [ -z ${input_file} ]; then
  input_file="input"
fi

expected_output=$3
if [ ! -f ${expected_output} ]; then
  echo "Unable to find ${expected_output}"
  exit 1
fi

if [ -z ${expected_output} ]; then
  expected_output="expected_out"
fi

actual_output=".actual_out"

rm -f ${actual_output}

IFS=$'\n'
lines=$(cat $input_file)
for line in ${lines[*]}; do
  IFS="|"
  echo "-------------------------------"
  echo "Running test with input ${line}"
  output=$(node $script ${line[*]})
  echo $output | tee -a ${actual_output} 
done
echo "-------------------------------"

RED='\033[0;31m'
NC='\033[0m'

diff_tool="colordiff"
if [ -z $(command -v ${diff_tool}) ]; then
  diff_tool="diff"
fi

difference=$(${diff_tool} -y -W40 ${actual_output} ${expected_output})
if [ $? -ne 0 ]; then
  echo -e "${RED}Tests failed!${NC}"
  echo ${difference}
  exit 1
else
  echo "Tests passed!"
fi
