# system:     "Windows-dependent Makefile template"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 2000, Eric Bezault and others"
# license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:       "$Date$"
# revision:   "$Revision$"


# Shell Commands
CP=cp
RM=rm
ECHO=echo
GEPP=$(GOBO)/bin/gepp
GELEX=$(GOBO)/bin/gelex
GEYACC=$(GOBO)/bin/geyacc

# SmallEiffel
SE_PCFLAGS=-w

# ISE Eiffel
ISE_PFFLAGS=-silent

# Filenames
EXE=.exe
