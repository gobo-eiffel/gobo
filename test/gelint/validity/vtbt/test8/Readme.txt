VALIDITY VTBT

ETL2 p.210 and ETR p.47:
----------------------------------------------------------------------
A Bit_type declaration is valid if and only of its Constant is of
type INTEGER, and has a positive value.
----------------------------------------------------------------------


TEST DESCRIPTION:
----------------------------------------------------------------------
Class BB inherits from CC [DD [BIT -32]], but '-32' is not a positive
value. Validity VTBT is violated.
----------------------------------------------------------------------


TEST RESULTS:
----------------------------------------------------------------------
ISE Eiffel 5.0.016:    FAILED    Compiler crash in Degree -1.
SmallEiffel -0.76:     OK        The error message doesn't state that
                                 the constant should be positive.
Halstenbach 3.2:       FAILED    Compiler crash in Degree -1.
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
			print (b.item.item.count)
		end

end -- class AA
----------------------------------------------------------------------
class BB

inherit

	CC [DD [BIT -32]]

feature

	f is
		do
			!! item
		end

end -- class BB
----------------------------------------------------------------------
class CC [G]

feature

	item: G

end -- class CC
----------------------------------------------------------------------
class DD [G]

feature

	item: G

end -- class DD
----------------------------------------------------------------------
