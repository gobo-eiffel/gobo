indexing

	description:

		"Eiffel inspect choices which appear in a comma-separated list of choices"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_CHOICE_ITEM

inherit

	ET_AST_NODE

creation

	make

feature {NONE} -- Initialization

	make (a_choice: like choice) is
			-- Create a new choice item.
		require
			a_choice_not_void: a_choice /= Void
		do
			choice := a_choice
		ensure
			choice_set: choice = a_choice
		end

feature -- Access

	choice: ET_CHOICE
			-- Inspect choice

	comma: ET_SYMBOL
			-- Comma separator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := choice.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if comma /= Void then
				Result := comma.break
			else
				Result := choice.break
			end
		end

feature -- Setting

	set_comma (a_comma: like comma) is
			-- Set `comma' to `a_comma'.
		do
			comma := a_comma
		ensure
			comma_set: comma = a_comma
		end

invariant

	choice_not_void: choice /= Void

end -- class ET_CHOICE_ITEM
