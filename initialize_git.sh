#! /bin/bash

git init
echo "*.sw.*" > .gitignore
pre_commit.sh #make pre-commit file
