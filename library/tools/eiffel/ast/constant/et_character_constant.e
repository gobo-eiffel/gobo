indexing

	description:

		"Eiffel character constants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CHARACTER_CONSTANT

inherit

	ET_CONSTANT
		undefine
			first_position, last_position
		redefine
			reset, is_character_constant,
			manifest_constant_convert_feature
		end

	ET_CHOICE_CONSTANT
		undefine
			reset, first_position, last_position, is_never_void,
			manifest_constant_convert_feature
		end

	ET_INDEXING_TERM
		undefine
			first_position, last_position
		end

	ET_AST_LEAF
		rename
			make as make_leaf,
			make_with_position as make_leaf_with_position
		redefine
			position, first_position, first_leaf
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

feature -- Status report

	is_character_constant: BOOLEAN is True
			-- Is current constant a CHARACTER constant?

feature -- Access

	value: CHARACTER
			-- Character value

	cast_type: ET_TARGET_TYPE
			-- Cast type

	type: ET_CLASS_TYPE
			-- Type of character constant;
			-- Void if not determined yet

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			if cast_type /= Void then
				Result := cast_type.position
			else
				Result := Current
			end
		end

	first_position: ET_POSITION is
			-- Position of first character of current node in source code
		do
			if cast_type /= Void then
				Result := cast_type.first_position
			else
				Result := Current
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			if cast_type /= Void then
				Result := cast_type.first_leaf
			else
				Result := Current
			end
		end

feature -- Setting

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

	manifest_constant_convert_feature (a_source_type: ET_TYPE_CONTEXT; a_target_type: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_CONVERT_FEATURE is
			-- Implicit feature to convert `Current' of type `a_source_type' to `a_target_type'.
			-- This is only possible when there is no explicit type cast and the value of the
			-- constant can be represented in `a_target_type'.
			-- Void if no such feature or when not possible.
		do
			if cast_type = Void then
-- TODO: check that the value of `Current' can be represented in `a_target_type'.
				if a_target_type.same_named_context (a_universe.character_8_type) then
					Result := a_universe.character_8_convert_feature
				elseif a_target_type.same_named_context (a_universe.character_32_type) then
					Result := a_universe.character_32_convert_feature
				end
			end
		end

end
