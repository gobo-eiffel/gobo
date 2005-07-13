VALIDITY VMFN

ETL2 p.188:
----------------------------------------------------------------------
Feature Name rule

It is valid for a class C to introduce a feature with the
Feature_identifier fname, or to inherit a feature under the final
name fname, if and only if no other feature of C has that same
name.
----------------------------------------------------------------------

ETR p.42:
----------------------------------------------------------------------
Feature Name rule

It is valid for a class C to introduce a feature with the
Feature_name fname, or to inherit a feature under the final
name fname, if and only if no other feature of C has that same
name.
----------------------------------------------------------------------


TEST DESCRIPTION:
----------------------------------------------------------------------
Class BB inherits two effective features CC.f and DD.f with the
same name. Validity VMFN is violated.
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
		end

end -- class AA
----------------------------------------------------------------------
class BB

inherit

	CC
	DD

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
class DD

feature

	f is
		do
			print ("DD%N")
		end

end -- class DD
----------------------------------------------------------------------
