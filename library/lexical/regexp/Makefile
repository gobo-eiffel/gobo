# description: "Generate parser and scanner files"
# author:      "Eric Bezault <ericb@gobosoft.com>"
# copyright:   "Copyright (c) 2000, Eric Bezault and others"
# license:     "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:        "$Date$"
# revision:    "$Revision$"


include ${GOBO}/misc/platform.mk

all: parser scanner

parser: lx_regexp_parser.e
scanner: lx_regexp_scanner.e

lx_regexp_parser.e: lx_regexp_parser.y
	${GEYACC} --version
	${GEYACC} -t LX_REGEXP_TOKENS -o lx_regexp_parser.e lx_regexp_parser.y

lx_regexp_scanner.e: lx_regexp_scanner.l
	${GELEX} --version
	${GELEX} lx_regexp_scanner.l
