indexing

	description:

		"Eiffel inspect choices followed by a comma"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_CHOICE_COMMA

inherit

	ET_CHOICE_ITEM

creation

	make

feature {NONE} -- Initialization

	make (a_choice: like choice_item; a_comma: like comma) is
			-- Create a new choice-comma.
		require
			a_choice_not_void: a_choice /= Void
			a_comma_not_void: a_comma /= Void
		do
			choice_item := a_choice
			comma := a_comma
		ensure
			choice_item_set: choice_item = a_choice
			comma_set: comma = a_comma
		end

feature -- Access

	choice_item: ET_CHOICE
			-- Choice in comma-separated list

	comma: ET_SYMBOL
			-- Comma separator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := choice_item.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := comma.break
		end

invariant

	comma_not_void: comma /= Void

end -- class ET_CHOICE_COMMA
