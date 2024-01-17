note

	description:

		"Eiffel character constants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"

deferred class ET_CHARACTER_CONSTANT

inherit

	ET_CONSTANT
		undefine
			last_position,
			break
		redefine
			reset,
			is_character_constant,
			manifest_constant_convert_feature
		end

	ET_CHOICE_CONSTANT
		undefine
			reset,
			last_position,
			is_never_void,
			manifest_constant_convert_feature,
			break
		end

	ET_INDEXING_TERM
		undefine
			last_position,
			break
		end

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

feature -- Initialization

	reset
			-- Reset constant as it was just after it was last parsed.
		do
			type := Void
			if attached cast_type as l_cast_type then
				l_cast_type.type.reset
			end
		end

feature -- Status report

	is_character_8: BOOLEAN
			-- Is current character constant representable as a CHARACTER_8?
			-- (using ISO-8859-1 encoding)
		do
			Result := not has_invalid_code and then value.is_character_8
		ensure
			has_invalid_code: has_invalid_code implies not Result
		end

	is_character_32: BOOLEAN
			-- Is current character constant representable as a CHARACTER_32?
			-- (using the Unicode encoding)
		do
			Result := not has_invalid_code
		ensure
			has_invalid_code: has_invalid_code implies not Result
		end

	has_invalid_code: BOOLEAN
			-- Does the character code correspond to an invalid or surrogate
			-- code point in the Unicode encoding?
		do
			Result := False
		end

	is_character_constant: BOOLEAN = True
			-- Is current constant a CHARACTER constant?

	has_indexing_term_value (a_value: STRING): BOOLEAN
			-- Does current indexing term have value `a_value'?
			-- (case-insensitive comparison)
		do
			if a_value.count = 1 then
				Result := value.as_lower = a_value.item (1).as_lower
			end
		end

feature -- Access

	value: CHARACTER_32
			-- Character value

	cast_type: detachable ET_TARGET_TYPE
			-- Cast type

	type: detachable ET_CLASS_TYPE
			-- Type of character constant;
			-- Void if not determined yet

	indexing_term_value: STRING
			-- Value of current indexing term
		do
			Result := value.out
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			if attached cast_type as l_cast_type then
				Result := l_cast_type.position
			else
				Result := Current
			end
		end

	value_position: ET_POSITION
			-- Position of first character of current node in source code,
			-- without taking into account the cast type
		do
			Result := Current
		ensure
			value_position_not_void: Result /= Void
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			if attached cast_type as l_cast_type then
				Result := l_cast_type.first_leaf
			else
				Result := Current
			end
		end

feature -- Setting

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
				if a_target_type.same_named_context (a_universe.character_8_type) then
					if is_character_8 then
						Result := a_universe.character_8_convert_feature
					end
				elseif a_target_type.same_named_context (a_universe.character_32_type) then
					if is_character_32 then
						Result := a_universe.character_32_convert_feature
					end
				end
			end
		end

invariant

	valid_value: {UC_UNICODE_ROUTINES}.valid_non_surrogate_natural_32_code (value.natural_32_code)

end
