OPT= -clean #-sedb

ISE_OPT = -full #: with full class checking regardless of ECF settings.

SE=compile  # SmartEiffel
EC=ec

se_:
	cd se && make se
se:
	$(SE) $(OPT) app.e -o app
	@echo "============================================================================================"
	./app > se.out
	cat     se.out

ise:
	@echo "============================================================================================"
	@echo "NOTE: ISE compiler implements the troublesome reference identity semantics in workbench mode"
	@echo "============================================================================================"
	$(EC) $(OPT) $(ISE_OPT) app.e
	chmod +x ./app
	mv app app_w
	@echo "============================================================================================"
	./app_w > ise_w.out
	cat       ise_w.out
	@printf "%s " "============================== Press enter to continue =============================="
	@read ans
	@echo "============================================================================================"
	@echo "***NOTE***: ISE compiler implements the replica semantics in finalize mode"
	@echo "============================================================================================"
	$(EC) $(OPT) -finalize $(ISE_OPT) app.e
	chmod +x ./app
	mv app app_f
	@echo "============================================================================================"
	./app_f > ise_f.out
	cat       ise_f.out

gobo:
	$(PROJECT)/gobo/bin/gec app.ecf
	@echo "============================================================================================"
	./app > gobo.out
	cat     gobo.out

fmt=attr_rename
demo:
	../../gedoc --format=$(fmt) app.ecf > inherited_fields.path
	../../detect_diamond.py

clean:
	$(RM) -fr app a.out EIFGENs/ app.make app.sh *.c *.h *.out *.o
	clean app
