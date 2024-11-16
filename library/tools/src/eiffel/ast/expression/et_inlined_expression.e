note

	description:

		"Eiffel operands of inlined feature calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2024, Eric Bezault and others"
	license: "MIT License"

class ET_INLINED_EXPRESSION

inherit

	ET_EXPRESSION
		redefine
			reset,
			is_false, is_true
		end

create

	make

feature {NONE} -- Initialization

	make (a_expression: like expression)
			-- Create a new inlined expression.
		require
			a_expression_not_void: a_expression /= Void
		do
			set_expression (a_expression)
		ensure
			expression_set: expression = a_expression
		end

feature -- Initialization

	reset
			-- Reset expression as it was just after it was last parsed.
		do
			precursor
			expression.reset
		end

feature -- Status report

	is_false: BOOLEAN
			-- Is current expression the 'False' entity (possibly parenthesized)?
		do
			Result := expression.is_false
		end

	is_true: BOOLEAN
			-- Is current expression the 'True' entity (possibly parenthesized)?
		do
			Result := expression.is_true
		end

feature -- Access

	expression: ET_EXPRESSION
			-- Operand of the call being inlined

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := expression.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := expression.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := expression.last_leaf
		end

feature -- Setting

	set_expression (a_expression: like expression)
			-- Set `expression' to `an_expression'.
		require
			a_expression_not_void: a_expression /= Void
		do
			expression := a_expression
		ensure
			expression_set: expression = a_expression
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_inlined_expression (Current)
		end

invariant

	expression_not_void: expression /= Void

end
