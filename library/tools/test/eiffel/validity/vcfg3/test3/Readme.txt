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
DD [like name], but 'like name' is not only made up of class
names nor names of formal generic parameters. Validity VCFG-3
is violated. Furthermore `name' is not the final name of a
feature in class CC.
----------------------------------------------------------------------


TEST RESULTS:
----------------------------------------------------------------------
ISE Eiffel 5.0.016:    OK
SmallEiffel -0.76:     PASSED    Does not report VCFG-3 but reports the
                                 fact that `name' is not the final name
                                 of a feature in class CC.
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
			if b.item /= Void then
				print (b.item.item)
			end
		end

end -- class AA
----------------------------------------------------------------------
class BB

inherit

	CC [DD [STRING]]

end -- class BB
----------------------------------------------------------------------
class CC [G -> DD [like name]]

feature

	item: G

end -- class CC
----------------------------------------------------------------------
class DD [G]

feature 

	item: G

end -- class DD
----------------------------------------------------------------------
