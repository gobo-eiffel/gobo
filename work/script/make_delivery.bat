cvs export -D now gobo
cd gobo
rm -rf work
rm -rf doc\structure\visio
copy %GOBO%\bin\gelex.exe bin
copy %GOBO%\bin\geyacc.exe bin
copy %GOBO%\bin\gepp.exe bin
cd library\kernel
call make_spec.bat
