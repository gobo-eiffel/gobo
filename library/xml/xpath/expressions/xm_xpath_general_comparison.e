indexing

	description:

		"XPath general comparisons"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_GENERAL_COMPARISON

inherit

	XM_XPATH_BINARY_EXPRESSION
		redefine
			display_operator
		end

creation

	make

feature -- Access

		item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			-- TODO
		end

feature {NONE} -- Implementation

	display_operator: STRING is
			-- Format `operator' for display
		do
			Result := STRING_.appended_string ("many-to-many ", Precursor)
		end
	
end
	
