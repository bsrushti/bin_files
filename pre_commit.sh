#! /bin/bash
touch .git/hooks/pre-commit 
chmod +x .git/hooks/pre-commit
echo "#! /bin/bash" > .git/hooks/pre-commit
echo " mocha --reporter min " >> .git/hooks/pre-commit 

