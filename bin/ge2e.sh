#!/local/bin/bash

# usage: rge2e.sh compiler_name filename.ge

# Preprocess 'filename.ge' using -Dcompiler_name.
# Write output to corresponding 'filename.e' file.

DIRNAME=`dirname $2`
BASENAME=`basename $2 .ge`

# FILENAME=${DIRNAME}/${BASENAME}.e
FILENAME=${GOBO}/spec/$1/${BASENAME}.e

touch $FILENAME
ge2e.exe -D"$1" $2 $FILENAME
