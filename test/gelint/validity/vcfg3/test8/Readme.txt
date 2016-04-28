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
CC is '-> H'. Validity VCFG-3 is not violated. Note that the compiler
should actually report a syntax error since 'H' is not a Class_type
but a Formal_generic_name.
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

	CC [EE, DD]

feature

	g
		local
			d: DD
			e: EE
		do
			!! e
			item1 := e
			!! d
			item2 := d
		end

end -- class BB
----------------------------------------------------------------------
class CC [G -> H, H]

feature

	item1: G
	item2: H

	f
		do
			if item1 /= Void then
				print (item1.generator)
			end
		end

end -- class CC
----------------------------------------------------------------------
class DD

end -- class DD
----------------------------------------------------------------------
class EE

inherit

	DD

end -- class EE
----------------------------------------------------------------------
