#!/bin/sh

# usage: ge2e.sh dirname

# Preprocess '<filename>.ge' files in directory 'dirname'.
# Write output to corresponding '<filename>.e' files in
# directory 'dirname'/spec/(ise|ve|se|hact|tower)/<filename>.e.

cd $1

if [ ! -d spec ]; then mkdir spec ; fi
if [ ! -d spec/ise ]; then mkdir spec/ise ; fi
rm -f spec/ise/*.e
if [ ! -d spec/hact ]; then mkdir spec/hact ; fi
rm -f spec/hact/*.e
if [ ! -d spec/ve ]; then mkdir spec/ve ; fi
if [ -d spec/ve/ecluster ]; then cd spec/ve ; vec /dc /y ; cd ../.. ; fi
rm -f spec/ve/*.e
if [ ! -d spec/se ]; then mkdir spec/se ; fi
rm -f spec/se/*.e
# if [ ! -d spec/tower ]; then mkdir spec/tower ; fi
# rm -f spec/tower/*.e

for file in `ls *.ge` ; do
	echo $file
	for compiler in ISE HACT VE SE ; do
#	for compiler in ISE HACT VE SE TOWER ; do
#		touch spec/$compiler/`basename $file .ge`.e
		gepp -D$compiler $file spec/$compiler/`basename $file .ge`.e
	done
done
