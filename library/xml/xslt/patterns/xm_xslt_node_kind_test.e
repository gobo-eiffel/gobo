indexing

	description:

		"XSLT patterns that matches a particular node kind"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_NODE_KIND_TEST

inherit

	XM_XSLT_NODE_TEST
		undefine
			node_kind
		redefine
			default_priority
		end

	XM_XPATH_NODE_KIND_TEST
		undefine
			make
		end

creation

	make

feature {NONE} -- Initialization

	make (a_node_type: INTEGER) is
			-- Establish invariant
		do
			node_kind := a_node_type
		end

feature -- Access

		frozen default_priority: DOUBLE is
			--  Determine the default priority to use if this pattern appears as a match pattern for a template with no explicit priority attribute.
		do
			Result := -0.5
		end
	
end
	
