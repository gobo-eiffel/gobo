# description: "Generate parser and scanner files"
# author:      "Eric Bezault <ericb@gobosoft.com>"
# copyright:   "Copyright (c) 2000, Eric Bezault and others"
# license:     "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:        "$Date$"
# revision:    "$Revision$"


include ${GOBO}/misc/platform.mk

all: parser scanner

parser: et_eiffel_parser.e

scanner: et_eiffel_scanner.e

et_eiffel_parser.e: et_eiffel_parser.y
	${GEYACC} --version
	${GEYACC} -t ET_EIFFEL_TOKENS -o et_eiffel_parser.e et_eiffel_parser.y

et_eiffel_scanner.e: et_eiffel_scanner.l
	${GELEX} --version
	${GELEX} et_eiffel_scanner.l
