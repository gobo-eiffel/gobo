indexing

	description:

		"Eiffel binary 'and then' operators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INFIX_AND_THEN_OPERATOR

inherit

	ET_INFIX_AND_THEN

	ET_INFIX_OPERATOR
		undefine
			is_infix_and_then
		end

creation

	make

feature {NONE} -- Initialization

	make (an_and: like and_keyword; a_then: like then_keyword) is
			-- Create a new binary 'and then' operator.
		require
			an_and_not_void: an_and /= Void
			a_then_not_void: a_then /= Void
		do
			and_keyword := an_and
			then_keyword := a_then
		ensure
			and_keyword_set: and_keyword = an_and
			then_keyword_set: then_keyword = a_then
		end

feature -- Access

	and_keyword: ET_TOKEN
	then_keyword: ET_TOKEN
			-- "and then" keywords

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := and_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := then_keyword.break
		end

invariant

	and_keyword_not_void: and_keyword /= Void
	then_keyword_not_void: then_keyword /= Void

end -- class ET_INFIX_AND_THEN_OPERATOR
