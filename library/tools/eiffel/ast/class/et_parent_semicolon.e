indexing

	description:

		"Eiffel class parents followed by a semicolon"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_PARENT_SEMICOLON

inherit

	ET_PARENT_ITEM

creation

	make

feature {NONE} -- Initialization

	make (a_parent: like parent_item; a_semicolon: like semicolon) is
			-- Create a new parent-semicolon.
		require
			a_parent_not_void: a_parent /= Void
			a_semicolon_not_void: a_semicolon /= Void
		do
			parent_item := a_parent
			semicolon := a_semicolon
		ensure
			parent_item_set: parent_item = a_parent
			semicolon_set: semicolon = a_semicolon
		end

feature -- Access

	parent_item: ET_PARENT
			-- Class parent in semicolon-separated list

	semicolon: ET_SYMBOL
			-- Semicolon separator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := parent_item.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := semicolon.break
		end

invariant

	semicolon_not_void: semicolon /= Void

end -- class ET_PARENT_SEMICOLON
