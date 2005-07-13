indexing

	description:

		"Eiffel parenthesized expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_PARENTHESIZED_EXPRESSION

inherit

	ET_EXPRESSION
		redefine
			reset, index
		end

	ET_AGENT_TARGET
		undefine
			reset, set_index
		redefine
			index
		end

create

	make

feature {NONE} -- Initialization

	make (e: like expression) is
			-- Create a new parenthesized expression.
		require
			e_not_void: e /= Void
		do
			left_parenthesis := tokens.left_parenthesis_symbol
			expression := e
			right_parenthesis := tokens.right_parenthesis_symbol
		ensure
			expression_set: expression = e
		end

feature -- Initialization

	reset is
			-- Reset expression as it was when it was first parsed.
		do
			expression.reset
		end

feature -- Access

	expression: ET_EXPRESSION
			-- Expression

	left_parenthesis: ET_SYMBOL
			-- Left parenthesis

	right_parenthesis: ET_SYMBOL
			-- Right parenthesis

	index: INTEGER
			-- Index of expression in enclosing feature;
			-- Used to get dynamic information about this expression.

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := left_parenthesis.position
			if Result.is_null then
				Result := expression.position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := left_parenthesis
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := right_parenthesis
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := right_parenthesis.break
		end

feature -- Setting

	set_left_parenthesis (l: like left_parenthesis) is
			-- Set `left_parenthesis' to `l'.
		require
			l_not_void: l /= Void
		do
			left_parenthesis := l
		ensure
			left_parenthesis_set: left_parenthesis = l
		end

	set_right_parenthesis (r: like right_parenthesis) is
			-- Set `right_parenthesis' to `r'.
		require
			r_not_void: r /= Void
		do
			right_parenthesis := r
		ensure
			right_parenthesis_set: right_parenthesis = r
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_parenthesized_expression (Current)
		end

invariant

	expression_not_void: expression /= Void
	left_parenthesis_not_void: left_parenthesis /= Void
	right_parenthesis: right_parenthesis /= Void

end
