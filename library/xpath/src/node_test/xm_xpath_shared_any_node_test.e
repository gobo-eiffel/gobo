note

	description:

		"Singleton object that matches against any node"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_SHARED_ANY_NODE_TEST

feature -- Access

	any_node_test: XM_XPATH_ANY_NODE_TEST
			-- Singleton
		once
			create Result.make
		end

end
