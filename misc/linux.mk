# system:     "Linux-dependent Makefile template"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 2000, Eric Bezault and others"
# license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:       "$Date$"
# revision:   "$Revision$"


# Shell Commands
SHELL=/bin/sh
MAKE=make
CP=cp
RM=rm
MKDIR=mkdir
ECHO=echo
SED=sed
GREP=grep
DIFF=diff
GEPP=${GOBO}/bin/gepp
GELEX=${GOBO}/bin/gelex
GEYACC=${GOBO}/bin/geyacc
GETEST=${GOBO}/bin/getest

# Filenames
EXE=

# SmallEiffel
SE_PCFLAGS=

# ISE Eiffel
ISE_PFFLAGS=
