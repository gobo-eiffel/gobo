# system:     "Generate binary files"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 2000, Eric Bezault and others"
# license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:       "$Date$"
# revision:   "$Revision$"

# Use the chosen Eiffel compiler to compile the
# Gobo binary files in the current directory. The
# list of binary files to be compiled is shown in
# ${TARGETS}. The list of supported Eiffel compiler
# is available in ${COMPILERS}.

# Usage: make <compiler>


include ${GOBO}/misc/platform.mk

TARGETS= gelex geyacc gepp getest
COMPILERS= se ise hact ve
COMPILER=

all: help

help:
	@${ECHO} 'make [ se | ise | hact | ve ]'

.FORCE:  # Used to force rebuild.

${COMPILERS}: .FORCE
	${MKDIR} BINGEN
	-${MAKE} ${TARGETS} COMPILER=$@
	${RM} -rf BINGEN

${TARGETS}: .FORCE
	cd BINGEN ; ${MKDIR} $@
	${CP} -f ${GOBO}/src/$@/Makefile BINGEN/$@
	cd BINGEN/$@ ; ${MAKE} ${COMPILER} BIN_DIR=../..

clean:
	${RM} -rf BINGEN
