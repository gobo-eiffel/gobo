This document explains the individual geant examples and how to use them.
It serves as a first draft version for the geant documentation.
All examples should be invoked from the commandline.

geant syntax:

	geant [-V][-v|--verbose][-b|--buildfile <buildfile>] [-D<varname>=<varvalue>]* [target]

Getting started:
================
cd to the examples/hello directory and type 'geant'.
You should see the following output:

	[echo] Hello world

Let's have a look at the project file which produces this output.

	<project name="hello" >
		<target name="hi">
			<echo message="Hello world" />
		</target>
	</project>

Since we do not provide a buildfile on the commandline the default name (build.eant) is
used. With the option '-b' respectively '--buildfile' it is possible to use a different file.
There is no target specified on the commandline either. In this case geant tries to find a
'default' attribute in the <project> element by which the start target for the build process
can be specified. When there is no default attribute as in this simple example the first
target (named 'hi' in our example) is the first target which will be executed.
If there is no target in the project geant gives up and terminates.

A target can have an optional 'description' attribute which should describe briefly what
the target does. In a future version there will be a '--projecthelp' commandline option
which will just list all the targetnames with its description without starting the build
process.


A <target> elements can contain zero or more task elements as direct children. Each task
element is executed in sequential order. The specific action which is performed is dependent
on the individual tasks.

The only task wich our 'hi' target contains is <echo>. <echo> has a single attribute called
'message' and this message is printed to stdout. This is the reason why you see 'Hello world'
on your screen.

In the following sections all other examples are explained. We usually do not use 'build.eant'
as filename for the examples since we have mostly more than one build file in a directory.

Variables:
===========

variable1:
Setting and querying a variable

cd to examples/variables

	buildfile variable1.eant:

		<project name="variables1" >
			<target name="var" description="set and query a variable">
				<var name="who" value="world" />
				<echo message="Hello ${who}" />
			</target>
		</project>

	call:

		geant -b variables1.eant

	output:

		var:
		
		  [echo] Hello world

	With the <var> task a variable can be defined. The 'name' attribute specifies
	the name of the variable and the 'value' attribute it's value.
	The values of variables can be retrieved using the ${<variablename>} syntax.
	Thus ${who} in the examples returns 'world'.

	The value of a variable can be overridden by a -D option on the commandline:

	call:

		geant -b variables1.eant -Dwho=Eiffel

	output:

		var:
		
		  [echo] Hello Eiffel

	call:

		geant -b variables1.eant -Dwho="Eiffel World"

	output:

		var:
		
		  [echo] Hello Eiffel World

	Once a variable has been set it cannot be set again.
	This bahaviour might change in a future version.


variable2:
Cascading Variables:

cd to examples/variables

	buildfile variables2.eant:

		<project name="variables2"  >
			<target name="var" description="set and query a variable">
				<var name="lastname" value="Simpson" />
				<var name="fullname" value="Bart ${lastname}" />
				<echo message="Hello ${fullname}" />
			</target>
		</project>

	call:

		geant -b variable2.eant

	output:

		var:
		
		  [echo] Hello Bart Simpson

	This examples demonstrates how variables can be constructed from other variables.

	NOTE:
		The Eiffel XML parser which geant uses has a bug at the moment, which does not
		allow you to set an empty XML attribute value like "" or which contains only whitespace
		like in " ".


exec:
Demonstrates the <exec> task.

cd to examples/exec

	buildfile dir.eant (for windows):

		<project name="dir" default="dir" >
			<target name="dir" description="executes a dir command under dos/windows">
				<var name="directory" value="." />
				<exec executable="dir ${directory}" />
			</target>
		</project>

	call (windows):

		geant -b dir.eant

	output:

		the same output as a 'dir' command on the commandline would show.

	The exec task can be used as a general means to execute a command as one would do
	on the commandline. This can always be used when there is no appropriate task available.
	The attribute 'executable' takes the exact string one would specify on the commandline.

	call (unix):

		geant -b ls.eant

	output:

		the same output as a 'ls -l' command on the commandline would show.

	NOTE:

		One job of the tasks is to make commands platform independent. At the moment
		geant is at the very beginning regarding this issue.
		Let's take an example. For copying a file it should not be necessary to
		invoke <exec executable="copy ....." /> on windows and <exec executable="cp ....." />
		on unix but rather have a <cp> task which makes it transparent.


geant:
Demonstrates the <geant> task.

