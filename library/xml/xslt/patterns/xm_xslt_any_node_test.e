indexing

	description:

		"XSLT patterns that matches any node"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_ANY_NODE_TEST

inherit

	XM_XSLT_NODE_TEST
		redefine
			default_priority
		end

	XM_XPATH_ANY_NODE_TEST
		undefine
			make
		end

creation

	make

feature {NONE} -- Initialization

	make is
		do
			original_text := "node()"
		end
	
feature -- Access

		frozen default_priority: DOUBLE is
			--  Determine the default priority to use if this pattern appears as a match pattern for a template with no explicit priority attribute.
		do
			Result := -0.5
		end
	
end
	
