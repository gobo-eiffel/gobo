# system:     "Infix Notation Calculator"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 2000, Eric Bezault and others"
# license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:       "$Date$"
# revision:   "$Revision$"


TARGET=calculator
ROOT_CLASS=CALC_SCANNER
CREATION_ROUTINE=make
ROOT_DIR=${GOBO}/example/lexical/calculator

include ${GOBO}/misc/platform.mk
include ${GOBO}/misc/eiffel.mk

scanner: calc_scanner.e
parser: calc_parser.e

calc_scanner.e: calc_scanner.l
	${GELEX} --version
	${GELEX} calc_scanner.l

calc_parser.e: calc_parser.y
	ibyacc -o calc_parser.e calc_parser.y

${ROOT_DIR}/ise.tpl:
	${ECHO} '' > ${ROOT_DIR}/ise.tpl
