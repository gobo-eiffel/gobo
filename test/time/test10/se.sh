#!/bin/sh

# system:     "Tester #10"
# library:    "Gobo Eiffel Time Library"
# compiler:   "SmallEiffel -0.77"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 2000, Eric Bezault and others"
# license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:       "$Date$"
# revision:   "$Revision$"


echo ${GOBO}/test/time/test10/>				loadpath.se
echo ${GOBO}/library/kernel/loadpath.se>>	loadpath.se
echo ${GOBO}/library/time/loadpath.se>>		loadpath.se
echo ${GOBO}/library/utility/loadpath.se>>	loadpath.se

export geoptions="-boost -no_split -no_style_warning -no_gc"
compile $geoptions TESTER make_and_test
