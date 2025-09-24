OPT=-finalize
DIR=F_code
DIR=W_code
ise:
	ec -freeze -c_compile -config src/system.ecf

clean_ise:
	ec -clean -config src/system.ecf


OPT= --gc=no --capability=concurrency=none  #  --finalize --no-benchmark
gobo:  # does not work: https://github.com/gobo-eiffel/gobo/issues/71
	gec $(OPT) src/system.ecf

fmt=implicit_converts
fmt=attr_rename

demo_ecf = ./test/tool/system.ecf
demo_ecf = src/system.ecf
demo:
	gedoc --format=$(fmt) $(demo_ecf) > inherited_fields.path

clean:
	$(RM) -fr *.c *.o *.make *.h *.sh EIFGENs/
