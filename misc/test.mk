# system:     ""
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 2000, Eric Bezault and others"
# license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:       "$Date$"
# revision:   "$Revision$"


test-se:
	${MAKE} test-${TARGET} 'COMPILER=se'

test-se-debug:
	${MAKE} test-${TARGET} 'COMPILER=se-debug'

test-ise:
	${MAKE} test-${TARGET} 'COMPILER=ise'

test-ise-debug:
	${MAKE} test-${TARGET} 'COMPILER=ise-debug'

test-hact:
	${MAKE} test-${TARGET} 'COMPILER=hact'

test-hact-debug:
	${MAKE} test-${TARGET} 'COMPILER=hact-debug'

test-ve:
	${MAKE} test-${TARGET} 'COMPILER=ve'

test-ve-debug:
	${MAKE} test-${TARGET} 'COMPILER=ve-debug'

test-${TARGET}: getest.${COMPILER}
	${MKDIR} TESTGEN
	${GETEST} getest.${COMPILER}

getest.se: ${ROOT_DIR}/getest.se
	${SED} 's/se-debug/se/g' ${ROOT_DIR}/getest.se > getest.se

getest.se-debug: ${ROOT_DIR}/getest.se
	${CP} ${ROOT_DIR}/getest.se getest.se-debug

getest.ise: ${ROOT_DIR}/getest.ise
	${SED} 's/ise-debug/ise/g' ${ROOT_DIR}/getest.ise > getest.ise

getest.ise-debug: ${ROOT_DIR}/getest.ise
	${CP} ${ROOT_DIR}/getest.ise getest.ise-debug

getest.hact: ${ROOT_DIR}/getest.hact
	${SED} 's/hact-debug/hact/g' ${ROOT_DIR}/getest.hact > getest.hact

getest.hact-debug: ${ROOT_DIR}/getest.hact
	${CP} ${ROOT_DIR}/getest.hact getest.hact-debug

getest.ve: ${ROOT_DIR}/getest.ve
	${SED} 's/ve-debug/ve/g' ${ROOT_DIR}/getest.ve > getest.ve

getest.ve-debug: ${ROOT_DIR}/getest.ve
	${CP} ${ROOT_DIR}/getest.ve getest.ve-debug
