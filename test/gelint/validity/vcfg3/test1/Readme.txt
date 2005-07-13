VALIDITY VCFG

ETL2 p.52:
----------------------------------------------------------------------
A Formal_generics part of a Class_declaration is valid if and only
if every Formal_generic_name G appearing in it satisfies the following
two conditions:
1. G is different from the name of any class in the surrounding
   universe.
2. G is different from any other Formal_generic_name appearing in
   the same Formal_generics part.
----------------------------------------------------------------------

ETR p.16:
----------------------------------------------------------------------
A Formal_generics part of a Class_declaration is valid if and only
if every Formal_generic_name G appearing in it satisfies the following
three conditions:
1. G is different from the name of any class in the surrounding
   universe.
2. G is different from any other Formal_generic_name appearing in
   the same Formal_generics part.
3. If a Constraint is given, it does not involve any types other than
   class names and formal generic parameters other than G itself.
----------------------------------------------------------------------


TEST DESCRIPTION:
----------------------------------------------------------------------
The constraint of the formal generic parameter of class CC is
DD [like Current], but 'like Current' is not only made up of
class names nor names of formal generic parameters. Validity
VCFG-3 is violated.
----------------------------------------------------------------------


TEST RESULTS:
----------------------------------------------------------------------
ISE Eiffel 5.0.016:    OK
SmallEiffel -0.76:     PASSED    Does not report VCFG-3 and considers
                                 that DD [BB] conforms to 'like Current'
                                 in class BB.
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
			b.f
			print (b.item.generating_type)
		end

end -- class AA
----------------------------------------------------------------------
class BB

inherit

	CC [DD [BB]]

feature

	f is
		local
			d: DD [BB]
		do
			!! d
			item := d
		end

end -- class BB
----------------------------------------------------------------------
class CC [G -> DD [like Current]]

feature

	item: G

end -- class CC
----------------------------------------------------------------------
class DD [G]

feature 

	item: G

end -- class DD
----------------------------------------------------------------------
