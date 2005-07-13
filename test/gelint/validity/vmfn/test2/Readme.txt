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
Class BB inherits the effective CC.f and introduces another effective
feature with the same name. Validity VMFN is violated.
----------------------------------------------------------------------


TEST RESULTS:
----------------------------------------------------------------------
ISE Eiffel 5.0.016:    OK
SmallEiffel -0.76:     PASSED    Does not report VMFN but reports
                                 VDRD-4.
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
			print ("AA%N")
		end

end -- class AA
----------------------------------------------------------------------
class BB

inherit

	CC

feature

	f is
		do
			print ("BB%N")
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
