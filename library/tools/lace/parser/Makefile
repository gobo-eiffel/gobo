# description: "Generate parser and scanner files"
# author:      "Eric Bezault <ericb@gobosoft.com>"
# copyright:   "Copyright (c) 2000, Eric Bezault and others"
# license:     "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:        "$Date$"
# revision:    "$Revision$"


include ${GOBO}/misc/platform.mk

all: parser scanner

parser: et_lace_parser.e

scanner: et_lace_scanner.e

et_lace_parser.e: et_lace_parser.y
	${GEYACC} --version
	${GEYACC} -t ET_LACE_TOKENS -o et_lace_parser.e et_lace_parser.y

et_lace_scanner.e: et_lace_scanner.l
	${GELEX} --version
	${GELEX} et_lace_scanner.l
