indexing

	description:

		"Eiffel check instructions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_CHECK_INSTRUCTION

inherit

	ET_INSTRUCTION

creation

	make

feature {NONE} -- Initialization

	make (a_check_assertions: like check_assertions; an_end: like end_keyword) is
			-- Create a new check instruction.
		require
			a_check_assertions_not_void: a_check_assertions /= Void
			an_end_not_void: an_end /= Void
		do
			check_assertions := a_check_assertions
			end_keyword := an_end
		ensure
			check_assertions_set: check_assertions = a_check_assertions
			end_keyword_set: end_keyword = an_end
		end

feature -- Access

	check_assertions: ET_CHECK_ASSERTIONS
			-- 'check' keyword followed by assertions

	end_keyword: ET_TOKEN
			-- 'end' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := check_assertions.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := end_keyword.break
		end

invariant

	check_assertions_not_void: check_assertions /= Void
	end_keyword_not_void: end_keyword /= Void

end -- class ET_CHECK_INSTRUCTION
