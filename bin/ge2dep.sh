#!/bin/sh

# usage: ge2dep.sh

# Generate to stdout Makefile dependencies
# in order to generate Eiffel files from
# <filename>.ge files. Eiffel files will be
# generated in spec/(ise|ve|se|hact)/<filename>.e.
# Create directories spec/(ise|ve|se|hact) if
# they don't exist yet.


if [ ! -d spec ]; then mkdir spec ; fi
if [ ! -d spec/ise ]; then mkdir spec/ise ; fi
if [ ! -d spec/hact ]; then mkdir spec/hact ; fi
if [ ! -d spec/ve ]; then mkdir spec/ve ; fi
if [ ! -d spec/se ]; then mkdir spec/se ; fi

for file in `find | grep \.ge$` ; do
	echo spec: spec/ise/`basename $file .ge`.e
	echo spec/ise/`basename $file .ge`.e: $file
	echo "	gepp -DISE $file spec/ise/`basename $file .ge`.e"
	echo ""
	echo spec: spec/hact/`basename $file .ge`.e
	echo spec/hact/`basename $file .ge`.e: $file
	echo "	gepp -DHACT $file spec/hact/`basename $file .ge`.e"
	echo ""
	echo spec: spec/se/`basename $file .ge`.e
	echo spec/se/`basename $file .ge`.e: $file
	echo "	gepp -DSE $file spec/se/`basename $file .ge`.e"
	echo ""
	echo spec: spec/ve/`basename $file .ge`.e
	echo spec/ve/`basename $file .ge`.e: $file
	echo "	gepp -DVE $file spec/ve/`basename $file .ge`.e"
	echo ""
done
