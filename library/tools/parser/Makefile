# description: "Generate parser and scanner files"
# author:      "Eric Bezault <ericb@gobosoft.com>"
# copyright:   "Copyright (c) 2000, Eric Bezault and others"
# license:     "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:        "$Date$"
# revision:    "$Revision$"


include ${GOBO}/misc/platform.mk

all: parser scanner

parser: lace_parser eiffel_parser
lace_parser: et_lace_parser.e
eiffel_parser: et_eiffel_parser.e

scanner: lace_scanner eiffel_scanner
lace_scanner: et_lace_scanner.e
eiffel_scanner: et_eiffel_scanner.e

et_lace_parser.e: et_lace_parser.y
	${GEYACC} --version
	${GEYACC} -t ET_LACE_TOKENS -o et_lace_parser.e et_lace_parser.y

et_eiffel_parser.e: et_eiffel_parser.y
	${GEYACC} --version
	${GEYACC} -t ET_EIFFEL_TOKENS -o et_eiffel_parser.e et_eiffel_parser.y

et_lace_scanner.e: et_lace_scanner.l
	${GELEX} --version
	${GELEX} et_lace_scanner.l

et_eiffel_scanner.e: et_eiffel_scanner.l
	${GELEX} --version
	${GELEX} et_eiffel_scanner.l
