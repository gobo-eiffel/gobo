#!/local/bin/bash

# system:     "List tester"
# compiler:   "SmallEiffel -0.78"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 1999, Eric Bezault and others"
# license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:       "$Date$"
# revision:   "$Revision$"


echo ${GOBO}/test/structure/list/>					loadpath.se

#		-- Gobo Eiffel Kernel Library
echo ${GOBO}/library/kernel/>>						loadpath.se
echo ${GOBO}/library/kernel/spec/se/>>				loadpath.se

#		-- Gobo Eiffel Structure Library
echo ${GOBO}/library/structure/container/>>			loadpath.se
echo ${GOBO}/library/structure/cursor/>>			loadpath.se
echo ${GOBO}/library/structure/dispenser/>>			loadpath.se
echo ${GOBO}/library/structure/list/>>				loadpath.se
echo ${GOBO}/library/structure/sort/>>				loadpath.se
echo ${GOBO}/library/structure/support/>>			loadpath.se
echo ${GOBO}/library/structure/table/>>				loadpath.se

#		-- Gobo Eiffel Utility Library
echo ${GOBO}/library/utility/command/>>				loadpath.se
echo ${GOBO}/library/utility/error/>>				loadpath.se
echo ${GOBO}/library/utility/formatter/>>			loadpath.se
echo ${GOBO}/library/utility/support/>>				loadpath.se

#		-- SmallEiffel Kernel
# echo ${SmallEiffelDir}/lib_std/>>					loadpath.se


#export geoptions="-boost -no_split -no_style_warning -no_gc"
export geoptions="-no_split -no_style_warning"
compile $geoptions DS_LIST_TESTER make_and_test
