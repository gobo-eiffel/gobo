indexing

	description:

		"Eiffel types which appear in a comma-separated list of types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_TYPE_ITEM

inherit

	ET_AST_NODE

feature -- Access

	type_item: ET_TYPE is
			-- Type in comma-separated list
		deferred
		ensure
			type_item_not_void: Result /= Void
		end

feature -- Type processing

	resolved_formal_parameters (actual_parameters: ET_ACTUAL_GENERIC_PARAMETERS): ET_TYPE_ITEM is
			-- Replace in current type the formal generic parameter
			-- types by those of `actual_parameters' when the 
			-- corresponding actual parameter is different from
			-- the formal parameter. (Warning: this is a side-effect
			-- function.)
		require
			actual_parameters_not_void: actual_parameters /= Void
		deferred
		ensure
			resolved_type_not_void: Result /= Void
		end

	resolved_identifier_types (a_feature: ET_FEATURE; args: ET_FORMAL_ARGUMENTS; a_class: ET_CLASS): ET_TYPE_ITEM is
			-- Replace any 'like identifier' types that appear in the
			-- implementation of `a_feature in class `a_class' by
			-- the corresponding 'like feature' or 'like argument'.
			-- Also resolve 'BIT identifier' types. Set
			-- `a_class.has_flatten_error' to true if an error occurs.
			-- (Warning: this is a side-effect function.)
		require
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
			immediate_or_redeclared: a_feature.implementation_class = a_class
		deferred
		ensure
			resolved_type_not_void: Result /= Void
		end

	resolved_named_types (a_class: ET_CLASS; ast_factory: ET_AST_FACTORY): ET_TYPE_ITEM is
			-- Replace in current type unresolved named types
			-- by corresponding class types or formal generic
			-- parameter names. `a_class' is the class where
			-- current type appears in the source code.
			-- (Warning: this is a side-effect function.)
		require
			a_class_not_void: a_class /= Void
			ast_factory_not_void: ast_factory /= Void
		deferred
		ensure
			resolved_type_not_void: Result /= Void
		end

feature -- Conversion

	base_type (a_feature: ET_FEATURE; a_type: ET_CLASS_TYPE): ET_TYPE_ITEM is
			-- Type, in the context of `a_feature' in `a_type',
			-- only made up of class names and generic formal parameters
			-- when `a_type' in a generic type not fully derived
			-- (Definition of base type in ETL2 p.198)
		require
			a_feature_not_void: a_feature /= Void
			a_type_not_void: a_type /= Void
			flattened: a_type.base_class.is_flattened
			no_flatten_error: not a_type.base_class.has_flatten_error
		deferred
		ensure
			base_type_not_void: Result /= Void
		end

feature -- Duplication

	deep_cloned_type: like Current is
			-- Recursively cloned type
		deferred
		ensure
			type_not_void: Result /= Void
		end

end -- class ET_TYPE_ITEM
