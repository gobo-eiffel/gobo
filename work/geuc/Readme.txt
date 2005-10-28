Gobo Eiffel Unicode class generation tool
=========================================

Geuc is a tool for generating routines from the Unicode Character Database
(see http://www.unicode.org/ucd/)

The basic procude for use is:

1) Change directory to $GOBO/work/geuc and then remove any existing
   classes named uc_*.e 

2) Compile the geuc program with:

geant compile

or some variant of that command.

3) Save copies of the Unicode Character Database in $GOBO/work/geuc.
The following files need to be imported:

 ftp://www.unicode.org/Public/UNIDATA/UnicodeData.txt
 ftp://www.unicode.org/Public/UNIDATA/DerivedCoreProperties.txt

Do NOT add these files to CVS.

Note that only the latest version of the files should be obtained.
The idea is that we generate unversioned Eiffel classes, which always
represent the latest version available, and also versioned Eiffel
classes (in case programmers want to code for a specific version of
Unicode for their application - this might be wanted if a particular
public standard mandates using a specific version of Unicode).

Since the format of the Unicode Character Database has some tendency
to change incompatibly over time, geuc will only support the format 
for the current version. If for some reason you need an archaic
version of the Unicode Character Database, then please copy geuc.e to
geuc-vxxx.e.

4) Run the utility to produce unversioned files:

./geuc

5) Run the utility to produce versioned files. e.g.

./geuc --uc_version=v410

The character string after --uc_version= will be used unchanged (apart
from case) in the generated class names.

So, for instance, if the unversioned class name is:

UC_CHARACTER_CLASS_ROUTINES

then the above command line will generate

UC_V410_CHARACTER_CLASS_ROUTINES

6) Move the generated classes to 

$GOBO/library/kernel/unicode

If any of the classes are new (which will be the case if you are
generating a new version, or if you are adding a new facility from the
database), then don't forget to add the files to CVS (contrary to the
rest of Gobo, with geuc, we store the GENERATED files, and not the
source files). Also create by hand and add to CVS a shared access class.
E.g. UC_CHARACTER_CLASS_ROUTINES has a corresponding shared access
class UC_IMPORTED_CHARACTER_CLASS_ROUTINES, and
UC_V410_CHARACTER_CLASS_ROUTINES has
UC_IMPORTED_V410_CHARACTER_CLASS_ROUTINES 




