indexing

	description:

		"TBA"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_COMPARISON_KEY

inherit

	HASHABLE

	XM_XPATH_DEBUGGING_ROUTINES

feature -- Access

	hash_code: INTEGER is
			-- Hash code value
		do
			todo ("hash_code", False)
		end

feature -- Comparison

	same_key (other: XM_XPATH_COMPARISON_KEY): BOOLEAN is
			-- Are `Current' and `other' the same comparison key?
		require
			other_not_void: other /= Void
		do
			todo ("same_key", False)
		end

end
	
