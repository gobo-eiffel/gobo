note

	description:

	"XSLT patterns that matches any child node%
   % i.e. node() but not root, attribute or namespace nodes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_ANY_CHILD_NODE_PATTERN
	
inherit

	XM_XSLT_NODE_TEST
		redefine
			default_priority
		end

create

	make

feature {NONE} -- Initialization

	make (a_static_context: XM_XPATH_STATIC_CONTEXT) is
			-- Set original_text.
		require
			static_context_not_void: a_static_context /= Void
		do
			system_id := a_static_context.system_id
			line_number := a_static_context.line_number
			original_text := "child::node()"
			initialize_dependencies
		ensure
			system_id_set: STRING_.same_string (system_id, a_static_context.system_id)
			line_number_set: line_number = a_static_context.line_number
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
			Result := INTEGER_.bit_or (INTEGER_.bit_shift_left (1, Element_node), INTEGER_.bit_shift_left (1, Comment_node))
			Result := INTEGER_.bit_or (Result, INTEGER_.bit_shift_left (1, Text_node))
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
			Result := a_node_kind = Element_node
				or else a_node_kind = Text_node
				or else a_node_kind = Comment_node
				or else a_node_kind = Processing_instruction_node
		end

end
	