cd to examples/geant

	buildfile geant1.eant:

		<project name="geant" >
			<target name="one" description="calls other ant files">
				<var name="who" value="Bart" />
		
				<echo message="------------------------" />
				<echo message="before call of ../variables/variables1.eant" />
				<geant file="../variables/variables1.eant" />
				<echo message="after call of ../variables/variables1.eant" />
				<echo message="-------" />
				<echo message="before call of ../variables/variables1.eant" />
				<geant file="../variables/variables1.eant" fork="true"/> 
				<echo message="after call of ../variables/variables1.eant" />
			</target>
		</project>

	call:

		geant -b geant1.eant

	output:

		one:
		
		  [echo] ------------------------
		  [echo] before call of ../variables/variables1.eant
		
		var:
		
		  [echo] Hello Bart
		  [echo] after call of ../variables/variables1.eant
		  [echo] -------
		  [echo] before call of ../variables/variables1.eant
		  [geant] geant -b ../variables/variables1.eant
		
		var:
		
		  [echo] Hello world
		  [echo] after call of ../variables/variables1.eant



	With the geant task other geant files can be invoked. This can be done in the same
	process (default behaviour) or in a new process when the 'force' attribute is set to
	'true'.
	At the moment the big difference is that for an inprocess invokation all defined variables
	are still available in the called build file. The example makes this visible by displaying
	'Hello Bart' instead of 'Hello World' for the first <geant> invokation. The second <geant>
	invocation creates a new process and all variables vanish. Thats why you see 'Hello world'
	instead of 'Hello Bart'.
	The current behaviour results from the fact that variables are held globally inside of geant.
	This will certainly change in the future where variables will be project bound. <geant> will
	be able to take arguments which can be passed to the called build project exactly like you
	can do it on the commandline already.


depends/01:
Demonstrates the depends attribute of targets.

cd to examples/depends

	buildfile 01.eant:

		<project name="depends_demo" default="C" >
			<target name="A" >
				<echo message="A" />
			</target>
			<target name="B" depends="A" >
				<echo message="B" />
			</target>
			<target name="C" depends="B" >
				<echo message="C" />
			</target>
		</project>

	call:

		geant -b depends1.eant

	output:

		A:
		
		  [echo] A
		
		B:
		
		  [echo] B
		
		C:
		
		  [echo] C


	With the 'depends' XML attribute targets can be made dependent on each other. In the
	example target 'C' is dependent on target 'B'. This means that target 'B' will be executed
	before target 'C' is executed. It is possible to specify more than one target dependencies
	using comma separated target names in the 'depends' attribute:

			<target name="C" depends="B,A" >
				<echo message="C" />
			</target>

	This means that target 'B' is executed first, then target 'A' and then target 'C'.

gexace:
Demonstrates how to compile an Eiffel program. It builds on the 'gexace' tool which will
be the 'gobo way' to compile an Eiffel program.

cd to examples/gexace.

	buildfile build.eant:

		<project name="geant" default="compile">
			<target name="init">
				<var name="system" value="hello" />
			</target>
			<target name="compile" description="compiles HELLO" depends="init">
				<gexace
					command="build"
					command_options="se"
					xace_filename="${system}.xace"
					compile="true"
				/>
			</target>
			<target name="run" description="executes example" depends="init">
				<exec executable="${system}" />
			</target>
			<target name="clean" description="deletes generated files" depends="init">
				<exec executable="clean ${system}" />
			</target>
		</project>

	call:

		geant

		Note: Since the default target of the project is 'compile' this starts the build
				process with the 'compile' target. Currently only SmallEiffel is used !
				And since the name of the buildfile is 'build.eant' we do not have to
				provide the -b option on the commandline.

	output:

		init:
		
		
		compile:
		
		gexace
		  [gexace] gexace  --build --se hello.xace
		  [gexace] compile se.ace

	This calls the gexace tool which generates a SmallEiffel ace file and which will be
	compiled immediately since we provided the 'compile="true"' attribute.
	Note: 'gexace' will not be described here since it's documentation can be found in (TBD!!).

	Now we could simply invoke the hello program from the commandline but since this would be
	too easy simply invoke 'geant run' which produces the following output:

		init:
		
		
		run:
		
		  [exec] hello
		Hello World

	The clean target ('geant clean') is more useful:

		init:
		
		
		clean:
		
		  [exec] clean hello
		  [exec] del hello.exe se.ace cecil.se *.bak

	Note: the 'del' command is windows specific. In future os independent special tasks
		will be provided like <del>.




