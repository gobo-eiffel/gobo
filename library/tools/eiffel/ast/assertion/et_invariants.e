indexing

	description:

		"Eiffel invariants"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_INVARIANTS

inherit

	ET_ASSERTIONS

creation

	make

feature {NONE} -- Initialization

	make (an_invariant: like invariant_keyword) is
			-- Create a new invariant clause.
		require
			an_invariant_not_void: an_invariant /= Void
		do
			invariant_keyword := an_invariant
			!! assertions.make (10)
		ensure
			invariant_keyword_set: invariant_keyword = an_invariant
		end

feature -- Access

	invariant_keyword: ET_TOKEN
			-- 'invariant' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := invariant_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if not assertions.is_empty then
				Result := assertions.last.break
			else
				Result := invariant_keyword.break
			end
		end

invariant

	invariant_keyword_not_void: invariant_keyword /= Void

end -- class ET_INVARIANTS
