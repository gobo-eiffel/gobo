# system:     "'ascii2ps' pretty-printer"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 2000, Eric Bezault and others"
# license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:       "$Date$"
# revision:   "$Revision$"


TARGET=ascii2ps
ROOT_CLASS=ASCII2PS
CREATION_ROUTINE=make
ROOT_DIR=$(GOBO)/example/lexical/ascii2ps

include $(GOBO)/misc/platform.make
include $(GOBO)/misc/eiffel.make

scanner: ascii2ps.e

ascii2ps.e: ascii2ps.l
	$(GELEX) --version
	$(GELEX) ascii2ps.l
