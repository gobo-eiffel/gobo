cvs export -D now gobo
cd gobo
rm -rf test
rm -rf work
copy %GOBO%\bin\gelex.exe bin
copy %GOBO%\bin\geyacc.exe bin
copy %GOBO%\bin\gepp.exe bin
cd library\kernel
call make_spec.bat
pause
