note

	description:

		"Eiffel real constants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_REAL_CONSTANT

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
			is_real_constant,
			manifest_constant_convert_feature
		end

	ET_INDEXING_TERM
		undefine
			last_position,
			break
		end

feature -- Initialization

	reset
			-- Reset constant as it was just after it was last parsed.
		do
			type := Void
			if attached cast_type as l_cast_type then
				l_cast_type.type.reset
			end
		end

feature -- Access

	literal: STRING
			-- Literal real absolute value

	sign: detachable ET_SYMBOL_OPERATOR
			-- Sign; Void if none

	cast_type: detachable ET_TARGET_TYPE
			-- Cast type

	type: detachable ET_CLASS_TYPE
			-- Type of real constant;
			-- Void if not determined yet

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
			-- Is real value negative?
		do
			if attached sign as l_sign then
				Result := l_sign.is_minus
			end
		end

	is_real_constant: BOOLEAN = True
			-- Is current constant a real constant?

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
-- TODO: check that the value of `Current' can be represented in `a_target_type'.
				if a_target_type.same_named_context (a_universe.real_32_type) then
					Result := a_universe.real_32_convert_feature
				elseif a_target_type.same_named_context (a_universe.real_64_type) then
					Result := a_universe.real_64_convert_feature
				end
			end
		end

invariant

	literal_not_void: literal /= Void

end
