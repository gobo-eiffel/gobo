

## Detect attribute (i.e field) renaming in diamond inheritance

We discovered a semantic problem in Eiffel's attribute renaming mechanism when applied to the diamond problem of multiple inheritance.

Please check the detail here: [https://github.com/joortcom/eiffel\_rename](https://github.com/joortcom/eiffel_rename)

and doc here: [https://github.com/joortcom/eiffel\_rename/blob/main/eiffel\_rename.pdf](https://github.com/joortcom/eiffel_rename/blob/main/eiffel_rename.pdf)

### Executive summary:
For the time being (before the attribute renaming semantics is settled & fixed
-- which most likely will be a *breaking* change of existing code),
please avoid attribute renaming in any diamond inheritance.

### A bit more detail:

In [ECMA-367 (specification for the Eiffel programming language](https://www.ecma-international.org/wp-content/uploads/ECMA-367_2nd_edition_june_2006.pdf)

1) by 8.16.2 “Any two of these features inherited under a different name yield two features of D”:
which means replicated (i.e. separated copies) features (attributes in particular) in the diamond bottom class D;

2) while by 8.6.16 “Semantics: Renaming principle”: “Renaming does not affect the semantics of an inherited feature”:
which is not a very precise description.

So in the actual compiler implementations:

* ISE compiler (test the lastest version 23.09):
  * In workbench mode: implemented 2) 8.6.16 as reference identity semantics: i.e renamed attributes are all reference equal!
  * In finalized mode: skipped 2) 8.6.16, only implemented 1) 8.16.2: i.e renamed attributes are replicated.
* GOBO compiler (test the lastest version 22.01):
  * skipped 2) 8.6.16, only implemented 1) 8.16.2: i.e renamed attributes are replicated.
* SmartEiffel compiler (tested the last known ECMA compilant version 1.1):
  * skipped 2) 8.6.16, only implemented 1) 8.16.2: i.e renamed attributes are replicated.


## Goal:

Help programmer detect and avoid attribute renaming in a diamond inheritance.

## Usage:

```
$GOBO/tool/gedoc/detect_diamond.py <single_file.ecf> or <dir (which will be recursively scanned for all the .ecf files)>
```

## Demo:

First, build all the GOBO tools, esp `gec` and `gedoc` as you usually do.

Then, run the `detect_diamond.py` tool

```
$ cd $GOBO/tool/gedoc/example/rename
$ $GOBO/tool/gedoc/detect_diamond.py app.ecf
check:  app.ecf
======================================== app.ecf total fields:  966
diamond found, full paths:  PERSON.addr  =>  RESEARCH_ASSISTANT.{student_addr, faculty_addr, addr}
   student_addr {('PERSON.addr', 'STUDENT.addr', 'RESEARCH_ASSISTANT.student_addr')}
   faculty_addr {('PERSON.addr', 'FACULTY.addr', 'RESEARCH_ASSISTANT.faculty_addr')}
   addr {('PERSON.addr', 'RESEARCH_ASSISTANT.addr')}
new_fields: RESEARCH_ASSISTANT.{student_addr, faculty_addr, addr}
diamond core:  PERSON.addr  =>  RESEARCH_ASSISTANT.{student_addr, faculty_addr, addr}
   student_addr [('PERSON.addr', 'STUDENT.addr', 'RESEARCH_ASSISTANT.student_addr')]
   faculty_addr [('PERSON.addr', 'FACULTY.addr', 'RESEARCH_ASSISTANT.faculty_addr')]
   addr [('PERSON.addr', 'RESEARCH_ASSISTANT.addr')]
```

And, run the compiler to see different outputs for the *same* code:

* ISE compiler implements the reference identity semantics in workbench mode
* ISE compiler implements the replica semantics in finalize mode
* GOGO compiler implements the replica semantics

```
$ cd $GOBO/tool/gedoc/example/rename  # the same dir as above
$ make ise
============================================================================================
NOTE: ISE compiler implements the troublesome reference identity semantics in workbench mode
============================================================================================

ec -clean  -full  app.e

...

C compilation completed
chmod +x ./app
mv app app_w
============================================================================================
./app_w > ise_w.out
cat       ise_w.out
ResAssis has 3 addresses: <home, home, home>
PERSON  size: 32
STUDENT size: 32
FACULTY size: 32
RESEARCH_ASSISTANT size: 48
ResAssis do_benchwork in the: home
ResAssis take_rest in the: home
-- print_student|faculty_addr_direct_field
ResAssis as STUDENT.addr: home
ResAssis as FACULTY.addr: home
-- print_student|faculty_addr_via_accessor
ResAssis as STUDENT.addr: home
ResAssis as FACULTY.addr: home
-- check reference identity
ra.addr  = ra.faculty_addr
ra.addr  = ra.student_addr
ra.student_addr  = ra.faculty_addr
-- test some assignment: suppose ra moved both lab2 and dorm2
ResAssis has 3 addresses: <lab2, lab2, lab2>
ResAssis has 3 addresses: <dorm2, dorm2, dorm2>
============================== Press enter to continue ============================== 


============================================================================================
***NOTE***: ISE compiler implements the replica semantics in finalize mode
============================================================================================
ec -clean  -finalize -full  app.e
C compilation completed
chmod +x ./app
mv app app_f
============================================================================================
./app_f > ise_f.out
cat       ise_f.out
ResAssis has 3 addresses: <home, dorm, lab>
PERSON  size: 32
STUDENT size: 32
FACULTY size: 32
RESEARCH_ASSISTANT size: 48
ResAssis do_benchwork in the: home
ResAssis take_rest in the: home
-- print_student|faculty_addr_direct_field
ResAssis as STUDENT.addr: home
ResAssis as FACULTY.addr: home
-- print_student|faculty_addr_via_accessor
ResAssis as STUDENT.addr: home
ResAssis as FACULTY.addr: home
-- check reference identity
ra.addr != ra.faculty_addr
ra.addr != ra.student_addr
ra.student_addr != ra.faculty_addr
-- test some assignment: suppose ra moved both lab2 and dorm2
ResAssis has 3 addresses: <lab2, dorm, lab>
ResAssis has 3 addresses: <dorm2, dorm, lab>

$ make gobo
<your gobo dir>/bin/gec app.ecf
...
============================================================================================
./app > gobo.out
cat     gobo.out
ResAssis has 3 addresses: <home, dorm, lab>
PERSON  size: 32
STUDENT size: 32
FACULTY size: 32
RESEARCH_ASSISTANT size: 48
ResAssis do_benchwork in the: home
ResAssis take_rest in the: home
-- print_student|faculty_addr_direct_field
ResAssis as STUDENT.addr: home
ResAssis as FACULTY.addr: home
-- print_student|faculty_addr_via_accessor
ResAssis as STUDENT.addr: home
ResAssis as FACULTY.addr: home
-- check reference identity
ra.addr != ra.faculty_addr
ra.addr != ra.student_addr
ra.student_addr != ra.faculty_addr
-- test some assignment: suppose ra moved both lab2 and dorm2
ResAssis has 3 addresses: <lab2, dorm, lab>
ResAssis has 3 addresses: <dorm2, dorm, lab>

```
