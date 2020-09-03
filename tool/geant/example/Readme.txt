This document explains the individual geant examples and how to use them.
It serves as a first draft version for the geant documentation.
All examples should be invoked from the command line.

geant syntax:

	geant [-V][-v|--verbose][-b|--buildfile <buildfile>] [-D<varname>=<varvalue>]* [target]

Getting started:
================
cd to the examples/hello directory and type 'geant'.
You should see the following output:

___________________________________________________________
	Hello world
___________________________________________________________


Let's have a look at the project file which produces this output.

___________________________________________________________
	<project name="hello" default="hi">
		<target name="hi">
			<echo message="Hello world"/>
		</target>
	</project>
___________________________________________________________

Since we do not provide a build file on the command line the default
name (build.eant) is used. With the option '-b' respectively
'--buildfile' it is possible to use a different file.  There is no
target specified on the command line either. In this case geant tries
to find a 'default' attribute in the <project> element by which the
start target for the build process can be specified. When there is no
default attribute geant gives up and terminates with the message
'Cannot determine start target.'.

With the option '-v' respectively '--verbose' geant's output is more verbose:
___________________________________________________________
Loading Project's configuration from build.eant

  Building Project

  hello.hi:

    [echo]
  Hello world
___________________________________________________________


A target can have an optional 'description' subelement which should
describe briefly what the target does. It must be the first subelement.
In a future version there will be a '--projecthelp' command line option
which will just list all the target names with its description without
starting the build process.

A <target> element may contain zero or more task elements as direct
children. Each task element is executed in sequential order. The
specific action which is performed is dependent on the individual
tasks.

The only task which our 'hi' target contains is <echo>. <echo> has a
single attribute called 'message' and this message is printed to
stdout. This is the reason why you see 'Hello world' on your screen.

In the following sections all other examples are explained. We usually
do not use 'build.eant' as a filename for the examples since we have
mostly more than one build file in a directory.

Variables:
===========

variable1:
Setting and querying a variable

cd to examples/variables

build file variable1.eant:
___________________________________________________________
<project name="variables1" default="var">
	<target name="var">
		<description>set and query a variable</description>
		<set name="who" value="world"/>
		<echo message="Hello ${who}"/>
	</target>
</project>
___________________________________________________________

'geant -v -b variables1.eant' produces:
___________________________________________________________
  Loading Project's configuration from variables1.eant
  Building Project

  variables1.var:

    [set] who=world
    [echo]
  Hello world
___________________________________________________________

With the <set> task a variable can be defined. The 'name' attribute specifies
the name of the variable and the 'value' attribute its value.
The values of variables can be retrieved using the ${<variablename>} syntax.
Thus ${who} in the examples returns 'world'.

The value of a variable can be overridden by a -D option on the command line.

'geant -v -b variables1.eant -Dwho=Eiffel' produces:
___________________________________________________________
  Loading Project's configuration from variables1.eant
  Building Project

  variables1.var:

    [set] who=world
    [echo]
  Hello Eiffel
___________________________________________________________


variable2:
==========
Cascading Variables:

cd to examples/variables

build file variables2.eant:
___________________________________________________________
<project name="variables2" default="var">
	<target name="var">
		<description>set and query a variable</description>
		<set name="firstname" value="Bart"/>
		<set name="fullname" value="${firstname} Simpson"/>
		<echo message="Hello ${fullname}"/>
	</target>
</project>
___________________________________________________________

'geant -v -b variables2.eant' produces:
___________________________________________________________
Loading Project's configuration from variables2.eant
Building Project

variables2.var:

  [set] firstname=Bart
  [set] fullname=Bart Simpson
  [echo]
Hello Bart Simpson
___________________________________________________________

This examples demonstrates how variables can be constructed from
other variables.


exec:
=====
Demonstrates the <exec> task.

cd to examples/exec

	build file dir.eant (for windows):
___________________________________________________________
<project name="dir" default="dir">
	<target name="dir">
		<description>executes a dir command under dos/windows</description>
		<set name="directory" value="."/>
		<exec executable="dir ${directory}"/>
	</target>
</project>
___________________________________________________________

'geant -v -b dir.eant' produces:
___________________________________________________________
Loading Project's configuration from dir.eant
Building Project

