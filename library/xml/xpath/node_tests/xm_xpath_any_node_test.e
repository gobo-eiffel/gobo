indexing

	description:

		"Objects that test for a match against any node"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ANY_NODE_TEST

inherit

	XM_XPATH_NODE_TEST
		redefine
			super_type, matches_item
		end

	XM_XPATH_SHARED_ANY_ITEM_TYPE

creation {XM_XPATH_SHARED_ANY_NODE_TEST}

	make

feature {NONE} -- Initialization

	make is
		do
			original_text := "node()"
		end
	
feature -- Access

	matches_item (an_item: XM_XPATH_ITEM): BOOLEAN is
			-- Does `an_item' conform to `Current'?
		local
			a_node: XM_XPATH_NODE
		do
			a_node ?= an_item
			Result := a_node /= Void
		end

	super_type: XM_XPATH_ITEM_TYPE is
			-- Type from which this item type is derived by restriction
		do
			Result := any_item
		end

	node_kind_mask: INTEGER is
			-- Mask of types of nodes matched
		do
			Result := 1 |<< Element_node | 1 |<< Attribute_node | 1 |<< Document_node |
			1 |<< Text_node | 1 |<< Comment_node | 1 |<< Processing_instruction_node | 1 |<< Namespace_node
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
