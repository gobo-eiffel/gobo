#!/local/bin/bash

# system:     "Eiffel parser"
# compiler:   "SmallEiffel -0.78"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 1999, Eric Bezault and others"
# license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:       "$Date$"
# revision:   "$Revision$"


echo ${GOBO}/example/parse/eiffel/>			loadpath.se
echo ${GOBO}/library/parse/skeleton/>>		loadpath.se
echo ${GOBO}/library/lexical/skeleton/>>	loadpath.se
echo ${GOBO}/library/utility/loadpath.se>>	loadpath.se
echo ${GOBO}/library/kernel/loadpath.se>>	loadpath.se

export geoptions="-boost -no_split -no_style_warning -no_gc"
compile $geoptions EIFFEL_PARSER benchmark
