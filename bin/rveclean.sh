#!/local/bin/sh

# Delete Visual Eiffel cluster information in current
# directory and recursively in its subdirectories.

find . -exec test -d {} \; -not -iname "cvs" -exec test -d {}/ecluster \; -print -exec veclean.sh {} \;
