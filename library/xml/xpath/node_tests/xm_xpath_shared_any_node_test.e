indexing

	description:

		"Singleton object that matches against any node"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SHARED_ANY_NODE_TEST

feature -- Access

	any_node_test: XM_XPATH_ANY_NODE_TEST is
			-- Singleton
		once
			create Result.make
		end

end
