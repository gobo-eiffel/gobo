note

	description:

		"Shared access to singleton global order comparer"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SHARED_GLOBAL_ORDER_COMPARER

feature -- Access

	global_order_comparer: XM_XPATH_GLOBAL_ORDER_COMPARER is
			-- Shared singleton instance
		once
			create Result
		end
	
end
	
