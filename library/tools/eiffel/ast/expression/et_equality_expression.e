indexing

	description:

		"Eiffel equality expressions (i.e. '=' and '/=')"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_EQUALITY_EXPRESSION

inherit

	ET_BINARY_EXPRESSION

creation

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

feature -- Access

	operator: ET_EQUALITY_SYMBOL
			-- Operator symbol

invariant

	operator_not_void: operator /= Void

end -- class ET_EQUALITY_EXPRESSION
