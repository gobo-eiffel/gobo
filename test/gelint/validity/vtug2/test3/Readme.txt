VALIDITY VTUG

ETL2 p.201:
----------------------------------------------------------------------
Unconstrained Genericity rule

Let C be an unconstrained generic class. A Class_type CT having C as
base class is valid if and only if it satisfies the following two
conditions:
1. C is a generic class.
2. The number of Type components in CT's Actual_generics list is
   the same as the number of Formal_generic parameters in the
   Formal_generic_list of C's declaration.
----------------------------------------------------------------------

ETR p.46:
----------------------------------------------------------------------
Unconstrained Genericity rule

Let CT be a Class_type having a non-empty Actual_generics part, whose
base class C is not a constrained generic class. CT is valid if and
only if C satisfies the following two conditions:
1. C is a generic class.
2. The number of Type components in CT's Actual_generics list is
   the same as the number of Formal_generic parameters in the
   Formal_generic_list of C's declaration.
----------------------------------------------------------------------


TEST DESCRIPTION:
----------------------------------------------------------------------
Class BB inherits from CC [ANY], but CC has two formal generic
parameters. Validity VTUG-2 is violated.
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

	CC [ANY]

end -- class BB
----------------------------------------------------------------------
class CC [G, H]

feature

	item: G

end -- class CC
----------------------------------------------------------------------
