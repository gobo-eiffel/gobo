indexing

	description:

		"Eiffel identifiers followed by a comma"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_IDENTIFIER_COMMA

inherit

	ET_LOCAL_NAME

creation

	make

feature {NONE} -- Initialization

	make (a_name: like identifier_item; a_comma: like comma) is
			-- Create a new identifier-comma.
		require
			a_name_not_void: a_name /= Void
			a_comma_not_void: a_comma /= Void
		do
			identifier_item := a_name
			comma := a_comma
		ensure
			identifier_item_set: identifier_item = a_name
			comma_set: comma = a_comma
		end

feature -- Access

	identifier_item: ET_IDENTIFIER
			-- Identifier

	comma: ET_SYMBOL
			-- Comma separator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := identifier_item.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := comma.break
		end

invariant

	comma_not_void: comma /= Void

end -- class ET_IDENTIFIER_COMMA
