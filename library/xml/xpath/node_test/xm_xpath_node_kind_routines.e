indexing

	description:

		"Routines that test node kinds"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NODE_KIND_ROUTINES

inherit

	XM_XPATH_TYPE

	KL_IMPORTED_INTEGER_ROUTINES

feature -- Access

	string_kinds: INTEGER is
			-- Node kinds whose typed value is always string
		once
			Result := INTEGER_.bit_or (INTEGER_.bit_shift_left (1, Processing_instruction_node), INTEGER_.bit_shift_left (1, Comment_node))
		end

	untyped_kinds: INTEGER is
			-- Node kinds whose typed value is always untypedAtomic
		once
			Result := INTEGER_.bit_or (INTEGER_.bit_shift_left (1, Document_node), INTEGER_.bit_shift_left (1, Text_node))
		end

	untyped_if_untyped_kinds: INTEGER is
			-- Node kinds whose typed value is conditionally untypedAtomic
		once
			Result := INTEGER_.bit_or (INTEGER_.bit_shift_left (1, Document_node), INTEGER_.bit_shift_left (1, Text_node))
			Result := INTEGER_.bit_or (Result, INTEGER_.bit_shift_left (1, Element_node))
			Result := INTEGER_.bit_or (Result, INTEGER_.bit_shift_left (1, Attribute_node))
		end

end
