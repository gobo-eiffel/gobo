indexing

	description:

		"Eiffel binary 'or else' operators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INFIX_OR_ELSE_OPERATOR

inherit

	ET_INFIX_OR_ELSE

	ET_INFIX_OPERATOR
		undefine
			is_infix_or_else
		end

creation

	make

feature {NONE} -- Initialization

	make (an_or: like or_keyword; an_else: like else_keyword) is
			-- Create a new binary 'or else' operator.
		require
			an_or_not_void: an_or /= Void
			an_else_not_void: an_else /= Void
		do
			or_keyword := an_or
			else_keyword := an_else
		ensure
			or_keyword_set: or_keyword = an_or
			else_keyword_set: else_keyword = an_else
		end

feature -- Access

	or_keyword: ET_TOKEN
	else_keyword: ET_TOKEN
			-- "or else" keywords

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := or_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := else_keyword.break
		end

invariant

	or_keyword_not_void: or_keyword /= Void
	else_keyword_not_void: else_keyword /= Void

end -- class ET_INFIX_OR_ELSE_OPERATOR
