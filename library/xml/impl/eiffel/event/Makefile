# description: "Generate parser and scanner files"
# author:      "Eric Bezault <ericb@gobosoft.com>"
# copyright:   "Copyright (c) 2001, Eric Bezault and others"
# license:     "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:        "$Date$"
# revision:    "$Revision$"


include ${GOBO}/misc/platform.mk

all: parser scanner

parser: xf_parser.e
scanner: xf_scanner.e

xf_parser.e: xf_parser.y
	${GEYACC} --version
	${GEYACC} -t XF_TOKENS -o xf_parser.e xf_parser.y

xf_scanner.e: xf_scanner.l
	${GELEX} --version
	${GELEX} xf_scanner.l
