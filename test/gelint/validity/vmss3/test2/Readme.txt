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
The Select subclause of parent DD in class BB lists `f'. `f' is
renamed from DD.g, and there is not two or more potential versions
of this feature in BB. However `f' is also inherited fron CC and
there is two potential versions in BB: `f' (implementation of
DD.g merged with CC.f) and `g' (implementation of DD.f which itself
inherits from CC.f). The Select subclause is hence necessary.
Validity VMSS-3 is not violated.
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
			b.g
		end

end -- class AA
----------------------------------------------------------------------
class BB

inherit

	CC

	DD
		rename
			f as g,
			g as f
		select
			f
		end

end -- class BB
----------------------------------------------------------------------
deferred class CC

feature

	f is
		deferred
		end

end -- class CC
----------------------------------------------------------------------
class DD

inherit

	CC

feature

	f is
		do
			print ("DD.f%N")
		end

	g is
		do
			print ("DD.g%N")
		end

end -- class DD
----------------------------------------------------------------------
