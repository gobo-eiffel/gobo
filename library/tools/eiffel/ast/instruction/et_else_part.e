indexing

	description:

		"Eiffel 'else' parts"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_ELSE_PART

inherit

	ET_AST_NODE

creation

	make

feature {NONE} -- Initialization

	make (an_else: like else_keyword; a_compound: like compound) is
			-- Create a new else part.
		require
			an_else_not_void: an_else /= Void
		do
			else_keyword := an_else
			compound := a_compound
		ensure
			else_keyword_set: else_keyword = an_else
			compound_set: compound = a_compound
		end

feature -- Access

	else_keyword: ET_TOKEN
			-- 'else' keyword

	compound: ET_COMPOUND
			-- Instructions

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := else_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if compound /= Void then
				Result := compound.break
			else
				Result := else_keyword.break
			end
		end

invariant

	else_keyword_not_void: else_keyword /= Void

end -- class ET_ELSE_PART
