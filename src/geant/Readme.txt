geant (Ant for Eiffel)
======================

short description:
==================

build tool for Eiffel, modeled after the Jakarta Ant build tool for Java.

external dependencies:
======================
geant is dependant on
- cvs version of eXML (see http://exml.sourceforge.net)
- cvs version of GOBO (see http://gobo-eiffel.sourceforge.net)

compilation:
=============
  open a terminal in the 'build' subdirectory

  1.) first time
  1.a) without xace:
  -------------
    invoke 'compile bootstrap_se.ace' (uses SmallEiffel for compilation)

  1.b) with xace:
  -------------
    invoke 'xace --build --se xace.xml'
    invoke 'compile se.xace'

  2.) After the first time you can compile geant with geant itself:

    invoke 'geant' which uses the file 'ebuild.xml' for the build process

copy the geant executable to a directory your path points to.

run:
=============
cd to the directory 'build'
invoke 'geant'
which compiles geant again into the executable geant.exe and renames it to g.exe.

invoke 'geant clean' to clean up the directory

invoke 'geant test' which runs some test (just for demo).
Check out the file 'ebuild.xml' for the details.

It seems a little weird to compile geant with geant but simply try to compile your own application
with it by copying the ebuild.xml file into your project directory, modify it according to your needsand use it.

status/plans:
=============
- more specific tasks (use the exec task for now)
- support for other Eiffel Vendors
- support for os/platform independency


open issues:
============
- how do we get the return code from a system command

- Sven Ehrke, 10th June 2001, last updat: 23.6.2001

