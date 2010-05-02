note

	description:

		"Eiffel binary 'and then' operators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_INFIX_AND_THEN_OPERATOR

inherit

	ET_OPERATOR
		redefine
			is_infix,
			is_infix_and_then
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new binary 'and then' operator.
		do
			and_keyword := tokens.and_keyword
			then_keyword := tokens.then_keyword
		end

feature -- Status report

	is_infix: BOOLEAN = True
			-- Is current feature name of the form 'infix ...'?

	is_infix_and_then: BOOLEAN = True
			-- Is current feature name of the form 'infix "and then"'?

feature -- Access

	name: STRING
			-- Name of feature call
		do
			Result := tokens.infix_and_then_name
		end

	and_keyword: ET_TOKEN
			-- 'and' keyword

	then_keyword: ET_TOKEN
			-- 'then' keyword

	hash_code: INTEGER
			-- Hash code
		do
			Result := tokens.infix_and_then_code.code
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := and_keyword.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := and_keyword
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := then_keyword
		end

	break: ET_BREAK
			-- Break which appears just after current node
		do
			Result := then_keyword.break
		end

feature -- Setting

	set_and_keyword (an_and: like and_keyword)
			-- Set `and_keyword' to `an_and'.
		require
			an_and_not_void: an_and /= Void
		do
			and_keyword := an_and
		ensure
			and_keyword_set: and_keyword = an_and
		end

	set_then_keyword (a_then: like then_keyword)
			-- Set `then_keyword' to `a_then'.
		require
			a_then_not_void: a_then /= Void
		do
			then_keyword := a_then
		ensure
			then_keyword_set: then_keyword = a_then
		end

feature -- Comparison

	same_call_name (other: ET_CALL_NAME): BOOLEAN
			-- Are `Current' and `other' the same feature call name?
			-- (case insensitive)
		do
			if Current = other then
				Result := True
			else
				Result := other.is_infix_and_then
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_infix_and_then_operator (Current)
		end

invariant

	and_keyword_not_void: and_keyword /= Void
	then_keyword_not_void: then_keyword /= Void
	is_infix_and_then: is_infix_and_then

end
