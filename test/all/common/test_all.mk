# system:     "Makefile to run all tests, examples and tools"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 2000-2001, Eric Bezault and others"
# license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:       "$Date$"
# revision:   "$Revision$"


GOBO_LIBS= structure time
GOBO_SRCS= gelex geyacc getest gepp
GOBO_LEXICAL_EXAMPLES= ascii2ps eiffel_scanner gegrep
GOBO_PARSE_EXAMPLES= eiffel_parser calc mcalc rpcalc
GOBO_TIME_EXAMPLES= clock
GOBO_EXAMPLES= ${GOBO_LEXICAL_EXAMPLES} ${GOBO_PARSE_EXAMPLES} ${GOBO_TIME_EXAMPLES}
GOBO_TEST_EXAMPLES= concat1 concat2

all:
	@${MAKE} -s test-all 'DEBUG=' 2> tmp_make.txt

all-debug:
	@${MAKE} -s test-all 'DEBUG=-debug' 2> tmp_make.txt

test-all:
	${MAKE} ${GOBO_LIBS}
	${MAKE} ${GOBO_SRCS}
	${MAKE} ${GOBO_LEXICAL_EXAMPLES} 'EXAMPLE_DIR=lexical'
	${MAKE} ${GOBO_PARSE_EXAMPLES} 'EXAMPLE_DIR=parse'
	${MAKE} ${GOBO_TIME_EXAMPLES} 'EXAMPLE_DIR=time'
	${MAKE} ${GOBO_TEST_EXAMPLES} 'EXAMPLE_DIR=test'

${GOBO_LIBS}:
	${ECHO} ''
	${ECHO} 'Testing Gobo Eiffel $@ Library...'
	${MKDIR} $@
	${CP} -f ${GOBO}/test/$@/Makefile $@
	cd $@ ; ${MAKE} test-${COMPILER}${DEBUG}

${GOBO_SRCS}:
	${ECHO} ''
	${ECHO} 'Testing $@...'
	${ECHO} 'Preparing Test Cases'
	${MKDIR} $@
	${CP} -f ${GOBO}/src/$@/Makefile $@
	${ECHO} 'Compiling Test Cases'
	cd $@ ; ${MAKE} ${COMPILER}${DEBUG} > tmp_compile.txt 2>&1
	cd $@ ; ${GOBO}/test/all/common/test_harness.sh --version ${COMPILER} $@

${GOBO_EXAMPLES}:
	${ECHO} ''
	${ECHO} 'Testing Example ${EXAMPLE_DIR}/$@...'
	${ECHO} 'Preparing Test Cases'
	${MKDIR} $@-${EXAMPLE_DIR}
	${CP} -f ${GOBO}/example/${EXAMPLE_DIR}/$@/Makefile $@-${EXAMPLE_DIR}
	${ECHO} 'Compiling Test Cases'
	cd $@-${EXAMPLE_DIR} ; ${MAKE} ${COMPILER}${DEBUG} > tmp_compile.txt 2>&1
	cd $@-${EXAMPLE_DIR} ; ${GOBO}/test/all/common/test_harness.sh ${COMPILER} $@

${GOBO_TEST_EXAMPLES}:
	${ECHO} ''
	${ECHO} 'Testing Example ${EXAMPLE_DIR}/$@...'
	${ECHO} 'Preparing Test Cases'
	${MKDIR} $@-${EXAMPLE_DIR}
	${CP} -f ${GOBO}/example/${EXAMPLE_DIR}/$@/Makefile $@-${EXAMPLE_DIR}
	cd $@-${EXAMPLE_DIR} ; ${GOBO}/test/all/common/test_harness.sh --getest ${COMPILER} $@
