indexing

	description:

		"XPath value comparisons"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_VALUE_COMPARISON

inherit

	XM_XPATH_BINARY_EXPRESSION
	
creation

	make

feature -- Access

		item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			-- TODO
		end
end
	
