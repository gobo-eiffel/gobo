indexing

	description:

		"Eiffel assertions followed by a semicolon"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_ASSERTION_SEMICOLON

inherit

	ET_ASSERTION_ITEM

creation

	make

feature {NONE} -- Initialization

	make (an_assertion: like assertion_item; a_semicolon: like semicolon) is
			-- Create a new assertion-semicolon.
		require
			an_assertion_not_void: an_assertion /= Void
			a_semicolon_not_void: a_semicolon /= Void
		do
			assertion_item := an_assertion
			semicolon := a_semicolon
		ensure
			assertion_item_set: assertion_item = an_assertion
			semicolon_set: semicolon = a_semicolon
		end

feature -- Access

	assertion_item: ET_ASSERTION
			-- Assertion in list of assertions

	semicolon: ET_SYMBOL
			-- Semicolon separator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := assertion_item.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := semicolon.break
		end

invariant

	semicolon_not_void: semicolon /= Void

end -- class ET_ASSERTION_SEMICOLON
