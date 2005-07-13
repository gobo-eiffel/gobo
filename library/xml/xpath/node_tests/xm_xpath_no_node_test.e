indexing

	description:

		"Objects that fail to match against any node"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NO_NODE_TEST

inherit

	XM_XPATH_NODE_TEST
		redefine
			is_no_node_test
		end

create {XM_XPATH_SHARED_NO_NODE_TEST}

	make

feature {NONE} -- Initialization

	make is
		do
			original_text := "void()"
		end

feature -- Access

	is_no_node_test: BOOLEAN is
			-- Is `Current' a no-node test?
		do
			Result := True
		end

	node_kind_mask: INTEGER is
			-- Mask of types of nodes matched
		do
			Result := 0
		end
	
feature -- Status report

	-- Not sure if this next feature is needed

	allows_text_nodes: BOOLEAN is
			-- Does this node test allow text nodes?
		do
			Result := False
		end

feature -- Matching

	matches_node (a_node_kind: INTEGER; a_fingerprint: INTEGER; a_node_type: INTEGER): BOOLEAN is
			-- Is this node test satisfied by a given node?
		do
			Result := False
		end

end
