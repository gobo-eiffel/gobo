#!/bin/sh

# system:     "Gobo Eiffel Libraries precompilation"
# compiler:   "SmallEiffel"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
# license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:       "$Date$"
# revision:   "$Revision$"

export geoptions="-no_style_warning"
export geformat="-html2"

GOBO=`echo $GOBO | sed "s/\\\\\\/\//g"`
export GOBO

find ${GOBO}/library \
	-path ${GOBO}/library/kernel/spec -prune \
	-path ${GOBO}/library/time/spec -prune \
	-path ${GOBO}/library/utility/spec -prune \
	-o -name *.e -exec short $geformat $geoptions {} \; > precomp.html
find ${GOBO}/library/kernel/spec/se \
	-name *.e -exec short $geformat $geoptions {} \; >> precomp.html
find ${GOBO}/library/time/spec/se \
	-name *.e -exec short $geformat $geoptions {} \; >> precomp.html
find ${GOBO}/library/utility/spec/se \
	-name *.e -exec short $geformat $geoptions {} \; >> precomp.html
