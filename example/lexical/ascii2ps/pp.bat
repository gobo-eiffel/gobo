@echo off
set tmpfile=%TMP%\ascii2ps.tmp
ascii2ps -2 -- %1 %tmpfile%
print /D:YOUR_PRINTER %tmpfile%
del %tmpfile%
