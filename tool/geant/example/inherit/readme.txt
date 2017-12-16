geant now supports a simple single inheritance mechanism:

A build file now can inherit the targets of another build
file by specifying the inherit attribute in the project element:

  <project name="B" inherit="a.eant">

build files which do not use the inherit attribute work like before.

You can find a demonstration of this new behaviour in

  $GOBO/tool/geant/example/inherit

which contains the two build files 'a.eant' and 'b.eant':

a.eant:
_____________________________________________________________
<?xml version="1.0" ?>

<project name="A">
	
	<target name="f1">
		<echo message="A.f1"/>
		<set name="var1" value="default_value1"/>
	</target>

	<target name="f2" depend="f1">
		<echo message="A.f2"/>
		<echo message="var1: ${var1}"/>
	</target>

</project>
_____________________________________________________________


b.eant:
_____________________________________________________________
<?xml version="1.0" ?>

<project name="B" inherit="a.eant">
	
	<target name="f1-">
		<echo message="B.f1"/>
		<set name="var1" value="value1"/>
	</target>

	<target name="f2-" depend="f1">
		<echo message="B.f2"/>
	</target>

	<target name="f3">
		<echo message="B.f3"/>
	</target>

</project>
_____________________________________________________________

If you invoke

  geant -v -b b.eant f3

you get the following output (almost like before):

_____________________________________________________________
  Loading Project's configuration from b.eant
  Loading Project's configuration from a.eant
  Building Project

  B.f3:

    [echo] B.f3
_____________________________________________________________

If you invoke

  geant -v -b b.eant f1

you get the following output:
_____________________________________________________________
  Loading Project's configuration from b.eant
  Loading Project's configuration from a.eant
  Building Project

  A.f1:

    [echo] A.f1
    [set] var1=default_value1
_____________________________________________________________

which demonstrates some inheritance behaviour.

Then

  geant -v -b b.eant f2

produces the following output:
_____________________________________________________________
  Loading Project's configuration from b.eant
  Loading Project's configuration from a.eant
  Building Project

  A.f1:

    [echo] A.f1
    [set] var1=default_value1

  A.f2:

    [echo] A.f2
    [echo] var1: default_value1
_____________________________________________________________


Now rename target 'f1-' in 'b.eant' to 'f1' and invoke

  geant -v -b b.eant f1

output:
_____________________________________________________________
  Loading Project's configuration from b.eant
  Loading Project's configuration from a.eant
  Building Project

  B.f1:

    [echo] B.f1
    [set] var1=value1
_____________________________________________________________

Invoke

  geant -v -b b.eant f2

output:
_____________________________________________________________
  Loading Project's configuration from b.eant
  Loading Project's configuration from a.eant
  Building Project

  B.f1:

    [echo] B.f1
    [set] var1=value1

  A.f2:

    [echo] A.f2
    [echo] var1: value1
_____________________________________________________________


Now rename target 'f1' in 'b.eant' back to 'f1-',
rename  'f2-' in 'b.eant' to 'f2', and invoke

  geant -v -b b.eant f2

output:
_____________________________________________________________
  Loading Project's configuration from b.eant
  Loading Project's configuration from a.eant
  Building Project

  A.f1:

    [echo] A.f1
    [set] var1=default_value1

  B.f2:

    [echo] B.f2
_____________________________________________________________

Maybe one day geant supports multiple inheritance and 'rename' and
'redefine' clauses like we are used to in Eiffel. Then the
'inherit' attribute will become a subelement of the project rather
than an attribute. The <precursor> task might be the next item on the
todo list.

- Sven

