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
The constraint of the first formal generic parameter G of class
CC is '-> DD [H]'. Validity VCFG-3 is not violated.
----------------------------------------------------------------------


TEST RESULTS:
----------------------------------------------------------------------
ISE Eiffel 5.0.016:    FAILED    Reports a violation of VTCT (i.e.
                                 class H not in universe).
SmallEiffel -0.76:     OK
Halstenbach 3.2:       FAILED    Reports a violation of VTCT (i.e.
                                 class H not in universe).
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
			b.g
			print (b.item1.generator)
			print (b.item2.generator)
			b.f
		end

end -- class AA
----------------------------------------------------------------------
class BB

inherit

	CC [DD [EE], EE]

feature

	g
		local
			e: EE
			d: DD [EE]
		do
			!! d
			item1 := d
			!! e
			item2 := e
		end

end -- class BB
----------------------------------------------------------------------
class CC [G -> DD [H], H]

feature

	item1: G
	item2: H

	f
		do
			if item2 /= Void and item1 /= Void then
				item1.put (item2)
				print (item1.item.generator)
			end
		end

end -- class CC
----------------------------------------------------------------------
class DD [G]

feature

	item: G

	put (v: G)
		do
			item := v
		end

end -- class DD
----------------------------------------------------------------------
class EE

end -- class EE
----------------------------------------------------------------------
