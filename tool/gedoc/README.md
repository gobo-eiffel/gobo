

## Detect attribute (i.e field) renaming in a diamond inheritance

We discovered a loophole in Eiffel's attribute renaming mechanism when applied to the diamond problem of multiple inheritance.

Please check the detail here: [https://github.com/joortcom/eiffel\_rename](https://github.com/joortcom/eiffel_rename)

and doc here: [https://github.com/joortcom/eiffel\_rename/blob/main/eiffel\_rename.pdf](https://github.com/joortcom/eiffel_rename/blob/main/eiffel_rename.pdf)

### Executive summary: for the time being (before the attribute renaming semantics is fixed), please avoid attribute renaming in a diamond inheritance.

## Goal:

Help programmer detect and avoid attribute renaming in a diamond inheritance.

## Usage:

```
$GOBO/tool/gedoc/detect_diamond.py <single_file.ecf> or <dir (which will be recursively scanned for .ecf file)>
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
