indexing

	description:

		"Shared access to singleton global order comparer"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SHARED_GLOBAL_ORDER_COMPARER

feature -- Access

	Global_order_comparer: XM_XPATH_GLOBAL_ORDER_COMPARER is
			-- Shared singleton instance
		once
			create Result
		end
	
end
	
