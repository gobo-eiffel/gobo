VALIDITY VTCT

ETL2 p.199 and ETR p.45:
----------------------------------------------------------------------
Class Type rule

An Identifier CC is valid as the Class_name part of a Class_type if
and only if it is the name of a class in the surrounding universe.
----------------------------------------------------------------------


TEST DESCRIPTION:
----------------------------------------------------------------------
Class AA implicitly inherits from ANY, but ANY is not the name of
a class in the surrounding universe. Validity VTCT is violated.
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
		do
		end

end -- class AA
----------------------------------------------------------------------
