indexing

	description:

		"Eiffel null instructions (see ETL2 p. 234). %
		%Used as place-holder in the AST for semicolons."

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_NULL_INSTRUCTION

inherit

	ET_INSTRUCTION

creation

	make

feature {NONE} -- Initialization

	make (a_semicolon: like semicolon) is
			-- Create a new null instruction.
		require
			a_semicolon_not_void: a_semicolon /= Void
		do
			semicolon := a_semicolon
		ensure
			semicolon_set: semicolon = a_semicolon
		end

feature -- Access

	semicolon: ET_SYMBOL
			-- Semicolon symbol

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := semicolon.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := semicolon.break
		end

invariant

	semicolon_not_void: semicolon /= Void

end -- class ET_NULL_INSTRUCTION
