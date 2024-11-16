note

	description:

		"Eiffel integer constants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_INTEGER_CONSTANT

inherit

	ET_AST_LEAF
		rename
			make as make_leaf,
			make_with_position as make_leaf_with_position
		undefine
			first_position
		redefine
			position,
			first_leaf
		end

	ET_CONSTANT
		undefine
			last_position,
			break
		redefine
			reset,
			is_integer_constant,
			manifest_constant_convert_feature
		end

	ET_CHOICE_CONSTANT
		undefine
			last_position,
			reset,
			is_never_void,
			manifest_constant_convert_feature,
			break
		end

	ET_NOTE_TERM
		undefine
			last_position,
			break
		end

feature -- Initialization

	reset
			-- Reset constant as it was just after it was last parsed.
		do
			precursor {ET_CONSTANT}
			type := Void
			if attached cast_type as l_cast_type then
				l_cast_type.type.reset
			end
		end

feature -- Access

	literal: STRING_8
			-- Literal integer absolute value

	value: NATURAL_64
			-- Integer absolute value corresponding to
			-- `literal' if it fits into a NATURAL_64,
			-- `has_overflow' is True otherwise

	to_integer_8: INTEGER_8
			-- INTEGER_8 value of current integer constant
		require
			is_integer_8: is_integer_8
		do
			if is_negative then
				if value = integer_8_min_value_abs then
					Result := {INTEGER_8}.Min_value
				else
					Result := -value.as_integer_8
				end
			else
				Result := value.as_integer_8
			end
		end

	to_integer_16: INTEGER_16
			-- INTEGER_16 value of current integer constant
		require
			is_integer_16: is_integer_16
		do
			if is_negative then
				if value = integer_16_min_value_abs then
					Result := {INTEGER_16}.Min_value
				else
					Result := -value.as_integer_16
				end
			else
				Result := value.as_integer_16
			end
		end

	to_integer_32: INTEGER_32
			-- INTEGER_32 value of current integer constant
		require
			is_integer_32: is_integer_32
		do
			if is_negative then
				if value = integer_32_min_value_abs then
					Result := {INTEGER_32}.Min_value
				else
					Result := -value.as_integer_32
				end
			else
				Result := value.as_integer_32
			end
		end

	to_integer_64: INTEGER_64
			-- INTEGER_64 value of current integer constant
		require
			is_integer_64: is_integer_64
		do
			if is_negative then
				if value = integer_64_min_value_abs then
					Result := {INTEGER_64}.Min_value
				else
					Result := -value.as_integer_64
				end
			else
				Result := value.as_integer_64
			end
		end

	to_natural_8: NATURAL_8
			-- NATURAL_8 value of current integer constant
		require
			is_natural_8: is_natural_8
		do
			Result := value.as_natural_8
		end

	to_natural_16: NATURAL_16
			-- NATURAL_16 value of current integer constant
		require
			is_natural_16: is_natural_16
		do
			Result := value.as_natural_16
		end

	to_natural_32: NATURAL_32
			-- NATURAL_32 value of current integer constant
		require
			is_natural_32: is_natural_32
		do
			Result := value.as_natural_32
		end

	to_natural_64: NATURAL_64
			-- NATURAL_64 value of current integer constant
		require
			is_natural_64: is_natural_64
		do
			Result := value
		end

	sign: detachable ET_SYMBOL_OPERATOR
			-- Sign; Void if none

	cast_type: detachable ET_TARGET_TYPE
			-- Cast type

	type: detachable ET_CLASS_TYPE
			-- Type of integer constant;
			-- Void if not determined yet

	note_term_value: STRING_8
			-- Value of current note term
		do
			if attached sign as l_sign then
				Result := l_sign.text + literal
			else
				Result := literal
			end
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			if attached cast_type as l_cast_type then
				Result := l_cast_type.position
			elseif attached sign as l_sign then
				Result := l_sign.position
			else
				Result := Current
			end
		end

	value_position: ET_POSITION
			-- Position of first character of current node in source code,
			-- without taking into account the cast type
		do
			if attached sign as l_sign then
				Result := l_sign.position
			else
				Result := Current
			end
		ensure
			value_position_not_void: Result /= Void
		end

	last_position: ET_POSITION
			-- Position of last character of current node in source code
		do
			create {ET_COMPRESSED_POSITION} Result.make (line, column + literal.count - 1)
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			if attached cast_type as l_cast_type then
				Result := l_cast_type.first_leaf
			elseif attached sign as l_sign then
				Result := l_sign
			else
				Result := Current
			end
		end

