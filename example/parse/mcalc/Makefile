# system:     "Calculator with memory"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 2000, Eric Bezault and others"
# license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:       "$Date$"
# revision:   "$Revision$"


TARGET=mcalc
ROOT_CLASS=MCALC
CREATION_ROUTINE=execute
ROOT_DIR=${GOBO}/example/parse/mcalc

include ${GOBO}/misc/platform.mk
include ${GOBO}/misc/eiffel.mk

parser: mcalc.e

mcalc.e: mcalc.y
	${GEYACC} --version
	${GEYACC} -o mcalc.e mcalc.y
