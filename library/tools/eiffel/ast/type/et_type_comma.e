indexing

	description:

		"Eiffel types followed by a comma"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_TYPE_COMMA

inherit

	ET_TYPE_ITEM

creation

	make

feature {NONE} -- Initialization

	make (a_type: like type_item; a_comma: like comma) is
			-- Create a new type-comma.
		require
			a_type_not_void: a_type /= Void
			a_comma_not_void: a_comma /= Void
		do
			type_item := a_type
			comma := a_comma
		ensure
			type_item_set: type_item = a_type
			comma_set: comma = a_comma
		end

feature -- Access

	type_item: ET_TYPE
			-- Type in comma-separated list

	comma: ET_SYMBOL
			-- Comma separator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := type_item.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := comma.break
		end

feature -- Type processing

	resolved_formal_parameters (actual_parameters: ET_ACTUAL_GENERIC_PARAMETERS): ET_TYPE_COMMA is
			-- Replace in current type the formal generic parameter
			-- types by those of `actual_parameters' when the 
			-- corresponding actual parameter is different from
			-- the formal parameter. (Warning: this is a side-effect
			-- function.)
		local
			a_type: ET_TYPE
		do
			a_type := type_item.resolved_formal_parameters (actual_parameters)
			if a_type /= type_item then
				!! Result.make (a_type, comma)
			else
				Result := Current
			end
		end

	resolved_identifier_types (a_feature: ET_FEATURE; args: ET_FORMAL_ARGUMENTS; a_class: ET_CLASS): ET_TYPE_COMMA is
			-- Replace any 'like identifier' types that appear in the
			-- implementation of `a_feature in class `a_class' by
			-- the corresponding 'like feature' or 'like argument'.
			-- Also resolve 'BIT identifier' types. Set
			-- `a_class.has_flatten_error' to true if an error occurs.
			-- (Warning: this is a side-effect function.)
		local
			a_type: ET_TYPE
		do
			a_type := type_item.resolved_identifier_types (a_feature, args, a_class)
			if a_type /= type_item then
				!! Result.make (a_type, comma)
			else
				Result := Current
			end
		end

	resolved_named_types (a_class: ET_CLASS; ast_factory: ET_AST_FACTORY): ET_TYPE_COMMA is
			-- Replace in current type unresolved named types
			-- by corresponding class types or formal generic
			-- parameter names. `a_class' is the class where
			-- current type appears in the source code.
			-- (Warning: this is a side-effect function.)
		local
			a_type: ET_TYPE
		do
			a_type := type_item.resolved_named_types (a_class, ast_factory)
			if a_type /= type_item then
				!! Result.make (a_type, comma)
			else
				Result := Current
			end
		end

feature -- Conversion

	base_type (a_feature: ET_FEATURE; a_type: ET_CLASS_TYPE): ET_TYPE_COMMA is
			-- Type, in the context of `a_feature' in `a_type',
			-- only made up of class names and generic formal parameters
			-- when `a_type' in a generic type not fully derived
			-- (Definition of base type in ETL2 p.198)
		local
			a_base_type: ET_TYPE
		do
			a_base_type := type_item.base_type (a_feature, a_type)
			if a_base_type /= type_item then
				!! Result.make (a_base_type, comma)
			else
				Result := Current
			end
		end

feature -- Duplication

	deep_cloned_type: like Current is
			-- Recursively cloned type
		local
			a_type: ET_TYPE
		do
			a_type := type_item.deep_cloned_type
			if a_type /= type_item then
				!! Result.make (a_type, comma)
			else
				Result := Current
			end
		end

invariant

	comma_not_void: comma /= Void

end -- class ET_TYPE_COMMA
