#!/local/bin/bash

# system:     "Gobo Eiffel Libraries precompilation"
# compiler:   "SmallEiffel -0.78"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 1999, Eric Bezault and others"
# license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:       "$Date$"
# revision:   "$Revision$"

echo ${GOBO}/library/loadpath.se>		loadpath.se
echo ${GOBO}/library/structure/base/>>	loadpath.se

export geoptions="-no_style_warning"
export geformat="-html2"

GOBO_UNIX=`echo $GOBO | sed "s/\\\\\\/\//g"`
export GOBO_UNIX
find ${GOBO_UNIX}/library -path ${GOBO_UNIX}/library/kernel/spec -prune \
	-o -name *.e -exec short $geformat $geoptions {} \; > precomp.html
find ${GOBO_UNIX}/library/kernel/spec/se \
	-name *.e -exec short $geformat $geoptions {} \; >> precomp.html
