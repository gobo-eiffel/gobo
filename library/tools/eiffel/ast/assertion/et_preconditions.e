indexing

	description:

		"Eiffel precondition lists"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_PRECONDITIONS

inherit

	ET_ASSERTIONS

creation

	make

feature {NONE} -- Initialization

	make (a_require: like require_keyword) is
			-- Create a new precondition clause.
		require
			a_require_not_void: a_require /= Void
		do
			require_keyword := a_require
			!! assertions.make (10)
		ensure
			require_keyword_set: require_keyword = a_require
		end

feature -- Access

	require_keyword: ET_TOKEN
	else_keyword: ET_TOKEN
			-- 'require' and 'else' keywords

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := require_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if not assertions.is_empty then
				Result := assertions.last.break
			elseif else_keyword /= Void then
				Result := else_keyword.break
			else
				Result := require_keyword.break
			end
		end

feature -- Status report

	is_require_else: BOOLEAN is
			-- Has precondition clause been declared with "require else"?
		do
			Result := (else_keyword /= Void)
		end

feature -- Setting

	set_else_keyword (an_else: like else_keyword) is
			-- Set `else_keyword' to `an_else'.
		do
			else_keyword := an_else
		ensure
			else_keyword_set: else_keyword = an_else
		end

invariant

	require_keyword_not_void: require_keyword /= Void

end -- class ET_PRECONDITIONS
