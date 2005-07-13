VALIDITY VMSS

ETL2 p.192:
----------------------------------------------------------------------
Select Subclause rule

A Select subclause appearing in the Parent part for a class B in
class D is valid if and only if, for every Feature_identifier
fname in its Feature_list, fname is the final name in D of a 
feature that has two or more potential versions in D, and fname
appears only once in the Feature_list.
----------------------------------------------------------------------

ETR p.44:
----------------------------------------------------------------------
Select Subclause rule

A Select subclause appearing in the Parent part for a class B in
class D is valid if and only if, for every Feature_name fname in
its Feature_list, fname is the final name in D of a feature that
has two or more potential versions in D, and fname appears only
once in the Feature_list.
----------------------------------------------------------------------


TEST DESCRIPTION:
----------------------------------------------------------------------
The Select subclause of parent CC1 in class BB lists twice the same
feature name `f'. Validity VMSS-2 is violated.
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
			b.f
			b.f2
		end

end -- class AA
----------------------------------------------------------------------
class BB

inherit

	CC1
		select
			f, f
		end

	CC2
		rename
			f as f2
		end

end -- class BB
----------------------------------------------------------------------
class CC

feature

	f is
		do
			print ("CC%N")
		end

end -- class CC
----------------------------------------------------------------------
class CC1

inherit

	CC
		redefine
			f
		end

feature

	f is
		do
			print ("CC1%N")
		end

end -- class CC1
----------------------------------------------------------------------
class CC2

inherit

	CC
		redefine
			f
		end

feature

	f is
		do
			print ("CC2%N")
		end

end -- class CC2
----------------------------------------------------------------------
