indexing

	description:

		"Eiffel precursor calls"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_PRECURSOR

inherit

	ET_AST_NODE

creation

feature {NONE} -- Initialization

	make (a_precursor: like precursor_keyword; args: like arguments) is
			-- Create a new precursor call.
		require
			a_precursor_not_void: a_precursor /= Void
		do
			precursor_keyword := a_precursor
			arguments := args
		ensure
			precursor_keyword_set: precursor_keyword = a_precursor
			arguments_set: arguments = args
		end

feature -- Access

	precursor_keyword: ET_TOKEN
			-- Precursor keyword

	parent: ET_IDENTIFIER is
			-- Parent
		do
			-- No parent specified.
		end

	arguments: ET_ACTUAL_ARGUMENTS
			-- Arguments

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := precursor_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if arguments /= Void then
				Result := arguments.break
			else
				Result := precursor_keyword.break
			end
		end

invariant

	precursor_keyword_not_void: precursor_keyword /= Void

end -- class ET_PRECURSOR
