#! /usr/bin/awk -f

BEGIN {
  curr_filename=""
}

(curr_filename != FILENAME) {
  curr_filename = FILENAME
  print curr_filename
}

/ *= *function/ {
  pos=match($0,/ [^=]* *=/)
  fn_name=substr($0,pos+1,RLENGTH-2)
  print fn_name
}
