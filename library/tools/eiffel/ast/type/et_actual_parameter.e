note

	description:

		"Eiffel actual generic parameters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ACTUAL_PARAMETER

inherit

	ET_ACTUAL_PARAMETER_ITEM
		redefine
			type, resolved_formal_parameters_with_type
		end

	ET_CONSTRAINT_ACTUAL_PARAMETER
		undefine
			type
		redefine
			actual_parameter, type
		end

feature -- Access

	actual_parameter: ET_ACTUAL_PARAMETER is
			-- Actual parameter in comma-separated list
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	type: ET_TYPE is
			-- Type of `actual_parameter'
		deferred
		end

	named_parameter (a_context: ET_TYPE_CONTEXT): ET_ACTUAL_PARAMETER is
			-- Same as current actual parameter but its type
			-- replaced by its named type
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		ensure
			named_parameter_not_void: Result /= Void
			named_parameter_named: Result.type.is_named_type
		end

	named_parameter_with_type (a_type: ET_NAMED_TYPE): ET_ACTUAL_PARAMETER is
			-- Same as current actual parameter but its type
			-- replaced by `a_type'
		require
			a_type_not_void: a_type /= Void
			a_type_is_named: a_type.is_named_type
		do
			Result := a_type
		ensure
			named_parameter_not_void: Result /= Void
			type_set: Result.type = a_type
		end

feature -- Status report

	named_parameter_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT): BOOLEAN is
			-- Does the named parameter of current type contain `a_class'
			-- when it appears in `a_context'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			a_class_not_void: a_class /= Void
		deferred
		end

feature -- Type processing

	resolved_formal_parameters_with_type (a_type: ET_TYPE): ET_ACTUAL_PARAMETER is
			-- Version of current actual parameter where its type
			-- is replaced by `a_type'
		deferred
		end

	resolved_syntactical_constraint_with_type (a_type: ET_TYPE;
		a_parser: ET_EIFFEL_PARSER_SKELETON): ET_ACTUAL_PARAMETER is
			-- Version of current actual parameter, where its type has
			-- been replaced by `a_type'
		do
			Result := Current
		end

end
