#!/bin/sh

# system:     "Gobo Eiffel Libraries precompilation"
# compiler:   "SmallEiffel -0.76"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 1999-2000, Eric Bezault and others"
# license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:       "$Date$"
# revision:   "$Revision$"

echo ${GOBO}/library/loadpath.se>			loadpath.se
echo ${GOBO}/library/other/EiffelBase/>>	loadpath.se
echo ${GOBO}/library/other/EiffelTime/>>	loadpath.se

export geoptions="-no_style_warning"
export geformat="-html2"

GOBO_UNIX=`echo $GOBO | sed "s/\\\\\\/\//g"`
export GOBO_UNIX
find ${GOBO_UNIX}/library \
	-path ${GOBO_UNIX}/library/kernel/spec -prune \
	-path ${GOBO_UNIX}/library/time/spec -prune \
	-path ${GOBO_UNIX}/library/utility/spec -prune \
	-o -name *.e -exec short $geformat $geoptions {} \; > precomp.html
find ${GOBO_UNIX}/library/kernel/spec/se \
	-name *.e -exec short $geformat $geoptions {} \; >> precomp.html
find ${GOBO_UNIX}/library/time/spec/se \
	-name *.e -exec short $geformat $geoptions {} \; >> precomp.html
find ${GOBO_UNIX}/library/utility/spec/se \
	-name *.e -exec short $geformat $geoptions {} \; >> precomp.html
