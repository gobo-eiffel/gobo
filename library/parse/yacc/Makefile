# description: "Generate parser and scanner files"
# author:      "Eric Bezault <ericb@gobosoft.com>"
# copyright:   "Copyright (c) 2000, Eric Bezault and others"
# license:     "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:        "$Date$"
# revision:    "$Revision$"


include $(GOBO)/misc/platform.make

all: parser scanner

parser: pr_yacc_parser.e
scanner: pr_yacc_scanner.e

pr_yacc_parser.e: pr_yacc_parser.y
	$(GEYACC) --version
	$(GEYACC) -t PR_YACC_TOKENS -o pr_yacc_parser.e pr_yacc_parser.y

pr_yacc_scanner.e: pr_yacc_scanner.l
	$(GELEX) --version
	$(GELEX) pr_yacc_scanner.l
