OPT= -clean #-sedb

ISE_OPT = -full #: with full class checking regardless of ECF settings.

SE=compile  # SmartEiffel
EC=ec

se_:
	cd se && make se
se:
	$(SE) $(OPT) app.e -o app
	./app > se.out
	cat     se.out

ise:
	@echo ""
	@echo "***NOTE***: ISE compiler implements the troublesome reference identity semantics in workbench mode which we cannot fix (we cannot change their compiler)"
	@echo ""
	$(EC) $(OPT) $(ISE_OPT) app.e
	chmod +x ./app
	mv app app_w
	./app_w > ise_w.out
	cat       ise_w.out
	@echo "***NOTE***: ISE compiler implements the replica semantics in finalize mode which we cannot fix (we cannot change their compiler)"
	$(EC) $(OPT) -finalize $(ISE_OPT) app.e
	chmod +x ./app
	mv app app_f
	./app_f > ise_f.out
	cat       ise_f.out

gobo:
	$(PROJECT)/gobo/bin/gec app.ecf
	./app > gobo.out
	cat     gobo.out

fmt=field_rename
demo:
	../../gedoc --format=$(fmt) app.ecf > inherited_fields.path
	../../detect_diamond.py

clean:
	$(RM) -fr app a.out EIFGENs/ app.make app.sh *.c *.h *.out *.o
	clean app
