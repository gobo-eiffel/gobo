indexing

	description:

		"Objects that test for a match against any node"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ANY_NODE_TEST

inherit

	XM_XPATH_NODE_TEST
		redefine
			super_type, matches_item
		end

	XM_XPATH_SHARED_ANY_ITEM_TYPE
		export {NONE} all end

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

create {XM_XPATH_SHARED_ANY_NODE_TEST}

	make

feature {NONE} -- Initialization

	make is
		do
			original_text := "node()"
		end
	
feature -- Access

	matches_item (a_item: XM_XPATH_ITEM; a_treat_uri_as_string: BOOLEAN): BOOLEAN is
			-- Does `a_item' conform to `Current'?
		do
			Result := a_item.is_node
		end

	super_type: XM_XPATH_ITEM_TYPE is
			-- Type from which this item type is derived by restriction
		do
			Result := any_item
		end

	node_kind_mask: INTEGER is
			-- Mask of types of nodes matched
		do
			Result := INTEGER_.bit_or (INTEGER_.bit_shift_left (1, Element_node), INTEGER_.bit_shift_left (1, Attribute_node))
			Result := INTEGER_.bit_or (Result, INTEGER_.bit_shift_left (1, Document_node))
			Result := INTEGER_.bit_or (Result, INTEGER_.bit_shift_left (1, Text_node))
			Result := INTEGER_.bit_or (Result, INTEGER_.bit_shift_left (1, Comment_node))
			Result := INTEGER_.bit_or (Result, INTEGER_.bit_shift_left (1, Processing_instruction_node))
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
