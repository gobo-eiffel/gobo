#!/bin/sh

mkdir spec
mkdir spec/ise
mkdir spec/hact
mkdir spec/ve
mkdir spec/se
GOBO_UNIX=`echo $GOBO | sed "s/\\\\\\/\//g"`
export GOBO_UNIX
for file in `ls $GOBO_UNIX/library/kernel/*.ge` ; do
	./gepp -DISE $file spec/ise/`basename $file .ge`.e > tmp1.txt
	./gepp -DHACT $file spec/hact/`basename $file .ge`.e >> tmp1.txt
	./gepp -DSE $file spec/se/`basename $file .ge`.e >> tmp1.txt
	./gepp -DVE $file spec/ve/`basename $file .ge`.e >> tmp1.txt
	if [ -s tmp1.txt ]; then
		echo "./gepp -D$compiler $file spec/$compiler/`basename $file .ge`.e"
		cat tmp1.txt
	fi
done
diff -r $GOBO/library/kernel/spec spec > tmp2.txt 2>&1
if [ -s tmp2.txt ]; then
	echo "diff -r \$GOBO/library/kernel/spec spec"
	cat tmp2.txt
fi
