indexing

	description:

		"Eiffel assertions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_ASSERTION

inherit

	ET_AST_NODE

feature -- Access

	semicolon: ET_SYMBOL
			-- Semicolon separator

feature -- Setting

	set_semicolon (a_semicolon: like semicolon) is
			-- Set `semicolon' to `a_semicolon'.
		do
			semicolon := a_semicolon
		ensure
			semicolon_set: semicolon = a_semicolon
		end

end -- class ET_ASSERTION
