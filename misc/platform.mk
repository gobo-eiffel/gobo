# system:     "Platform-dependent Makefile template"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 2000, Eric Bezault and others"
# license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:       "$Date$"
# revision:   "$Revision$"


#GOBO_PLATFORM=linux
GOBO_PLATFORM=windows

include ${GOBO}/misc/${GOBO_PLATFORM}.mk
