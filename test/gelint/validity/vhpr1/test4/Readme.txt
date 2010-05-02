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


TEST DESCRIPTION:
----------------------------------------------------------------------
Class BB inherits from CC [BB]. Although BB appears in its own
parent, it is not a descendant of itself, so validity VHPR-1 is
not violated.
----------------------------------------------------------------------


TEST RESULTS:
----------------------------------------------------------------------
ISE Eiffel 5.0.016:    OK
SmallEiffel -0.76:     OK
Halstenbach 3.2:       OK
gelint:                OK
----------------------------------------------------------------------


TEST CLASSES:
----------------------------------------------------------------------
class AA

create

	make

feature

	make
		local
			b: BB
		do
			!! b
			print ("Execution OK%N")
		end

end -- class AA
----------------------------------------------------------------------
class BB

inherit

	CC [BB]

end -- class BB
----------------------------------------------------------------------
class CC [G]

end -- class CC
----------------------------------------------------------------------
