# system:     "'gepp' preprocessor"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 2000, Eric Bezault and others"
# license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:       "$Date$"
# revision:   "$Revision$"


TARGET=gepp
ROOT_CLASS=GEPP
CREATION_ROUTINE=execute
ROOT_DIR=$(GOBO)/src/gepp

include $(GOBO)/misc/platform.make
include $(GOBO)/misc/eiffel.make

parser: gepp_parser.e
scanner: gepp_scanner.e

gepp_parser.e: gepp_parser.y
	$(GEYACC) --version
	$(GEYACC) -t GEPP_TOKENS -o gepp_parser.e gepp_parser.y

gepp_scanner.e: gepp_scanner.l
	$(GELEX) --version
	$(GELEX) gepp_scanner.l
