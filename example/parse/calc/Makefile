# system:     "Infix Notation Calculator"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 2000, Eric Bezault and others"
# license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:       "$Date$"
# revision:   "$Revision$"


TARGET=calc
ROOT_CLASS=CALC
CREATION_ROUTINE=execute
ROOT_DIR=$(GOBO)/example/parse/calc

include $(GOBO)/misc/platform.make
include $(GOBO)/misc/eiffel.make

parser: calc.e

calc.e: calc.y
	$(GEYACC) --version
	$(GEYACC) -o calc.e calc.y
