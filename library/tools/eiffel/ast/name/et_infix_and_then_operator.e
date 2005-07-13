indexing

	description:

		"Eiffel binary 'and then' operators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INFIX_AND_THEN_OPERATOR

inherit

	ET_OPERATOR

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new binary 'and then' operator.
		do
			and_keyword := tokens.and_keyword
			then_keyword := tokens.then_keyword
			code := tokens.infix_and_then_code
		end

feature -- Access

	and_keyword: ET_TOKEN
			-- 'and' keyword

	then_keyword: ET_TOKEN
			-- 'then' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := and_keyword.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := and_keyword
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := then_keyword
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := then_keyword.break
		end

feature -- Setting

	set_and_keyword (an_and: like and_keyword) is
			-- Set `and_keyword' to `an_and'.
		require
			an_and_not_void: an_and /= Void
		do
			and_keyword := an_and
		ensure
			and_keyword_set: and_keyword = an_and
		end

	set_then_keyword (a_then: like then_keyword) is
			-- Set `then_keyword' to `a_then'.
		require
			a_then_not_void: a_then /= Void
		do
			then_keyword := a_then
		ensure
			then_keyword_set: then_keyword = a_then
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_infix_and_then_operator (Current)
		end

feature {NONE} -- Implementation

	code: CHARACTER
			-- Operator code

invariant

	and_keyword_not_void: and_keyword /= Void
	then_keyword_not_void: then_keyword /= Void
	is_infix_and_then: is_infix_and_then

end
