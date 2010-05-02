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
The Redefine subclause of parent CC in class BB lists twice the
same feature name `f'. Furthermore `f' is not the final name of
a feature in CC. Validities VDRS-1 and VDRS-3 are violated.
----------------------------------------------------------------------


TEST RESULTS:
----------------------------------------------------------------------
ISE Eiffel 5.0.016:    OK        Reports only VDRS-3.
SmallEiffel -0.76:     OK        Reports only VDRS-3.
Halstenbach 3.2:       OK        Reports only VDRS-3.
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
			b.f
		end

end -- class AA
----------------------------------------------------------------------
class BB

inherit

	CC
		redefine
			f, f
		end

end -- class BB
----------------------------------------------------------------------
class CC

end -- class CC
----------------------------------------------------------------------
