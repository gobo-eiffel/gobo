# description: "Generate parser and scanner files"
# author:      "Eric Bezault <ericb@gobosoft.com>"
# copyright:   "Copyright (c) 2001, Eric Bezault and others"
# license:     "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:        "$Date$"
# revision:    "$Revision$"


include ${GOBO}/misc/platform.mk

all: parser scanner

parser: ts_config_parser.e

scanner: ts_config_scanner.e

ts_config_parser.e: ts_config_parser.y
	${GEYACC} --version
	${GEYACC} -t TS_CONFIG_TOKENS -o ts_config_parser.e ts_config_parser.y

ts_config_scanner.e: ts_config_scanner.l
	${GELEX} --version
	${GELEX} ts_config_scanner.l
