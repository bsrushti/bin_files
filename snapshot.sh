#! /bin/bash

directory=$1
username=$(whoami)
path="~/Desktop"
tar cvfz ${username}.tar.gz ${directory}
