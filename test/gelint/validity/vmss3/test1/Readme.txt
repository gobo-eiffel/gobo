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
The Select subclause of parent CC in class BB lists `f' but this
feature has not two or more potential versions in BB.
Validity VMSS-3 is violated.
----------------------------------------------------------------------


TEST RESULTS:
----------------------------------------------------------------------
ISE Eiffel 5.0.016:    OK
SmallEiffel -0.76:     PASSED     Makes as if `f' was not listed in
                                  the Select subclause.
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
		end

end -- class AA
----------------------------------------------------------------------
class BB

inherit

	CC
		select
			f
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
