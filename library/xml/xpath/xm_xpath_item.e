indexing

	description:

		"XPath item - a member of a sequence"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_ITEM

feature -- Access

	string_value: STRING is
			--Value of the item as a string
		deferred
		end

	type: INTEGER is
		-- Type 
		deferred
		end
	
	typed_value: XM_XPATH_VALUE is
			-- Typed value
		deferred
		end
	
end
	
