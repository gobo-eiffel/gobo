#!/local/bin/bash

# system:     "Gobo Eiffel Libraries precompilation"
# compiler:   "SmallEiffel -0.77b3"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 1999, Eric Bezault and others"
# date:       "$Date$"
# revision:   "$Revision$"

echo ${GOBO}/library/loadpath.se>		loadpath.se
echo ${GOBO}/library/structure/base/>>	loadpath.se

export geoptions="-no_style_warning"
export geformat="-html2"

find ${GOBO}/library -name *.e -exec short $geformat $geoptions {} \; > precomp.html
