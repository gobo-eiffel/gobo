indexing

	description:

		"Pure XPath implementation of the any-node-test pattern"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ANY_NODE_TEST

inherit

	XM_XPATH_NODE_TEST

creation

	make

feature {NONE} -- Initialization

	make is
		do
			original_text := "node()"
		end
	
feature -- Status report

	-- Not sure if this next feature is needed

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
