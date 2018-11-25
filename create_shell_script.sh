#! /bin/bash

file=$1;
echo "#! /bin/bash" >> $file
chmod +x $file
vim $file
