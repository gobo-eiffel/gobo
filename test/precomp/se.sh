#!/local/bin/bash

# system:     "Gobo Eiffel Libraries precompilation"
# compiler:   "SmallEiffel -0.78"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 1999, Eric Bezault and others"
# date:       "$Date$"
# revision:   "$Revision$"


#		-- Gobo Eiffel Lexical Library
echo ${GOBO}/library/lexical/automaton/>			loadpath.se
echo ${GOBO}/library/lexical/error/>>				loadpath.se
echo ${GOBO}/library/lexical/lex/>>					loadpath.se
echo ${GOBO}/library/lexical/generation/>>			loadpath.se
echo ${GOBO}/library/lexical/regexp/>>				loadpath.se
echo ${GOBO}/library/lexical/scanner/>>				loadpath.se
echo ${GOBO}/library/lexical/skeleton/>>			loadpath.se
echo ${GOBO}/library/lexical/support/>>				loadpath.se

#		-- Gobo Eiffel Parse Library
echo ${GOBO}/library/parse/error/>>					loadpath.se
echo ${GOBO}/library/parse/fsm/>>					loadpath.se
echo ${GOBO}/library/parse/generation/>>			loadpath.se
echo ${GOBO}/library/parse/grammar/>>				loadpath.se
echo ${GOBO}/library/parse/parser/>>				loadpath.se
echo ${GOBO}/library/parse/skeleton/>>				loadpath.se
echo ${GOBO}/library/parse/support/>>				loadpath.se
echo ${GOBO}/library/parse/yacc/>>					loadpath.se

#		-- Gobo Eiffel Utility Library
echo ${GOBO}/library/utility/command/>>				loadpath.se
echo ${GOBO}/library/utility/error/>>				loadpath.se
echo ${GOBO}/library/utility/formatter/>>			loadpath.se
echo ${GOBO}/library/utility/support/>>				loadpath.se

#		-- Gobo Eiffel Kernel Library
echo ${GOBO}/library/kernel/>>						loadpath.se
echo ${GOBO}/library/kernel/spec/se/>>				loadpath.se

#		-- Gobo Eiffel Structure Library
echo ${GOBO}/library/structure/base/>>				loadpath.se
echo ${GOBO}/library/structure/container/>>			loadpath.se
echo ${GOBO}/library/structure/cursor/>>			loadpath.se
echo ${GOBO}/library/structure/dispenser/>>			loadpath.se
echo ${GOBO}/library/structure/list/>>				loadpath.se
echo ${GOBO}/library/structure/sort/>>				loadpath.se
echo ${GOBO}/library/structure/support/>>			loadpath.se
echo ${GOBO}/library/structure/table/>>				loadpath.se

#		-- SmallEiffel Kernel
# echo ${SmallEiffelDir}/lib_std/>>					loadpath.se


export geoptions="-no_style_warning"
export geformat="-html2"

find ${GOBO}/library -name *.e -exec short $geformat $geoptions {} \; > precomp.html
