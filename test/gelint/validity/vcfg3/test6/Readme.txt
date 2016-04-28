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
The constraint of the second formal generic parameter H of class
CC is '-> G'. Validity VCFG-3 is not violated. Note that the compiler
should actually report a syntax error since 'G' is not a Class_type
but a Formal_generic_name.
----------------------------------------------------------------------


TEST RESULTS:
----------------------------------------------------------------------
ISE Eiffel 5.0.016:    FAILED    Compiler crash on class CC in Degree 3.
SmallEiffel -0.76:     PASSED    Executes as expected but does not
                                 report that G is not a Class_type.
Halstenbach 3.2:       FAILED    Compiler crash on class CC in Degree 2.
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

	CC [DD, EE]

feature

	g
		local
			d: DD
			e: EE
		do
			!! d
			item1 := d
			!! e
			item2 := e
		end

end -- class BB
----------------------------------------------------------------------
class CC [G, H -> G]

feature

	item1: G
	item2: H

	f
		do
			if item2 /= Void then
				print (item2.generating_type)
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
