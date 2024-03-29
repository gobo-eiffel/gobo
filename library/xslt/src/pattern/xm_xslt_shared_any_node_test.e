﻿note

	description:

		"Singleton XSLT pattern that matches any node"

	library: "Gobo Eiffel XXLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_SHARED_ANY_NODE_TEST

feature -- Access

	any_xslt_node_test: XM_XSLT_ANY_NODE_TEST
			-- Singleton
		once
			create Result.make
		end

end

