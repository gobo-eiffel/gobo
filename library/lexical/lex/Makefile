# description: "Generate parser and scanner files"
# author:      "Eric Bezault <ericb@gobosoft.com>"
# copyright:   "Copyright (c) 2000, Eric Bezault and others"
# license:     "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:        "$Date$"
# revision:    "$Revision$"


include ${GOBO}/misc/platform.mk

all: parser scanner

parser: lx_lex_parser.e
scanner: lx_lex_scanner.e

lx_lex_parser.e: lx_lex_parser.y
	${GEYACC} --version
	${GEYACC} -t LX_LEX_TOKENS -o lx_lex_parser.e lx_lex_parser.y

lx_lex_scanner.e: lx_lex_scanner.l
	${GELEX} --version
	${GELEX} lx_lex_scanner.l
