# system:     "Eiffel scanner"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 2000, Eric Bezault and others"
# license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:       "$Date$"
# revision:   "$Revision$"


TARGET=eiffel_scanner
ROOT_CLASS=EIFFEL_SCANNER
CREATION_ROUTINE=benchmark
ROOT_DIR=$(GOBO)/example/lexical/eiffel

include $(GOBO)/misc/platform.make
include $(GOBO)/misc/eiffel.make

scanner: eiffel_scanner.e

eiffel_scanner.e: eiffel_scanner.l
	$(GELEX) --version
	$(GELEX) eiffel_scanner.l
