note

	description:

		"Eiffel equality expressions (i.e. '=' and '/=')"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2022, Eric Bezault and others"
	license: "MIT License"
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

	make (a_left: like left; an_operator: like operator; a_right: like right)
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

	reset
			-- Reset expression as it was just after it was last parsed.
		do
			if attached {ET_CONVERT_EXPRESSION} left as l_convert then
				left := l_convert.expression
			end
			left.reset
			if attached {ET_CONVERT_EXPRESSION} right as l_convert then
				right := l_convert.expression
			end
			right.reset
		end

feature -- Access

	operator: ET_SYMBOL
			-- Operator symbol ('=' or '/=')

feature -- Setting

	set_operator (a_operator: like operator)
			-- Set `operator' to `a_operator'.
		require
			a_operator_not_void: a_operator /= Void
		do
			operator := a_operator
		ensure
			operator_set: operator = a_operator
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_equality_expression (Current)
		end

invariant

	operator_not_void: operator /= Void

end
