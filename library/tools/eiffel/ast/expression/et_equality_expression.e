indexing

	description:

		"Eiffel equality expressions (i.e. '=' and '/=')"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_EQUALITY_EXPRESSION

inherit

	ET_BINARY_EXPRESSION
		redefine
			reset
		end

create

	make

feature {NONE} -- Initialization

	make (a_left: like left; an_operator: like operator; a_right: like right) is
			-- Create a new equality expression.
		require
			a_left_not_void: a_left /= Void
			an_operator_not_void: an_operator /= Void
			a_right_not_void: a_right /= Void
		do
			left := a_left
			operator := an_operator
			right := a_right
		ensure
			left_set: left = a_left
			operator_set: operator = an_operator
			right_set: right = a_right
		end

feature -- Initialization

	reset is
			-- Reset expression as it was when it was first parsed.
		do
			left.reset
			right.reset
		end

feature -- Access

	operator: ET_SYMBOL
			-- Operator symbol ('=' or '/=')

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_equality_expression (Current)
		end

invariant

	operator_not_void: operator /= Void

end
