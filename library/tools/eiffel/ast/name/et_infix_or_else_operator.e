indexing

	description:

		"Eiffel binary 'or else' operators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INFIX_OR_ELSE_OPERATOR

inherit

	ET_OPERATOR
		redefine
			is_infix,
			is_infix_or_else
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new binary 'or else' operator.
		do
			or_keyword := tokens.or_keyword
			else_keyword := tokens.else_keyword
		end

feature -- Status report

	is_infix: BOOLEAN is True
			-- Is current feature name of the form 'infix ...'?

	is_infix_or_else: BOOLEAN is True
			-- Is current feature name of the form 'infix "or else"'?

feature -- Access

	name: STRING is
			-- Name of feature call
		do
			Result := tokens.infix_or_else_name
		end

	or_keyword: ET_TOKEN
			-- 'or' keyword

	else_keyword: ET_TOKEN
			-- 'else' keyword

	hash_code: INTEGER is
			-- Hash code
		do
			Result := tokens.infix_or_else_code.code
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := or_keyword.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := or_keyword
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := else_keyword
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := else_keyword.break
		end

feature -- Setting

	set_or_keyword (an_or: like or_keyword) is
			-- Set `or_keyword' to `an_or'.
		require
			an_or_not_void: an_or /= Void
		do
			or_keyword := an_or
		ensure
			or_keyword_set: or_keyword = an_or
		end

	set_else_keyword (an_else: like else_keyword) is
			-- Set `else_keyword' to `an_else'.
		require
			an_else_not_void: an_else /= Void
		do
			else_keyword := an_else
		ensure
			else_keyword_set: else_keyword = an_else
		end

feature -- Comparison

	same_call_name (other: ET_CALL_NAME): BOOLEAN is
			-- Are `Current' and `other' the same feature call name?
			-- (case insensitive)
		do
			Result := other.is_infix_or_else
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_infix_or_else_operator (Current)
		end

invariant

	or_keyword_not_void: or_keyword /= Void
	else_keyword_not_void: else_keyword /= Void
	is_infix_or_else: is_infix_or_else

end
