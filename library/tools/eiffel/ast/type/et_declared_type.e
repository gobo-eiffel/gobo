indexing

	description:

		"Eiffel entity declared types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_DECLARED_TYPE

inherit

	ET_AST_NODE

feature -- Access

	type: ET_TYPE is
			-- Declared type
		deferred
		ensure
			type_not_void: Result /= Void
		end

feature -- Type processing

	resolved_formal_parameters (actual_parameters: ET_ACTUAL_PARAMETER_LIST): ET_DECLARED_TYPE is
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

	resolved_identifier_types (a_feature: ET_FEATURE; args: ET_FORMAL_ARGUMENT_LIST; a_class: ET_CLASS): ET_DECLARED_TYPE is
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

feature -- Duplication

	deep_cloned_type: like Current is
			-- Recursively cloned type
		deferred
		ensure
			type_not_void: Result /= Void
		end

end
