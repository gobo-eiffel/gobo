# system:     "Generate Eiffel files from .ge files"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 2000, Eric Bezault and others"
# license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:       "$Date$"
# revision:   "$Revision$"


all: spec

.FORCE:  # Used to force rebuild.

depend: .FORCE
	${GOBO}/bin/ge2dep.sh > Makefile.dep

Makefile.dep:
	${GOBO}/bin/ge2dep.sh > Makefile.dep

include Makefile.dep
