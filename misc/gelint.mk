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
ISE_ECOMPILER=es4
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

# gelint
GELINT=${GOBO}/bin/gelint

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
	if [ ! -r failed.se ]; then \
		${MAKE} test-se ; \
		${MAKE} clean-se ; \
	else \
		${ECHO} '${ROOT_DIR}: *** FAILED ***' ; \
	fi

test-se: loadpath.se
	-${SE_COMPILER} ${SE_CFLAGS} -o ${TARGET} ${ROOT_CLASS} ${CREATION_ROUTINE} > tmp11.txt 2>&1
	-if [ -x ./${TARGET} ]; then \
		./${TARGET} >> tmp11.txt 2>&1 ; \
	fi
	-${GREP} -v "Error(s) during \`compile_to_c'." tmp11.txt | \
		${SED} -e 's/(.*\([a-zA-Z0-9_]\+\.e\))/(\1)/g' | \
		${SED} -e '/^Loading path is:/,/^\]/ d' | \
		${SED} -e '/^Environment Variable \"SmallEiffel\" is:/,/\.$$/ d' | \
		${GREP} -v "^${TARGET}.c" > output.txt
	${ECHO} -n '${ROOT_DIR}: '
	if ${DIFF} output.txt ${ROOT_DIR}/output.se > /dev/null 2>&1 ; then \
		${ECHO} 'OK' ; \
	else \
		${ECHO} "*** FAILED ***" ; \
	fi

loadpath.se: ${ROOT_DIR}/loadpath.se
	${CP} ${ROOT_DIR}/loadpath.se loadpath.se

clean-se:
	-${SE_CLEAN} ${ROOT_CLASS}
	-${RM} -f tmp11.txt output.txt
	-${RM} -f ${TARGET_EXE}


#ISE Eiffel

ise:
	if [ ! -r failed.ise ]; then \
		${MAKE} test-ise ; \
		${MAKE} clean-ise ; \
	else \
		${ECHO} '${ROOT_DIR}: *** FAILED ***' ; \
	fi

test-ise: ise.ace
	-${ISE_ECOMPILER} ${ISE_CFLAGS} -ace ise.ace > tmp11.txt 2>&1
	if ! $(MAKE) ise_finish_freezing 'MAKEFLAGS=' > /dev/null 2>&1 ; then \
		${ECHO} 'finish_freezing failed!' >> tmp11.txt ; \
	fi
	-cd EIFGEN/${ISE_CODEGEN} ; \
		if [ -x ./${TARGET} ]; then \
			./${TARGET} >> ../../tmp11.txt 2>&1 ; \
		fi
	-${SED} -e 's/^<[0-9A-Fa-f]\+>/<>/g' tmp11.txt | \
		${GREP} -v "(version" | \
		${GREP} -v "] Degree " | \
		${GREP} -v "] Generation of auxiliary files" | \
		${GREP} -v "EIFGEN.${ISE_CODEGEN}" > output.txt
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
	if [ ! -r failed.hact ]; then \
		${MAKE} test-hact ; \
		${MAKE} clean-hact ; \
	else \
		${ECHO} '${ROOT_DIR}: *** FAILED ***' ; \
	fi

test-hact: hact.ace
	-${HACT_COMPILER} ${HACT_CFLAGS} -ace hact.ace -project ${TARGET}.eif > tmp11.txt 2>&1
	${MAKE} hact_fish 'MAKEFLAGS=' >> tmp11.txt 2>&1
	-cd ${TARGET}_gen/${HACT_CODEGEN} ; \
		if [ -x ./${TARGET} ]; then \
			./${TARGET} >> ../../tmp11.txt 2>&1 ; \
		fi
	-${SED} -e 's/^
.*//g' tmp11.txt | \
		${GREP} -v "==== iss-comp " | \
		${GREP} -v "] Degree " | \
		${GREP} -v "^Degree 5 cluster " | \
		${GREP} -v "^Generating global files" | \
		${GREP} -v "${TARGET}_gen.${HACT_CODEGEN}" > output.txt
	${ECHO} -n '${ROOT_DIR}: '
	-${GREP} -v "^$$" output.txt > tmp12.txt
	-if [ -r ${ROOT_DIR}/output.hact ]; then \
		${GREP} -v "^$$" ${ROOT_DIR}/output.hact > tmp13.txt ; \
	fi
	if ${DIFF} tmp12.txt tmp13.txt > /dev/null 2>&1 ; then \
		${ECHO} 'OK' ; \
	else \
		${ECHO} "*** FAILED ***" ; \
	fi
	-${RM} -f tmp12.txt tmp13.txt

# Problem with ${MAKEFLAGS} when compiling under
# Windows: 'nmake' (called by 'fish') does not
# recognize option --unix.
hact_fish:
	cd ${TARGET}_gen/${HACT_CODEGEN} ; \
		if [ -r fish.in ]; then \
			${HACT_FISH} ${HACT_FFLAGS} > tmp99.txt 2>&1 ; \
			if [ ! -x ./${TARGET} ]; then \
				${ECHO} 'C compilation crashed' ; \
			fi \
		fi

hact.ace: ${ROOT_DIR}/hact.ace
	${CP} ${ROOT_DIR}/hact.ace hact.ace

clean-hact:
	-${RM} -rf ${TARGET}_gen
	-${RM} -f ${TARGET}.eif
	-${RM} -f tmp11.txt output.txt


# Visual Eiffel

ve:
	if [ ! -r failed.ve ]; then \
		${MAKE} test-ve ; \
		${MAKE} clean-ve ; \
	else \
		${ECHO} '${ROOT_DIR}: *** FAILED ***' ; \
	fi

test-ve: ve.esd
	-${VE_COMPILER} ${VE_CFLAGS} -a:ve.esd
	-if [ -x ./${TARGET} ]; then \
		./${TARGET} >> tmp11.txt 2>&1 ; \
	fi
	-${CP} tmp11.txt output.txt
	${ECHO} -n '${ROOT_DIR}: '
	if ${DIFF} output.txt ${ROOT_DIR}/output.ve > /dev/null 2>&1 ; then \
		${ECHO} 'OK' ; \
	else \
		${ECHO} "*** FAILED ***" ; \
	fi

ve.esd: ${ROOT_DIR}/ve.esd
	${CP} ${ROOT_DIR}/ve.esd ve.esd

clean-ve:
	-${VE_COMPILER} -eu -y -no
	-${RM} -f tmp11.txt output.txt
	-${RM} -f ${TARGET_EXE}


# gelint

gelint:
	if [ ! -r failed.gelint ]; then \
		${MAKE} test-gelint ; \
		${MAKE} clean-gelint ; \
	else \
		${ECHO} '${ROOT_DIR}: *** FAILED ***' ; \
	fi

test-gelint: gelint.ace
	-${GELINT} gelint.ace > tmp11.txt 2>&1
	-${GREP} -v "^Parsed " tmp11.txt | ${GREP} -v "^Flattened " > output.txt
	${ECHO} -n '${ROOT_DIR}: '
	if ${DIFF} output.txt ${ROOT_DIR}/output.gelint > /dev/null 2>&1 ; then \
		${ECHO} 'OK' ; \
	else \
		${ECHO} "*** FAILED ***" ; \
	fi

gelint.ace: ${ROOT_DIR}/gelint.ace
	${CP} ${ROOT_DIR}/gelint.ace gelint.ace

clean-gelint:
	-${RM} -f tmp11.txt output.txt
