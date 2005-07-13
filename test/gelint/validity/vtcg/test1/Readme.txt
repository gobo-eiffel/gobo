VALIDITY VTCG

ETL2 p.203:
----------------------------------------------------------------------
Constrained Genericity rule

Let C be a constrained generic class. A Class_type CT having C as
base class is valid if and only if CT satisfies the Unconstrained
Genericity rule (VTUG, page 201) and, in addition:
3. For any Formal_generic parameter in the declaration of C having
   a constraint of the form -> D, the corresponding Type in the
   Actual_generics list of CT conforms to D.
----------------------------------------------------------------------

ETR p.46:
----------------------------------------------------------------------
Constrained Genericity rule

Let C be a constrained generic class. A Class_type CT having C as
base class is valid if and only if CT satisfies the two conditions
of the Unconstrained Genericity rule (VTUG, page 201) and, in
addition:
1. For any Formal_generic parameter in the declaration of C having
   a constraint of the form -> D, the corresponding Type in the
   Actual_generics list of CT conforms to D.
----------------------------------------------------------------------


TEST DESCRIPTION:
----------------------------------------------------------------------
Class BB inherits from CC [DD], but DD does not conform to EE.
Validity VTCG is violated.
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

	make is
		local
			b: BB
		do
			!! b
			print (b.item)
		end

end -- class AA
----------------------------------------------------------------------
class BB

inherit

	CC [DD]

end -- class BB
----------------------------------------------------------------------
class CC [G -> EE]

feature

	item: G

end -- class CC
----------------------------------------------------------------------
class DD

end -- class DD
----------------------------------------------------------------------
class EE

end -- class EE
----------------------------------------------------------------------
