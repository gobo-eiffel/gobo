echo off

rem usage: veclean dirname

rem Delete Visual Eiffel cluster information in 
rem directory given as argument.

cd %1
vec /dc /y
