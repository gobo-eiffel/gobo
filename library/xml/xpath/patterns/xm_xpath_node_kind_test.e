indexing

	description:

		"XPath pattern that matches a particular node kind"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NODE_KIND_TEST

inherit

	XM_XPATH_NODE_TEST

	XM_XPATH_TYPE

creation

	make

feature -- Initialization

	make (node_type: INTEGER) is
			-- Establish invariant
		require
			valid_node_type: is_node_type (node_type)
		do
			kind := node_type
		ensure
			kind_set: kind = node_type
		end

feature -- Status report

	allows_text_nodes: BOOLEAN is
			-- Does this node test allow text nodes?
		do
			Result := kind = Text_node
		end

feature {NONE} -- Implementation

	kind: INTEGER
			--  The kind of node alllowed by this test

invariant
	valid_node_type: is_node_type (kind)

end
	
