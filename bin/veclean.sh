#!/local/bin/bash

# usage: veclean dirname

# Delete Visual Eiffel cluster information in 
# directory given as argument.

cd $1
vec /dc /y
