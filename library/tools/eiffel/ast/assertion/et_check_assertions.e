indexing

	description:

		"Eiffel check assertions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_CHECK_ASSERTIONS

inherit

	ET_ASSERTIONS

creation

	make

feature {NONE} -- Initialization

	make (a_check: like check_keyword) is
			-- Create a new check clause.
		require
			a_check_not_void: a_check /= Void
		do
			check_keyword := a_check
			!! assertions.make (10)
		ensure
			check_keyword_set: check_keyword = a_check
		end

feature -- Access

	check_keyword: ET_TOKEN
			-- 'check' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := check_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if not assertions.is_empty then
				Result := assertions.last.break
			else
				Result := check_keyword.break
			end
		end

invariant

	check_keyword_not_void: check_keyword /= Void

end -- class ET_CHECK_ASSERTIONS
