# system:     "Makefile to run all tests, examples and tools"
# compiler:   "Halstenbach ISS-BASE"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 2000, Eric Bezault and others"
# license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:       "$Date$"
# revision:   "$Revision$"


ECOMPILER=hact

include ${GOBO}/misc/platform.mk
include ${GOBO}/test/all/common/test_all.mk

calculator:
	@${MAKE} -s test-calculator 'DEBUG='

calculator-debug:
	@${MAKE} -s test-calculator 'DEBUG=-debug'

test-calculator:
	${ECHO} ''
	${ECHO} 'Testing Example lexical/calculator...'
	${ECHO} 'Preparing Test Cases'
	${MKDIR} calculator-lexical
	${CP} -f ${GOBO}/example/lexical/calculator/Makefile calculator-lexical
	${ECHO} 'Compiling Test Cases'
	cd calculator-lexical ; ${MAKE} ${ECOMPILER}${DEBUG} > tmp_compile.txt 2>&1
	cd calculator-lexical ; ${GOBO}/test/all/common/test_exe.sh ${ECOMPILER} calculator
