VALIDITY VDRS

ETL2 p.159, ETR p.37:
----------------------------------------------------------------------
Redefine Subclause rule

Consider a class C with a parent B. If a Parent part for B in C
contains a Redefine subclause, that clause is valid if and only
if every Feature_identifier fname that it lists (in its
Feature_list) satisfies the following conditions:
1. fname is the final name in C of a feature inherited from B.
2. That feature was not frozen, and was not a constant attribute.
3. fname appears only once in the Feature_list.
4. The Features part of C contains one Feature_declaration for
   fname, which is a valid redeclaration, but not an effecting,
   of the original feature.
----------------------------------------------------------------------


TEST DESCRIPTION:
----------------------------------------------------------------------
The Redefine subclause of parent CC in class BB lists `f', but
the redeclaration of `f' in BB is an effecting. Validity VDRS-4
is violated.
----------------------------------------------------------------------


TEST RESULTS:
----------------------------------------------------------------------
ISE Eiffel 5.0.016:    PASSED      Does not report VDRS-4 but handles
                                   the effecting correctly.
SmallEiffel -0.76:     PASSED      Does not report VDRS-4 but handles
                                   the effecting correctly.
Halstenbach 3.2:       PASSED      Does not report VDRS-4 but handles
                                   the effecting correctly.
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
		end

end -- class AA
----------------------------------------------------------------------
class BB

inherit

	CC
		redefine
			f
		end

feature

	f is
		do
			print ("BB%N")
		end

end -- class BB
----------------------------------------------------------------------
deferred class CC

feature

	f is
		deferred
		end

end -- class CC
----------------------------------------------------------------------
