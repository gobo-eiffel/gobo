note

	description:

		"Eiffel manifest strings"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_MANIFEST_STRING

inherit

	ET_CONSTANT
		undefine
			first_position, last_position
		redefine
			reset, is_string_constant,
			manifest_constant_convert_feature
		end

	ET_MANIFEST_STRING_ITEM
		undefine
			first_position, last_position
		end

	ET_INDEXING_TERM
		undefine
			first_position, last_position
		end

	ET_EXTERNAL_LANGUAGE
		undefine
			first_position, last_position
		end

	ET_EXTERNAL_ALIAS
		undefine
			first_position, last_position
		end

	ET_OBSOLETE
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

	reset
			-- Reset constant as it was just after it was last parsed.
		do
			type := Void
			if cast_type /= Void then
				cast_type.type.reset
			end
		end

feature -- Status report

	is_string_constant: BOOLEAN = True
			-- Is current constant a STRING constant?

feature -- Access

	value: STRING
			-- String value
		deferred
		end

	literal: STRING
			-- Literal value
		deferred
		end

	cast_type: ET_TARGET_TYPE
			-- Cast type

	type: ET_CLASS_TYPE
			-- Type of manifest string;
			-- Void if not determined yet

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			if cast_type /= Void then
				Result := cast_type.position
			else
				Result := Current
			end
		end

	first_position: ET_POSITION
			-- Position of first character of current node in source code
		do
			if cast_type /= Void then
				Result := cast_type.first_position
			else
				Result := Current
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			if cast_type /= Void then
				Result := cast_type.first_leaf
			else
				Result := Current
			end
		end

	manifest_string: ET_MANIFEST_STRING
			-- Manifest string
		do
			Result := Current
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

	manifest_constant_convert_feature (a_source_type: ET_TYPE_CONTEXT; a_target_type: ET_TYPE_CONTEXT; a_universe: ET_UNIVERSE): ET_CONVERT_FEATURE
			-- Implicit feature to convert `Current' of type `a_source_type' to `a_target_type'.
			-- This is only possible when there is no explicit type cast and the value of the
			-- constant can be represented in `a_target_type'.
			-- Void if no such feature or when not possible.
		do
			if cast_type = Void then
-- TODO: check that the value of `Current' can be represented in `a_target_type'.
				if a_target_type.same_named_context_with_type_marks (tokens.implicit_attached_type_mark, a_universe.string_8_type, tokens.implicit_attached_type_mark) then
					Result := a_universe.string_8_convert_feature
				elseif a_target_type.same_named_context_with_type_marks (tokens.implicit_attached_type_mark, a_universe.string_32_type, tokens.implicit_attached_type_mark) then
					Result := a_universe.string_32_convert_feature
				end
			end
		end

invariant

	literal_not_void: literal /= Void
	value_not_void: value /= Void

end
