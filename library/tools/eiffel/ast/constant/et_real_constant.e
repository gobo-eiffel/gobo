indexing

	description:

		"Eiffel real constants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"
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
			reset, is_real_constant, manifest_constant_convert_feature
		end

	ET_INDEXING_TERM
		undefine
			first_position, last_position
		end

feature -- Initialization

	reset is
			-- Reset constant as it was just after it was last parsed.
		do
			type := Void
			if cast_type /= Void then
				cast_type.type.reset
			end
		end

feature -- Access

	literal: STRING
			-- Literal real absolute value

	sign: ET_SYMBOL_OPERATOR
			-- Sign; Void if none

	cast_type: ET_TARGET_TYPE
			-- Cast type

	type: ET_CLASS_TYPE
			-- Type of real constant;
			-- Void if not determined yet

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

	set_type (a_type: like type) is
			-- Set `type' to `a_type'.
		do
			type := a_type
		ensure
			type_set: type = a_type
		end

feature -- Type conversion

	manifest_constant_convert_feature (a_source_type: ET_TYPE_CONTEXT; a_target_type: ET_TYPE_CONTEXT): ET_CONVERT_FEATURE is
			-- Implicit feature to convert `Current' of type `a_source_type' to `a_target_type'.
			-- This is only possible when there is no explicit type case and the value of the
			-- constant can be represented in `a_target_type'.
			-- Void if no such feature or when not possible.
		local
			l_target_base_class: ET_CLASS
			l_system: ET_SYSTEM
		do
			if cast_type = Void then
-- TODO: check that the value of `Current' can be represented in `a_target_type'.
				l_target_base_class := a_target_type.base_class
				if not l_target_base_class.is_preparsed then
					-- No conversion to non-existing type.
				else
					l_system := l_target_base_class.current_system
					if l_target_base_class = l_system.real_32_class then
						Result := l_system.real_32_convert_feature
					elseif l_target_base_class = l_system.real_64_class then
						Result := l_system.real_64_convert_feature
					end
				end
			end
		end

invariant

	literal_not_void: literal /= Void

end
