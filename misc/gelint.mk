# system:     "Makefile template for gelint test suite"
# author:     "Eric Bezault <ericb@gobosoft.com>"
# copyright:  "Copyright (c) 2001, Eric Bezault and others"
# license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
# date:       "$Date$"
# revision:   "$Revision$"


# SmallEiffel
SE_COMPILER=compile
SE_CLEAN=clean
SE_CFLAGS=-all_check -no_split -no_style_warning -no_gc ${SE_PCFLAGS}

# ISE Eiffel
ISE_COMPILER=es4
ISE_FINISH_FREEZING=finish_freezing
ISE_CFLAGS=-batch
ISE_CODEGEN=W_code
ISE_FFLAGS=${ISE_PFFLAGS}

# Halstenbach
HACT_COMPILER=ibcomp
HACT_FISH=fish
HACT_CFLAGS=-executable -new -stop
HACT_CODEGEN=W_code
HACT_FFLAGS=

# Visual Eiffel
VE_COMPILER=vec
VE_CFLAGS=-no

# Miscellaneous
TARGET_EXE=${TARGET}${EXE}


all: help

help:
	@${ECHO} 'make [ se | ise | hact | ve | gelint ]'

TARGET=aa
ROOT_CLASS=AA
CREATION_ROUTINE=make

# SmallEiffel

se:
	${MAKE} test-se
	${MAKE} clean-se

test-se: loadpath.se
	if ${SE_COMPILER} ${SE_CFLAGS} -o ${TARGET} ${ROOT_CLASS} ${CREATION_ROUTINE} > tmp11.txt 2>&1 ; then \
		true; \
	fi
	if [ -x ./${TARGET} ]; then \
		if ./${TARGET} >> tmp11.txt 2>&1 ; then \
			true; \
		fi ; \
	fi
	${GREP} -v "Error(s) during \`compile_to_c'." tmp11.txt | \
		${SED} -e 's/(.*\([a-zA-Z0-9_]\+\.e\))/(\1)/g' > output.txt
	${ECHO} -n '${ROOT_DIR}: '
	if ${DIFF} output.txt ${ROOT_DIR}/output.se > /dev/null 2>&1 ; then \
		${ECHO} 'OK' ; \
	else \
		${ECHO} "*** FAILED ***" ; \
	fi

loadpath.se: ${ROOT_DIR}/loadpath.se
	${CP} ${ROOT_DIR}/loadpath.se loadpath.se

clean-se:
	${SE_CLEAN} ${ROOT_CLASS}
	-${RM} -f tmp11.txt output.txt
	-${RM} -f ${TARGET_EXE}


#ISE Eiffel

ise:
	${MAKE} test-ise
	${MAKE} clean-ise

test-ise: ise.ace
	if ${ISE_COMPILER} ${ISE_CFLAGS} -ace ise.ace > tmp11.txt 2>&1 ; then \
		true; \
	fi
	$(MAKE) ise_finish_freezing 'MAKEFLAGS=' > /dev/null 2>&1
	cd EIFGEN/${ISE_CODEGEN} ; \
		if [ -x ./${TARGET} ]; then \
			if ./${TARGET} >> ../../tmp11.txt 2>&1 ; then \
				true; \
			fi ; \
		fi
	${GREP} -v "(version" tmp11.txt | ${GREP} -v "] Degree " > output.txt
	${ECHO} -n '${ROOT_DIR}: '
	if ${DIFF} output.txt ${ROOT_DIR}/output.ise > /dev/null 2>&1 ; then \
		${ECHO} 'OK' ; \
	else \
		${ECHO} "*** FAILED ***" ; \
	fi

# Problem with ${MAKEFLAGS} when compiling under
# Windows: 'nmake' (called by 'finish_freezing')
# does not recognize option --unix.
ise_finish_freezing:
	cd EIFGEN/${ISE_CODEGEN} ; \
		if [ -r Makefile.SH ]; then \
			${ISE_FINISH_FREEZING} ${ISE_FFLAGS} ; \
		fi

ise.ace: ${ROOT_DIR}/ise.ace
	${CP} ${ROOT_DIR}/ise.ace ise.ace

clean-ise:
	-${RM} -rf EIFGEN
	-${RM} -f ${TARGET}.eif ${TARGET}.epr
	-${RM} -f tmp11.txt output.txt


# Halstenbach

hact:
	${MAKE} test-hact
	${MAKE} clean-hact

test-hact: hact.ace
	if ${HACT_COMPILER} ${HACT_CFLAGS} -ace hact.ace -project ${TARGET}.eif ; then \
		true; \
	fi
	${MAKE} hact_fish 'MAKEFLAGS=' > /dev/null 2>&1
	cd ${TARGET}_gen/${HACT_CODEGEN} ; \
		if [ -x ./${TARGET} ]; then \
			if ./${TARGET} >> ../../tmp11.txt 2>&1 ; then \
				true; \
			fi ; \
		fi
	${GREP} -v "(version" tmp11.txt | ${GREP} -v "] Degree " > output.txt
	${ECHO} -n '${ROOT_DIR}: '
	if ${DIFF} output.txt ${ROOT_DIR}/output.hact > /dev/null 2>&1 ; then \
		${ECHO} 'OK' ; \
	else \
		${ECHO} "*** FAILED ***" ; \
	fi

# Problem with ${MAKEFLAGS} when compiling under
# Windows: 'nmake' (called by 'fish') does not
# recognize option --unix.
hact_fish:
	cd ${TARGET}_gen/${HACT_CODEGEN} ; \
		if [ -r Makefile.SH ]; then \
			${HACT_FISH} ${HACT_FFLAGS} ; \
		fi

hact.ace: ${ROOT_DIR}/hact.ace
	${CP} ${ROOT_DIR}/hact.ace hact.ace

clean-hact:
	-${RM} -rf ${TARGET}_gen
	-${RM} -f ${TARGET}.eif
	-${RM} -f tmp11.txt output.txt


# Visual Eiffel

ve:
	${MAKE} test-ve
	${MAKE} clean-ve

test-ve: ve.esd
	if ${VE_COMPILER} ${VE_CFLAGS} -a:ve.esd ; then \
		true; \
	fi
	if [ -x ./${TARGET} ]; then \
		if ./${TARGET} >> tmp11.txt 2>&1 ; then \
			true; \
		fi ; \
	fi
	cat tmp11.txt > output.txt
	${ECHO} -n '${ROOT_DIR}: '
	if ${DIFF} output.txt ${ROOT_DIR}/output.ve > /dev/null 2>&1 ; then \
		${ECHO} 'OK' ; \
	else \
		${ECHO} "*** FAILED ***" ; \
	fi

ve.esd: ${ROOT_DIR}/ve.esd
	${CP} ${ROOT_DIR}/ve.esd ve.esd

clean-ve:
	${VE_COMPILER} -eu -y -no
	-${RM} -f tmp11.txt output.txt
	-${RM} -f ${TARGET_EXE}
