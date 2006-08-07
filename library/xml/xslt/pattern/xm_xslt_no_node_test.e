indexing

	description:

		"XSLT patterns that matches no node at all"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_NO_NODE_TEST

inherit

	XM_XSLT_NODE_TEST
		undefine
			is_no_node_test
		redefine
			default_priority, matches
		end
	
	XM_XPATH_NO_NODE_TEST
		rename
			make as make_xpath
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			initialize_dependencies
			system_id := ""
			line_number := -1
			make_xpath
		end

feature -- Access

		frozen default_priority: MA_DECIMAL is
			--  Determine the default priority to use if this pattern appears as a match pattern for a template with no explicit priority attribute.
		do
			create Result.make_from_string ("-0.5")
		end

feature -- Matching

	frozen matches (a_node: XM_XPATH_NODE; a_context: XM_XSLT_EVALUATION_CONTEXT): BOOLEAN is
			-- Determine whether this Pattern matches the given Node;
		do
			Result := False
		end

end
	
