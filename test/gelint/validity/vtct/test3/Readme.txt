VALIDITY VTCT

ETL2 p.199 and ETR p.45:
----------------------------------------------------------------------
Class Type rule

An Identifier CC is valid as the Class_name part of a Class_type if
and only if it is the name of a class in the surrounding universe.
----------------------------------------------------------------------


TEST DESCRIPTION:
----------------------------------------------------------------------
Class BB inherits from CC [DD], but DD is not the name of a class
in the surrounding universe. Validity VTCT is violated.
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

	CC [DD]

feature

	f is
		do
			print (item)
		end

end -- class BB
----------------------------------------------------------------------
class CC [G]

feature

	item: G

end -- class CC
----------------------------------------------------------------------
