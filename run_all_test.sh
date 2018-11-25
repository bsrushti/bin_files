set -e
directory="/Users/bsrushti/javascript/arrayAssignment/arrayLibraryTests"
files=$(ls $directory)

for file in $files
do
  node $directory/$file
  echo =====$file passed=====
done
