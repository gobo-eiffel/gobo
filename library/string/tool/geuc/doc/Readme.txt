Gobo Eiffel Unicode Class generation tool
=========================================

Geuc is a tool for generating routines from the Unicode Character Database
(see http://www.unicode.org/ucd/)

A note on canonical combining classes
-------------------------------------

Canonical combing classes range from 0 to 240
(at present - version 4.1.0). These could be nicely represented with a
NATURAL_8, but VE ans SE 1 do not support these currently
(2005/11/02).
In order to avoid the space wastage caused by ARRAY [INTEGER_16], and
the danger that VE would run out of memory when compiling, I project
these values 1-to-1 onto the range 0-60.
This was achieved by visual inspection of the data, to see which
combining classes were actually present in the UCD (Unicode Character
Database) - I inserted print statements into geuc to get the output.
With each new version of Unicode, you must check to see if any new
values are in use (hopefully, the changes files will tell you this).
When all supported compilers support NATURAL_8, then we can drop these
projections.

N.B. This is now the case, but I don't feel energetic enough to change
the code right now. Anyone who feels energetic - feel free.

A note on Hangul syllables and conjoining jamo behavior
-------------------------------------------------------

The UCD does not contain any decompositions for Hangul syllables and
conjoining Hangul jamo, as these compositions/decompositions are
completely determined algorithmically.
Accordingly, one has the choice of trading memory for speed, by
calculating the decompositions and compositions at runtime, or
calculating them at array generation time.
I have chosen to do the latter, as:
1) Users of Korean will not suffer a speed penalty compared to other
users.
2) In order to save the memory, the segments of the array will have to
be Void references. This would destroy the invariant, that there are
no Void entries.
3) All users would suffer a slight performance degradation, as each
segment would have to be checked as non-void before it could be
accessed.
4) The memory savings, although not insignifiacnt, are very small
compared with the total Unicode array memory usage for an application.

Usage
-----

The basic procedure for use is:

1) Change directory to $GOBO/library/string/tool/geuc/src and then remove any existing
   generated classes by:

geant clean (or geant clobber).

2) Compile the geuc program with:

geant compile

or some variant of that command.

3) Save copies of the Unicode Character Database in $GOBO/library/string/tool/geuc/src.
The following files need to be imported:

 ftp://www.unicode.org/Public/UNIDATA/UnicodeData.txt
 ftp://www.unicode.org/Public/UNIDATA/DerivedCoreProperties.txt
 ftp://www.unicode.org/Public/UNIDATA/DerivedNormalizationProps.txt
 ftp://www.unicode.org/Public/UNIDATA/SpecialCasing.txt

Do NOT add these files to the Git repository.

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
geuc-vxxx.e, and make the necessary changes.

4) Run the utility to produce versioned files. e.g.

./geuc --uc_version=410

The character string after --uc_version= will be used unchanged (apart
from case) in the generated class names.

So, for instance, if the unversioned class name is:

UC_CHARACTER_CLASS_ROUTINES

then the above command line will generate

UC_V410_CHARACTER_CLASS_ROUTINES

5) Move the generated classes to their target libraries by:

geant deploy

The target library is $GOBO/library/string/src/unicode for normalization
routines, and $GOBO/library/kernel/src/unicode for all other routines.

6) Edit the unversioned classes to inherit from the latest
versioned class.

If any of the classes are new (which will be the case if you are
generating a new version, or if you are adding a new facility from the
database), then don't forget to add the files to the Git repository (contrary
to the rest of Gobo, with geuc, we store the GENERATED files, and not the
source files). Also create by hand and add to the Git repository a shared access class.
E.g. ST_UNICODE_CHARACTER_CLASS_ROUTINES has a corresponding shared access
class ST_IMPORTED_UNICODE_CHARACTER_CLASS_ROUTINES, and
ST_UNICODE_V410_CHARACTER_CLASS_ROUTINES has
ST_IMPORTED_UNICODE_V410_CHARACTER_CLASS_ROUTINES 

Also, create a UC_Vnnn_CTYPE class (use an existing one as a model) and
if it is the latest version, change UC_CTYPE to inherit from it.

7) Fetch the file:

 ftp://www.unicode.org/Public/UNIDATA/NormalizationTest.txt

and save it in $GOBO/library/string/test/unit/data

The test class ST_TEST_NORMALIZATION_ROUTINES will look for this
file, and use it to test the normalization code.
These tests MUST be run after any changes, to ensure the correct
working of the normalization code, which is highly optimized.

--
Copyright (c) 2005, Colin Adams and others
