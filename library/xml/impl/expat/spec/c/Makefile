include ${GOBO}/misc/platform.mk

# *******************
# USER SETTINGS BELOW
# *******************

# Make sure CFLAGS has the proper vendor #define
CFLAGS+=-D$(VENDOR)

#Flags for gcc while using VisualEiffel
# VE_Bin is the path where cecil.h can be found
ifeq ($(VENDOR),ve)
CFLAGS+=-I$(VE_Bin)
endif

#Flags for gcc while using SmallEiffel
ifeq ($(VENDOR),se)
CFLAGS+=-I$(SEDIR)
endif


#Flags for gcc while using ISE Eiffel
ifeq ($(VENDOR),ise)
CFLAGS+=-I$(EIFFEL4)/bench/spec/$(PLATFORM)/include
endif

#library file name
OUT_FILE=libexml-expat-${VENDOR}${LIB}

#
C_FILES=exml_expat.c exml_helper.c
H_FILES=eiffel.h $(addsuffix .h, $(foreach C_FILE, ${C_FILES}, $(basename ${C_FILE})))
O_FILES=$(addsuffix ${OBJ}, $(foreach C_FILE, ${C_FILES}, $(basename ${C_FILE})))

# ********************
# END OF USER SETTINGS
# ********************

help: 
	@${ECHO} "make [lib-se | lib-ise | lib-ve | lib-hact]"

lib-se: clean
	${MAKE} build "VENDOR=se"

lib-ise: clean
	${MAKE} build "VENDOR=ise"

lib-ve: clean
	${MAKE} build "VENDOR=ve"

lib-hact: clean
	${MAKE} build "VENDOR=hact"


install-ise:
	${MAKE} install "VENDOR=ise"

install-se:
	${MAKE} install "VENDOR=se"

install-ve:
	${MAKE} install "VENDOR=ve"

install-hact:
	${MAKE} install "VENDOR=hact"


clean-se:
	${MAKE} clean "VENDOR=se"

clean-ise:
	${MAKE} clean "VENDOR=ise"

clean-ve:
	${MAKE} clean "VENDOR=ve"

clean-hact:
	${MAKE} clean "VENDOR=hact"

build: ${OUT_FILE}

${OUT_FILE}: ${O_FILES}
	${CREATE_LIBRARY}

install: ${OUT_FILE}
	-${CP} $< /usr/local/lib

clean:
	-${RM} ${O_FILES}
	-${RM} ${OUT_FILE}

