# description: "Generate expat C dependencies"
# author:      "Andreas Leitner <nozone@sbox.tugraz.at>"
# copyright:   "Copyright (c) 2001, Andreas Leitner and others"
# license:     "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:        "$Date$"
# revision:    "$Revision$"


include ${GOBO}/misc/platform.mk

EXML_EXPAT_SPEC_PATH=${GOBO}/library/xml/impl/expat/spec
OUT_FILE=${LIBEXML_PATH}/libexml-expat-${VENDOR}{LIB}


help: 
	@${ECHO} "make [all | depend | lib-se | lib-ise | lib-ve | lib-hact | clean-all | clean-se | clean-ise | clean-ve | clean-hact]"

all: depend spec lib-se lib-ise lib-ve lib-hact

lib-se: ${EXML_EXPAT_SPEC_PATH}/c/*.[ch]
	cd ${EXML_EXPAT_SPEC_PATH}/c; ${MAKE} lib-se

lib-ise: ${EXML_EXPAT_SPEC_PATH}/c/*.[ch]
	cd ${EXML_EXPAT_SPEC_PATH}/c; ${MAKE} lib-ise

lib-ve: ${EXML_EXPAT_SPEC_PATH}/c/*.[ch]
	cd ${EXML_EXPAT_SPEC_PATH}/c; ${MAKE} lib-ve

lib-hact: ${EXML_EXPAT_SPEC_PATH}/c/*.[ch]
	cd ${EXML_EXPAT_SPEC_PATH}/c; ${MAKE} lib-hact

clean-se:
	cd ${EXML_EXPAT_SPEC_PATH}/c; ${MAKE} clean-se

clean-ise:
	cd ${EXML_EXPAT_SPEC_PATH}/c; ${MAKE} clean-ise

clean-ve:
	cd ${EXML_EXPAT_SPEC_PATH}/c; ${MAKE} clean-ve

clean-hact:
	cd ${EXML_EXPAT_SPEC_PATH}/c; ${MAKE} clean-hact

clean-all: clean-ise clean-se clean-ve clean-hact

.FORCE:

depend: .FORCE
	${GOBO}/bin/ge2dep.sh > Makefile.dep

Makefile.dep:
	${GOBO}/bin/ge2dep.sh > Makefile.dep

include Makefile.dep


