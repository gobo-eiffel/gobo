indexing

	description:

		"Eiffel integer constants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_INTEGER_CONSTANT

inherit

	ET_AST_LEAF
		rename
			make as make_leaf,
			make_with_position as make_leaf_with_position
		redefine
			position
		end

	ET_CONSTANT
		redefine
			is_integer_constant
		end

	ET_CHOICE_CONSTANT
		rename
			expression as expression_item
		end

	ET_INDEXING_TERM

feature -- Access

	literal: STRING
			-- Literal integer absolute value

	is_negative: BOOLEAN is
			-- Is integer value negative?
		do
			if sign /= Void then
				Result := sign.is_minus
			end
		end

	value: INTEGER
			-- Integer value set by last call
			-- to `compute_value'

	sign: ET_SYMBOL_OPERATOR
			-- Sign; Void if none

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			if sign /= Void then
				Result := sign.position
			else
				Result := Current
			end
		end

feature -- Status report

	is_integer_constant: BOOLEAN is True
			-- Is current constant an INTEGER constant?

	has_value_error: BOOLEAN
			-- Has an overflow or underflow occurred during
			-- the last computation of `value'?

feature -- Setting

	set_sign (a_sign: like sign) is
			-- Set `sign' to `a_sign'.
		do
			sign := a_sign
		ensure
			sign_set: sign = a_sign
		end

feature -- Basic operations

	compute_value is
			-- Compute value of current integer constant.
			-- Make result available in `value' or set
			-- `has_value_error' to true if an overflow or
			-- underflow occurred during computation.
		deferred
		end

invariant

	literal_not_void: literal /= Void

end
