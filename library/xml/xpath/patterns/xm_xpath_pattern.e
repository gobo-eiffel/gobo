indexing

	description:

		"XPath pattern"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_PATTERN

feature -- Access

	node_test: XM_XPATH_NODE_TEST is
			-- Retrieve an `XM_XPATH_NODE_TEST' that all nodes matching this pattern must satisfy
		deferred
		ensure
			non_void_test: Result /= Void
		end

end
	