feature -- Status report

	is_negative: BOOLEAN
			-- Is integer value negative?
		do
			if attached sign as l_sign then
				Result := l_sign.is_minus
			end
		end

	is_integer_constant: BOOLEAN = True
			-- Is current constant an integer constant?

	is_hexadecimal: BOOLEAN
			-- Is current constant in hexadecimal format
		do
			Result := False
		end

	is_binary: BOOLEAN
			-- Is current constant in binary format
		do
			Result := False
		end

	has_overflow: BOOLEAN
			-- Is the integer absolute value too large to fit into a NATURAL_64?

	is_integer_8: BOOLEAN
			-- Is current integer constant representable as an INTEGER_8?
		do
			if has_overflow then
				Result := False
			elseif is_negative then
				Result := value <= integer_8_min_value_abs
			else
				Result := value <= {INTEGER_8}.Max_value.as_natural_64
			end
		end

	is_integer_16: BOOLEAN
			-- Is current integer constant representable as an INTEGER_16?
		do
			if has_overflow then
				Result := False
			elseif is_negative then
				Result := value <= integer_16_min_value_abs
			else
				Result := value <= {INTEGER_16}.Max_value.as_natural_64
			end
		end

	is_integer_32: BOOLEAN
			-- Is current integer constant representable as an INTEGER_32?
		do
			if has_overflow then
				Result := False
			elseif is_negative then
				Result := value <= integer_32_min_value_abs
			else
				Result := value <= {INTEGER_32}.Max_value.as_natural_64
			end
		end

	is_integer_64: BOOLEAN
			-- Is current integer constant representable as an INTEGER_64?
		do
			if has_overflow then
				Result := False
			elseif is_negative then
				Result := value <= integer_64_min_value_abs
			else
				Result := value <= {INTEGER_64}.Max_value.as_natural_64
			end
		end

	is_natural_8: BOOLEAN
			-- Is current integer constant representable as a NATURAL_8?
		do
			if has_overflow then
				Result := False
			elseif is_negative then
				Result := False
			else
				Result := value <= {NATURAL_8}.Max_value
			end
		end

	is_natural_16: BOOLEAN
			-- Is current integer constant representable as a NATURAL_16?
		do
			if has_overflow then
				Result := False
			elseif is_negative then
				Result := False
			else
				Result := value <= {NATURAL_16}.Max_value
			end
		end

	is_natural_32: BOOLEAN
			-- Is current integer constant representable as a NATURAL_32?
		do
			if has_overflow then
				Result := False
			elseif is_negative then
				Result := False
			else
				Result := value <= {NATURAL_32}.Max_value
			end
		end

	is_natural_64: BOOLEAN
			-- Is current integer constant representable as a NATURAL_64?
		do
			if has_overflow then
				Result := False
			elseif is_negative then
				Result := False
			else
				Result := True
			end
		end

	has_note_term_value (a_value: STRING_8): BOOLEAN
			-- Does current note term have value `a_value'?
			-- (case-insensitive comparison)
		do
			if not attached sign as l_sign then
				Result := STRING_.same_case_insensitive (literal, a_value)
			elseif literal.count = a_value.count - 1 then
				if l_sign.is_minus and then a_value.item (1) = '-' then
					Result := STRING_.same_case_insensitive ("-" + literal, a_value)
				elseif l_sign.is_plus and then a_value.item (1) = '+' then
					Result := STRING_.same_case_insensitive ("+" + literal, a_value)
				end
			end
		end

	valid_literal (a_literal: READABLE_STRING_GENERAL): BOOLEAN
			-- Is `a_literal' a valid value for `literal'?
		require
			a_literal_not_void: a_literal /= Void
		do
			Result := {RX_PCRE_ROUTINES}.regexp (literal_regexp).recognizes (a_literal)
		ensure
			instance_free: class
			definition: Result = {RX_PCRE_ROUTINES}.regexp (literal_regexp).recognizes (a_literal)
		end

