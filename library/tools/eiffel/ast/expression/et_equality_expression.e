note

	description:

		"Eiffel equality expressions (i.e. '=' and '/=')"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
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
		local
			l_convert: ET_CONVERT_EXPRESSION
		do
			l_convert ?= left
			if l_convert /= Void then
				left := l_convert.expression
			end
			left.reset
			l_convert ?= right
			if l_convert /= Void then
				right := l_convert.expression
			end
			right.reset
		end

feature -- Access

	operator: ET_SYMBOL
			-- Operator symbol ('=' or '/=')

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_equality_expression (Current)
		end

invariant

	operator_not_void: operator /= Void

end
