# system:     "Eiffel parser"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 2000, Eric Bezault and others"
# license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:       "$Date$"
# revision:   "$Revision$"


TARGET=eiffel_parser
ROOT_CLASS=EIFFEL_PARSER
CREATION_ROUTINE=benchmark
ROOT_DIR=$(GOBO)/example/parse/eiffel

include $(GOBO)/misc/platform.make
include $(GOBO)/misc/eiffel.make

parser: eiffel_parser.e
scanner: eiffel_scanner.e

eiffel_parser.e: eiffel_parser.y
	$(GEYACC) --version
	$(GEYACC) -t EIFFEL_TOKENS -o eiffel_parser.e eiffel_parser.y

eiffel_scanner.e: eiffel_scanner.l
	$(GELEX) --version
	$(GELEX) eiffel_scanner.l
