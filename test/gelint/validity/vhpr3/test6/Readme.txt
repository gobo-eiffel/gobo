VALIDITY VHPR

ETL2 p.79 and ETR p.23:
----------------------------------------------------------------------
Parent Rule

The Inheritance clause of a class D is valid if and only if it meets
the following two conditions:
1. In every Parent clause for a class B, B is not a descendant of D.
2. If two or more Parent clauses are for classes which have a common
   ancestor A, D meets the conditions of the Repeated Inheritance
   Consistency constraint for A.
----------------------------------------------------------------------

ISE Eiffel:
----------------------------------------------------------------------
3. All types appearing in the Parent clauses are either class names
   or names of formal generic parameters of the class D.
----------------------------------------------------------------------


TEST DESCRIPTION:
----------------------------------------------------------------------
Class BB inherits from CC [DD [BIT name]], but 'BIT name' is not
only made up of class names nor names of formal generic parameters.
Validity VHPR-3 is violated. Furthermore `name' is not the final
name of a feature in class BB
----------------------------------------------------------------------


TEST RESULTS:
----------------------------------------------------------------------
ISE Eiffel 5.0.016:    FAILED    Does not report VHPR-3 nor the fact
                                 that `name' is not the final name of
                                 a feature in class BB, but the compiled
                                 program crashes during execution.
SmallEiffel -0.76:     PASSED    Does not report VHPR-3 but reports the
                                 fact that `name' is not the final name
                                 of a feature in class BB.
Halstenbach 3.2:       FAILED    Compiler crash in Degree 3.
gelint:                OK
----------------------------------------------------------------------


TEST CLASSES:
----------------------------------------------------------------------
class AA

create

	make

feature

	make is
		local
			b: BB
		do
			!! b
			b.f
			print (b.item.item.generating_type)
		end

end -- class AA
----------------------------------------------------------------------
class BB

inherit

	CC [DD [BIT name]]

feature

	f is
		do
			!! item
		end

end -- class BB
----------------------------------------------------------------------
class CC [G]

feature -- Access

	item: G

end -- class CC
----------------------------------------------------------------------
class DD [G]

feature 

	item: G

end -- class DD
----------------------------------------------------------------------
