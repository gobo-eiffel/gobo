indexing

	description:

		"Pure XPath implementation of the node-kind-test pattern"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NODE_KIND_TEST

inherit

	XM_XPATH_NODE_TEST
		redefine
			item_type
		end

creation

	make

feature {NONE} -- Initialization

	make (a_node_type: INTEGER) is
			-- Establish invariant
		require
			valid_node_type: is_node_type (a_node_type)
		do
			kind := a_node_type
			inspect
				kind
			when Document_node then
				original_text := "/"
			when Element_node, Attribute_node then
				original_text := "*"
			when Comment_node then
				original_text := "comment()"
			when Text_node then
				original_text := "text()"
			when Namespace_node then
				original_text := "namespace()"
			when Processing_instruction_node then
				original_text := "processing-instruction()"
			end
		ensure
			kind_set: kind = a_node_type
		end

feature -- Access

	item_type: INTEGER is
			-- Types of node to which this pattern applies
		do
			Result := kind
		end

feature -- Status report

	allows_text_nodes: BOOLEAN is
			-- Does this node test allow text nodes?
		do
			Result := kind = Text_node
		end

feature -- Matching

	matches_node (a_node_kind: INTEGER; a_fingerprint: INTEGER; a_node_type: INTEGER): BOOLEAN is
			-- Is this node test satisfied by a given node?
		do
			Result := kind = a_node_kind
		end	

feature {NONE} -- Implementation

	kind: INTEGER
			--  The kind of node alllowed by this test

invariant
	valid_node_type: is_node_type (kind)

end
