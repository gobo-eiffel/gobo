#!/local/bin/bash

# system:     "List tester"
# library:    "Gobo Eiffel Structure Library"
# compiler:   "SmallEiffel -0.78"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 1999, Eric Bezault and others"
# license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:       "$Date$"
# revision:   "$Revision$"


echo ${GOBO}/test/structure/test1/>				loadpath.se
echo ${GOBO}/library/kernel/loadpath.se>>		loadpath.se
echo ${GOBO}/library/structure/loadpath.se>>	loadpath.se
echo ${GOBO}/library/utility/loadpath.se>>		loadpath.se

export geoptions="-boost -no_split -no_style_warning -no_gc"
compile $geoptions DS_TESTER make_and_test