dir.dir:

  [set] directory=.
  [exec] dir .
 Volume in drive D is D
 Volume Serial Number is 5C52-67D3

 Directory of D:\svnstuff\gobo-eiffel\gobo\example\geant\exec

09/08/2002  07:32a      <DIR>          .
09/08/2002  07:32a      <DIR>          ..
05/04/2002  01:45p               2,429 build.eant
11/26/2002  08:41p      <DIR>          .svn
09/01/2001  01:30p                 261 dir.eant
09/01/2001  01:30p                 519 dir2.eant
09/08/2002  07:32a                 875 exec1.eant
09/01/2001  01:30p                 251 ls.eant
               5 File(s)          4,335 bytes
               3 Dir(s)   7,162,626,048 bytes free
___________________________________________________________


The exec task can be used as a general means to execute a command as
one would do on the command line. This can always be used when there
is no appropriate task available.
The attribute 'executable' takes the exact string one would specify
on the command line after replacing possibly existing variables.

call (unix):

	geant -b ls.eant

output:

	the same output as a 'ls -l' command on the command line would show.

geant:
Demonstrates the <geant> task.

cd to examples/geant

build file geant1.eant:
___________________________________________________________
<project name="geant" default="one">
	<target name="one">
		<description>calls other ant files</description>
		<set name="who" value="Bart"/>

		<set name="buildfile" value="../variables/variables5.eant"/>

		<echo message="------------------------"/>
		<echo message="before call of ${buildfile}"/>
		<geant file="${buildfile}" target="var"/>
		<echo message="after call of ${buildfile}"/>
		<echo message="-------" />
		<echo message="before call of ${buildfile}"/>
		<geant file="${buildfile}" reuse_variables="true" target="var"/> 
		<echo message="after call of ${buildfile}"/>
	</target>
</project>
___________________________________________________________

'geant -v -b geant1.eant' produces:

___________________________________________________________
Loading Project's configuration from geant1.eant
Building Project

geant.one:

  [set] who=Bart
  [set] buildfile=../variables/variables5.eant
  [echo]
------------------------
  [echo]
before call of ../variables/variables5.eant
Loading Project's configuration from ..\variables\variables5.eant
Building Project

variables5.var:

  [echo]
Hello ${who}
  [echo]
after call of ../variables/variables5.eant
  [echo]
-------
  [echo]
before call of ../variables/variables5.eant
Loading Project's configuration from ..\variables\variables5.eant
Building Project

variables5.var:

  [echo]
Hello Bart
  [echo]
after call of ../variables/variables5.eant
___________________________________________________________


With the geant task other geant files can be invoked. This can be
done in the within the same project scope (default behavior) or in
a new project scope when the 'file' attribute is set to 'true'.
At the moment the big difference is that for an invocation in the
same scope all defined variables are still available in the called build
file. The example makes this visible by displaying 'Hello ${who}'
instead of 'Hello Bart' for the first <geant> invocation. The
second <geant> invocation passes all variables and thats why you see
'Hello Bart'.
In the future <geant> will be able to take arguments which can be passed
to the called build project exactly like you can do it on the command line already.


depends:
========
Demonstrates the depend attribute of targets.

cd to examples/depends

depends1.eant:
___________________________________________________________
<project name="depend_demo" default="C">

	<target name="A">
		<echo message="A"/>
	</target>

	<target name="B" depend="A">
		<echo message="B"/>
	</target>

	<target name="C" depend="B">
		<echo message="C"/>
	</target>

</project>
___________________________________________________________

'geant -v -b depends1.eant' produces:
___________________________________________________________
Loading Project's configuration from depends1.eant
Building Project

depend_demo.A:

  [echo]
A

depend_demo.B:

  [echo]
B
 
depend_demo.C:

  [echo]
C
___________________________________________________________

With the XML attribute 'depend' targets can be made dependent on
another. In the example target 'C' is dependent on target
'B'. This means that target 'B' will be executed before target 'C'
is executed. It is possible to specify more than one target
dependency using comma separated target names in the 'depend'
attribute:

		<target name="C" depend="B,A" >
			<echo message="C" />
		</target>

This means that target 'B' is executed first, then target 'A' and
then target 'C'.


