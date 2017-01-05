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
CC is '-> G'. Validity VCFG-3 is violated. Note that the compiler
should actually report a syntax error since 'G' is not a Class_type
but a Formal_generic_name.
----------------------------------------------------------------------


TEST RESULTS:
----------------------------------------------------------------------
ISE Eiffel 5.0.016:    FAILED    Does not report VCFG-3 and enters
                                 into an infinite loop when processing
                                 class CC in Degree 3.
SmallEiffel -0.76:     FAILED    Does not report VCFG-3 but complains
                                 that class G is not in the universe.
Halstenbach 3.2:       FAILED    Does not report VCFG-3 but reports
                                 a violation of VTCT (i.e. class G
                                 not in universe).
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
			print (b.item1)
			print (b.item2)
			b.f
		end

end -- class AA
----------------------------------------------------------------------
class BB

inherit

	CC [ANY, ANY]

feature

	g
		do
			item1 := "gobo1"
			item2 := "gobo2"
		end

end -- class BB
----------------------------------------------------------------------
class CC [G -> G, H]

feature

	item1: G
	item2: H

	f
		do
			if item1 /= Void then
				print (item1.generating_type)
			end
		end

end -- class CC
----------------------------------------------------------------------
