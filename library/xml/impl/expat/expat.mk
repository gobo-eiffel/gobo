# description: "SE options for expat"
# author:      "Andreas Leitner <nozone@sbox.tugraz.at>"
# copyright:   "Copyright (c) 2001, Andreas Leitner and others"
# license:     "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:        "$Date$"
# revision:    "$Revision$"


# general defines
EXML_EXPAT_SPEC_PATH=${GOBO}/library/xml/impl/expat/spec

# se defines
SE_CECIL+=-cecil ${EXML_EXPAT_SPEC_PATH}/se/cecil.se
SE_CLIBS+=-lexml-expat-SE -lexpat
SE_CFLAGS+=-L${EXML_EXPAT_SPEC_PATH}/c



