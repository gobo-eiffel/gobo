indexing

	description:

	"XSLT patterns that matches any child node%
   %i.e. node() but not root, attribute or namespace nodes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_ANY_CHILD_NODE_PATTERN
	
inherit

	XM_XSLT_NODE_TEST
		redefine
			default_priority
		end

creation

	make

feature {NONE} -- Initialization

	make is
			-- Set original_text.
		do
			original_text := "child::node()"
		end

feature -- Access

	frozen default_priority: MA_DECIMAL is
			--  Determine the default priority to use if this pattern appears as a match pattern for a template with no explicit priority attribute.
		do
			create Result.make_from_string ("-0.5")
		end

	node_kind_mask: INTEGER is
			-- Mask of types of nodes matched
		do
			Result := 1 |<< Element_node | 1 |<< Comment_node | 1 |<< Text_node | 1 |<< Processing_instruction_node
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
			Result := a_node_kind = Element_node
				or else a_node_kind = Text_node
				or else a_node_kind = Comment_node
				or else a_node_kind = Processing_instruction_node
		end

end
	
