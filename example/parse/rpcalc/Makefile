# system:     "Reverse Polish Notation Calculator"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 2000, Eric Bezault and others"
# license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:       "$Date$"
# revision:   "$Revision$"


TARGET=rpcalc
ROOT_CLASS=RPCALC
CREATION_ROUTINE=execute
ROOT_DIR=$(GOBO)/example/parse/rpcalc

include $(GOBO)/misc/platform.make
include $(GOBO)/misc/eiffel.make

parser: rpcalc.e

rpcalc.e: rpcalc.y
	$(GEYACC) --version
	$(GEYACC) -o rpcalc.e rpcalc.y
