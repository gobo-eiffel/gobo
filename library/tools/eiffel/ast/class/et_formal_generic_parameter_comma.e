indexing

	description:

		"Eiffel formal generic parameters followed by a comma"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_FORMAL_GENERIC_PARAMETER_COMMA

inherit

	ET_FORMAL_GENERIC_PARAMETER_ITEM

creation

	make

feature {NONE} -- Initialization

	make (a_formal: like formal_generic_parameter_item; a_comma: like comma) is
			-- Create a new formal_generic_parameter-comma.
		require
			a_formal_not_void: a_formal /= Void
			a_comma_not_void: a_comma /= Void
		do
			formal_generic_parameter_item := a_formal
			comma := a_comma
		ensure
			formal_generic_parameter_item_set: formal_generic_parameter_item = a_formal
			comma_set: comma = a_comma
		end

feature -- Access

	formal_generic_parameter_item: ET_FORMAL_GENERIC_PARAMETER
			-- Formal generic parameter in comma-separated list

	comma: ET_SYMBOL
			-- Comma separator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := formal_generic_parameter_item.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := comma.break
		end

invariant

	comma_not_void: comma /= Void

end -- class ET_FORMAL_GENERIC_PARAMETER_COMMA