condidional/if,unless:
======================
Demonstrates the optional 'if' and 'unless' XML attributes of targets.

cd to examples/conditional.

buildfile if1.eant:
___________________________________________________________
<project name="if_demo1" default="C">

	<target name="A" if="$runa">
		<echo message="A"/>
	</target>

	<target name="B" if="${runb}">
		<echo message="B"/>
	</target>

	<target name="C" depend="A,B">
		<echo message="C"/>
	</target>

</project>
___________________________________________________________

'geant -v -b if1.eant' produces:
___________________________________________________________
Loading Project's configuration from if1.eant
Building Project

if_demo1.C:

  [echo]
C
___________________________________________________________

As values of the 'if' and 'unless' XML attributes of target elements
you can use variable values and environment variables. This
means the 'if' attribute returns true if the variable is defined
otherwise true. The value of the variable does not matter. The same
is true for 'unless' except that it returns true if it is not
defined.

Since the variables 'runa' and 'runb' are not defined target 'A' and
target 'B' do not produce any output.

'geant -v -b if1.eant -Druna=any_value_you_like' produces:
___________________________________________________________
Loading Project's configuration from if1.eant
Building Project

if_demo1.A:

  [echo]
A

if_demo1.C:

  [echo]
C
___________________________________________________________

geant -v -b if1.eant -Druna=any_value_you_like -Drunb=another_value_you_like
___________________________________________________________
Loading Project's configuration from if1.eant
Building Project

if_demo1.A:

  [echo]
A

if_demo1.B:

  [echo]
B

if_demo1.C:

  [echo]
C
___________________________________________________________

As you can see the if's return true and targets 'A' respectively 'B'
get executed.


The file unless1.eant contains the same examples but the if's have
been replaced with unless's.

conditional/if2:
Demonstrates how we can use 'if' and 'unless' to create an OS
independent build file.

cd to examples/conditional.

if2.eant:
___________________________________________________________
<project name="if_demo2" default="list">

	<target name="list_for_windows" if="$WINDIR">
		<exec executable="dir"/>
	</target>

	<target name="list_for_unix" unless="$WINDIR">
		<exec executable="ls -l"/>
	</target>

	<target name="list" depend="list_for_windows,list_for_unix">
	</target>

</project>
___________________________________________________________

'geant -v -b if2.eant' produces (for windows):
___________________________________________________________
Loading Project's configuration from if2.eant
Building Project

if_demo2.list_for_windows:

  [exec] dir
 Volume in drive D is D
 Volume Serial Number is 5C52-67D3

 Directory of D:\svnstuff\gobo-eiffel\gobo\example\geant\conditional

09/03/2002  08:15p      <DIR>          .
09/03/2002  08:15p      <DIR>          ..
11/26/2002  08:41p      <DIR>          .svn
11/11/2001  10:58p                 261 if1.eant
11/11/2001  10:58p                 316 if2.eant
11/11/2001  10:58p                 593 if3.eant
11/11/2001  10:58p                 925 if4.eant
05/12/2002  05:30p                 724 if5.eant
09/03/2001  05:58p                 271 unless1.eant
               6 File(s)          3,090 bytes
               3 Dir(s)   7,162,556,416 bytes free

if_demo2.list:
___________________________________________________________

Note:
	for simplicity we assume here that if a environment variable
	'windir' exists that we are in a windows environment. Otherwise we
	are on unix. This should be ok for most situations.

File if3.eant basically has the same behavior but introduces an
additional abstraction layer by introducing some variables defining
the operating system:
___________________________________________________________
<project name="if_demo3" default="list">

	<target name="windows" if="$WINDIR">
		<set name="os.windows" value="true"/>
	</target>

	<target name="unix" unless="$WINDIR">
		<set name="os.unix" value="true"/>
	</target>

	<target name="init" depend="windows,unix">
	</target>


	<target name="list_for_windows" depend="init" if="$os.windows">
		<exec executable="dir"/>
	</target>

	<target name="list_for_unix" depend="init"  if="$os.unix">
		<exec executable="ls -l"/>
	</target>

	<target name="list" depend="list_for_windows,list_for_unix">
	</target>

</project>
___________________________________________________________
