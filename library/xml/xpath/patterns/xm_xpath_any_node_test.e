indexing

	description:

		"XSLT patterns that matches any node"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ANY_NODE_TEST

inherit

	XM_XPATH_NODE_TEST
		redefine
			default_priority
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
	
feature -- Status report

	allows_text_nodes: BOOLEAN is
			-- Does this node test allow text nodes?
		do
			Result := True
		end

feature -- Matching

	matches_node (a_node_kind: INTEGER; a_fingerprint: INTEGER; a_node_type: INTEGER): BOOLEAN is
			-- Is this node test satisfied by a given node?
		do
			Result := True
		end	

end
	
