indexing

	description:

		"Eiffel real constants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_REAL_CONSTANT

inherit

	ET_AST_LEAF
		rename
			make as make_leaf,
			make_with_position as make_leaf_with_position
		redefine
			position, first_position, first_leaf
		end

	ET_CONSTANT
		undefine
			first_position, last_position
		redefine
			reset, is_real_constant
		end

	ET_INDEXING_TERM
		undefine
			first_position, last_position
		end

feature -- Initialization

	reset is
			-- Reset constant as it was when it was first parsed.
		do
			precision := '%/0/'
		end

feature -- Access

	literal: STRING
			-- Literal real absolute value

	sign: ET_SYMBOL_OPERATOR
			-- Sign; Void if none

	cast_type: ET_TARGET_TYPE
			-- Cast type

	type: ET_TYPE is
			-- Type of real when casted
		do
			if cast_type /= Void then
				Result := cast_type.type
			end
		ensure
			definition: cast_type /= Void implies Result = cast_type.type
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			if cast_type /= Void then
				Result := cast_type.position
			elseif sign /= Void then
				Result := sign.position
			else
				Result := Current
			end
		end

	first_position: ET_POSITION is
			-- Position of first character of current node in source code
		do
			if cast_type /= Void then
				Result := cast_type.first_position
			elseif sign /= Void then
				Result := sign.first_position
			else
				Result := Current
			end
		end

	last_position: ET_POSITION is
			-- Position of last character of current node in source code
		do
			create {ET_COMPRESSED_POSITION} Result.make (line, column + literal.count - 1)
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			if cast_type /= Void then
				Result := cast_type.first_leaf
			elseif sign /= Void then
				Result := sign
			else
				Result := Current
			end
		end

feature -- Status report

	is_negative: BOOLEAN is
			-- Is real value negative?
		do
			if sign /= Void then
				Result := sign.is_minus
			end
		end

	is_real_32: BOOLEAN is
			-- Is current constant a 32-bit signed real?
		do
			Result := precision = '%/32/'
		end

	is_double_64: BOOLEAN is
			-- Is current constant a 64-bit signed double?
		do
			Result := precision = '%/64/'
		end

	is_real_constant: BOOLEAN is True
			-- Is current constant a real constant?

feature -- Setting

	set_sign (a_sign: like sign) is
			-- Set `sign' to `a_sign'.
		do
			sign := a_sign
		ensure
			sign_set: sign = a_sign
		end

	set_cast_type (a_type: like cast_type) is
			-- Set `cast_type' to `a_type'.
		do
			cast_type := a_type
		ensure
			cast_type_set: cast_type = a_type
		end

feature -- Status setting

	set_real_32 is
			-- Set current constant as a 32-bit signed real.
		do
			precision := '%/32/'
		ensure
			is_real_32: is_real_32
		end

	set_double_64 is
			-- Set current constant as a 64-bit signed double.
		do
			precision := '%/64/'
		ensure
			is_double_64: is_double_64
		end

feature {NONE} -- Implementation

	precision: CHARACTER
			-- Precision code

invariant

	literal_not_void: literal /= Void

end
