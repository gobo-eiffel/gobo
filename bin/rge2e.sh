#!/local/bin/bash

# usage: rge2e.sh compiler_name dirname

# Preprocess all '*.ge' files in directory 'dirname' and
# its subdirectories using -Dcompiler_name. Write output
# to corresponding '.e' file.

cd $2
find . -name "*.ge" -print -exec ge2e.sh "$1" {} \;
