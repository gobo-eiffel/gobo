indexing

	description:

		"XPath range expressons"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_RANGE_EXPRESSION

inherit

	XM_XPATH_BINARY_EXPRESSION

creation

	make

feature -- Access

	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			-- TODO
			todo ("item-type", False)
		end

	lower_bound: XM_XPATH_EXPRESSION is
			-- Inclusive lower bound
		do
			Result := operands.item (1)
		end

	upper_bound: XM_XPATH_EXPRESSION is
			-- Inclusive upper bound
		do
			Result := operands.item (2)
		end
end
	