condidional/if,unless:
Demonstrates the optional 'if' and 'unless' XML attributes of targets.

cd to examples/conditional.

	buildfile if1.eant:

		<project name="if_demo" default="C" >
			<target name="A" if="runa" >
				<echo message="A" />
			</target>
			<target name="B" if="runb" >
				<echo message="B" />
			</target>
			<target name="C" depends="A,B" >
				<echo message="C" />
			</target>
		</project>

	call:

		geant -b if1.eant

	output:

		A:
		
		
		B:
		
		
		C:
		
		  [echo] C


	As values of the 'if' and 'unless' XML attributes of target elements you can use
	variable values and environmentvariables. The '${}' syntax is not used for these
	attributes since we do not want to evaluate the variables but only check if they
	are defined. This means the 'if' attribute returns true if the variable is defined
	otherwise true. The value of the variable does not matter. The same is true for
	'unless' except that it returns true if it is not defined.

	Since the variables 'runa' and 'runb' are not defined target 'A' and target 'B' do
	not produce any output.

	If we call it like this:

	call:

		geant -b if1.eant -Druna=any_value_you_like

	we get the following

	output:

		A:
		
		  [echo] A
		
		B:
		
		
		C:
		
		  [echo] C

	If we call it like this:

	call:

		geant -b if1.eant -Druna=any_value_you_like -Drunb=another_value_you_like

	we get the following

	output:

		A:
		
		  [echo] A
		
		B:
		
		  [echo] B
		
		C:
		
		  [echo] C

	As you can see the if's return true and targets 'A' respectively 'B' get executed.


	The file unless1.eant contains the same examples but the if's have been replaced with unless's.

condidional/if2:
Demonstrates how we can use 'if' and 'unless' to create a os independent buildfile.

cd to examples/conditional.

	buildfile if2.eant:

		<project name="if_demo" default="list" >
			<target name="list_for_windows" if="env.windir" >
				<exec executable="dir" />
			</target>
			<target name="list_for_unix" unless="env.windir" >
				<exec executable="ls -l" />
			</target>
			<target name="list" depends="list_for_windows,list_for_unix" >
			</target>
		</project>

	call:

		geant -b if2.eant

	output (windows):

		list_for_windows:
		
		  [exec] dir
		 Volume in drive D has no label.
		 Volume Serial Number is 72CB-0D64
		
		 Directory of D:\cvsstuff\gobo-eiffel\gobo\example\geant\conditional
		
		07/20/01  08:06p        <DIR>          .
		07/20/01  08:06p        <DIR>          ..
		07/20/01  07:13p                   264 if1.eant
		07/20/01  08:04p                   328 if2.eant
		07/20/01  08:03p                   611 if3.eant
		07/20/01  07:45p                   272 unless1.eant
		               6 File(s)          1,475 bytes
		                          2,103,660,544 bytes free
		
		list_for_unix:
		
		
		list:

	output (unix):

		list_for_windows:
		
		
		list_for_unix:
		
		  [exec] ls -l
		    D:\cvsstuff\gobo-eiffel\gobo\example\geant\conditional\*.*
		--a--       264 Fri Jul 20 19:13:51 2001 if1.eant
		--a--       328 Fri Jul 20 20:04:55 2001 if2.eant
		--a--       611 Fri Jul 20 20:03:19 2001 if3.eant
		--a--       272 Fri Jul 20 19:45:30 2001 unless1.eant
		    1475 (1475) bytes in 4 files
		
		list:


	Note: for simplicity we assume here that if a environmentvariable 'windir' exists
		that we are in a windows environment. Otherwise we are on unix. This should
		be ok for most situations.

	File if3.eant basically has the same behaviour but introduces an additional abstraction
	layer by introducing some variables defining the operating system:

		<project name="if_demo" default="list" >
			<target name="windows" if="env.windir" >
				<var name="os.windows" value="true" />
			</target>
			<target name="unix" unless="env.windir" >
				<var name="os.unix" value="true" />
			</target>
			<target name="init" depends="windows,unix" >
			</target>
			<target name="list_for_windows" depends="init" if="os.windows" >
				<exec executable="dir" />
			</target>
			<target name="list_for_unix" depends="init"  if="os.unix" >
				<exec executable="ls -l" />
			</target>
			<target name="list" depends="list_for_windows,list_for_unix" >
			</target>
		</project>


