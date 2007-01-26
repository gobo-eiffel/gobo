indexing

	description:

		"Eiffel expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_EXPRESSION

inherit

	ET_EXPRESSION_ITEM
		rename
			expression as expression_item
		end

	ET_CONDITIONAL
		rename
			expression as expression_item
		end

	ET_ASSERTION
		rename
			expression as expression_item
		undefine
			reset
		end

	ET_ACTUAL_ARGUMENTS
		rename
			count as actual_argument_count,
			is_empty as is_empty_actual_argument
		end

	ET_ARGUMENT_OPERAND
		redefine
			index
		end

	ET_AGENT_ARGUMENT_OPERAND
		undefine
			reset, set_index
		redefine
			index
		end

	ET_TARGET_OPERAND
		undefine
			reset, set_index
		redefine
			index
		end

	ET_AGENT_TARGET
		undefine
			reset, set_index
		redefine
			index
		end

feature -- Access

	index: INTEGER
			-- Index of expression in enclosing feature;
			-- Used to get dynamic information about this expression.

	actual_argument (i: INTEGER): ET_EXPRESSION is
			-- Actual argument at index `i'
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	expression_item: ET_EXPRESSION is
			-- Current expression
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

feature -- Status report

	is_current: BOOLEAN is
			-- Is current expression the 'Current' entity (possibly parenthesized)?
		do
			-- Result := False
		end

feature -- Measurement

	actual_argument_count: INTEGER is 1
			-- Number of actual arguments

invariant

	index_nonnegative: index >= 0

end
