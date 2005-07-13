VALIDITY VTBT

ETL2 p.210 and ETR p.47:
----------------------------------------------------------------------
A Bit_type declaration is valid if and only of its Constant is of
type INTEGER, and has a positive value.
----------------------------------------------------------------------


TEST DESCRIPTION:
----------------------------------------------------------------------
Class BB inherits from CC [BIT - 0]. '- 0' is equal to '0', which is
a positive value, so validity VTBT is not violated.
----------------------------------------------------------------------


TEST RESULTS:
----------------------------------------------------------------------
ISE Eiffel 5.0.016:    OK
SmallEiffel -0.76:     PASSED    '- 0' is not considered as a positive
                                 value, and hence VTBT is violated.
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
			print (b.item.count)
		end

end -- class AA
----------------------------------------------------------------------
class BB

inherit

	CC [BIT - 0]

end -- class BB
----------------------------------------------------------------------
class CC [G]

feature

	item: G

end -- class CC
----------------------------------------------------------------------
