indexing

	description:

		"Eiffel integer constants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2004, Eric Bezault and others"
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
			reset, is_integer_constant
		end

	ET_CHOICE_CONSTANT
		rename
			expression as expression_item
		undefine
			reset
		end

	ET_INDEXING_TERM

feature -- Initialization

	reset is
			-- Reset constant as it was when it was first parsed.
		do
			precision := '%/0/'
		end

feature -- Access

	literal: STRING
			-- Literal integer absolute value

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

	is_negative: BOOLEAN is
			-- Is integer value negative?
		do
			if sign /= Void then
				Result := sign.is_minus
			end
		end

	is_integer_8: BOOLEAN is
			-- Is current constant an 8-bit signed integer?
		do
			Result := precision = '%/8/'
		end

	is_integer_16: BOOLEAN is
			-- Is current constant a 16-bit signed integer?
		do
			Result := precision = '%/16/'
		end

	is_integer_32: BOOLEAN is
			-- Is current constant a 32-bit signed integer?
		do
			Result := precision = '%/32/'
		end

	is_integer_64: BOOLEAN is
			-- Is current constant a 64-bit signed integer?
		do
			Result := precision = '%/64/'
		end

	is_integer_constant: BOOLEAN is True
			-- Is current constant an integer constant?

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

feature -- Status setting

	set_integer_8 is
			-- Set current constant as an 8-bit signed integer.
		do
			precision := '%/8/'
		ensure
			is_integer_8: is_integer_8
		end

	set_integer_16 is
			-- Set current constant as a 16-bit signed integer.
		do
			precision := '%/16/'
		ensure
			is_integer_16: is_integer_16
		end

	set_integer_32 is
			-- Set current constant as a 32-bit signed integer.
		do
			precision := '%/32/'
		ensure
			is_integer_32: is_integer_32
		end

	set_integer_64 is
			-- Set current constant as a 64-bit signed integer.
		do
			precision := '%/64/'
		ensure
			is_integer_64: is_integer_64
		end

feature -- Basic operations

	compute_value is
			-- Compute value of current integer constant.
			-- Make result available in `value' or set
			-- `has_value_error' to true if an overflow or
			-- underflow occurred during computation.
		deferred
		end

feature {NONE} -- Implementation

	precision: CHARACTER
			-- Precision code

invariant

	literal_not_void: literal /= Void

end
