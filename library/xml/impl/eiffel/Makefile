# description: "Generate eiffel spec classes"
# author:      "Andreas Leitner <nozone@sbox.tugraz.at>"
# copyright:   "Copyright (c) 2001, Andreas Leitner and others"
# license:     "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:        "$Date$"
# revision:    "$Revision$"

include ${GOBO}/misc/platform.mk

EIF_CDIR= ${GOBO}/library/xml/impl/eiffel/event
EIF_GEN_SRC= ${EIF_CDIR}/xf_parser.e ${EIF_CDIR}/xf_tokens.e ${EIF_CDIR}/xf_scanner.e

help: 
	@${ECHO} "make [all | clean]"

all: ${EIF_GEN_SRC}

clean:
	-rm ${EIF_GEN_SRC}

%_scanner.e: %_scanner.l
	cd ${EIF_CDIR} ; gelex -o $@ $<

%_tokens.e %_parser.e: %_parser.y
	cd ${EIF_CDIR}; geyacc -t $(subst _parser.y,_tokens, $(notdir $<)) -o $(subst .y,.e, $(notdir $<)) $<