feature -- Setting

	set_sign (a_sign: like sign)
			-- Set `sign' to `a_sign'.
		do
			sign := a_sign
		ensure
			sign_set: sign = a_sign
		end

	set_cast_type (a_type: like cast_type)
			-- Set `cast_type' to `a_type'.
		do
			cast_type := a_type
		ensure
			cast_type_set: cast_type = a_type
		end

	set_type (a_type: like type)
			-- Set `type' to `a_type'.
		do
			type := a_type
		ensure
			type_set: type = a_type
		end

feature -- Type conversion

	manifest_constant_convert_feature (a_source_type: ET_TYPE_CONTEXT; a_target_type: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): detachable ET_CONVERT_FEATURE
			-- Implicit feature to convert `Current' of type `a_source_type' to `a_target_type'.
			-- This is only possible when there is no explicit type cast and the value of the
			-- constant can be represented in `a_target_type'.
			-- Void if no such feature or when not possible.
		do
			if cast_type = Void then
				if a_target_type.same_named_context (a_universe.integer_8_type) then
					if is_integer_8 then
						Result := a_universe.integer_8_convert_feature
					end
				elseif a_target_type.same_named_context (a_universe.integer_16_type) then
					if is_integer_16 then
						Result := a_universe.integer_16_convert_feature
					end
				elseif a_target_type.same_named_context (a_universe.integer_32_type) then
					if is_integer_32 then
						Result := a_universe.integer_32_convert_feature
					end
				elseif a_target_type.same_named_context (a_universe.integer_64_type) then
					if is_integer_64 then
						Result := a_universe.integer_64_convert_feature
					end
				elseif a_target_type.same_named_context (a_universe.natural_8_type) then
					if is_natural_8 then
						Result := a_universe.natural_8_convert_feature
					end
				elseif a_target_type.same_named_context (a_universe.natural_16_type) then
					if is_natural_16 then
						Result := a_universe.natural_16_convert_feature
					end
				elseif a_target_type.same_named_context (a_universe.natural_32_type) then
					if is_natural_32 then
						Result := a_universe.natural_32_convert_feature
					end
				elseif a_target_type.same_named_context (a_universe.natural_64_type) then
					if is_natural_64 then
						Result := a_universe.natural_64_convert_feature
					end
				elseif a_target_type.same_named_context (a_universe.real_32_type) then
-- TODO: check that it can be represented as a REAL_32.
					Result := a_universe.real_32_convert_feature
				elseif a_target_type.same_named_context (a_universe.real_64_type) then
-- TODO: check that it can be represented as a REAL_64.
					Result := a_universe.real_64_convert_feature
				end
			end
		end

feature {NONE} -- Constants

	integer_8_min_value_abs: NATURAL_64
			-- Absolute value of {INTEGER_8}.Min_value
		once
			Result := (-({INTEGER_8}.Min_value + 1)).as_natural_64 + 1
		end

	integer_16_min_value_abs: NATURAL_64
			-- Absolute value of {INTEGER_16}.Min_value
		once
			Result := (-({INTEGER_16}.Min_value + 1)).as_natural_64 + 1
		end

	integer_32_min_value_abs: NATURAL_64
			-- Absolute value of {INTEGER_32}.Min_value
		once
			Result := (-({INTEGER_32}.Min_value + 1)).as_natural_64 + 1
		end

	integer_64_min_value_abs: NATURAL_64
			-- Absolute value of {INTEGER_64}.Min_value
		once
			Result := (-({INTEGER_64}.Min_value + 1)).as_natural_64 + 1
		end

feature {NONE} -- Implementation

	literal_regexp: STRING
			-- Regular expression for `literal'
		deferred
		ensure
			instance_free: class
			literal_regexp_not_void: Result /= Void
		end

invariant

	literal_not_void: literal /= Void
	valid_literal: valid_literal (literal)

end
