note

	description:

		"Eiffel actual generic parameters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2024, Eric Bezault and others"
	license: "MIT License"

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

	actual_parameter: ET_ACTUAL_PARAMETER
			-- Actual parameter in comma-separated list
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	type: ET_TYPE
			-- Type of `actual_parameter'
		deferred
		end

	named_parameter (a_context: ET_TYPE_CONTEXT): ET_ACTUAL_PARAMETER
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

	named_parameter_with_type (a_type: ET_NAMED_TYPE): ET_ACTUAL_PARAMETER
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

	named_parameter_has_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does the named parameter of current type contain `a_class'
			-- when it appears in `a_context'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			a_class_not_void: a_class /= Void
		deferred
		end

	named_parameter_has_class_with_ancestors_not_built_successfully (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does named parameter of current type contain  a class
			-- whose ancestors have not been built successfully
			-- when it appears in `a_context'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

feature -- Type processing

	resolved_formal_parameters_with_type (a_type: ET_TYPE): ET_ACTUAL_PARAMETER
			-- Version of current actual parameter where its type
			-- is replaced by `a_type'
		deferred
		end

	resolved_syntactical_constraint_with_type (a_type: detachable ET_TYPE;
		a_parser: ET_EIFFEL_PARSER_SKELETON): detachable ET_ACTUAL_PARAMETER
			-- Version of current actual parameter, where its type has
			-- been replaced by `a_type'
		do
			Result := Current
		end

feature -- Output

	append_canonical_to_string (a_string: STRING)
			-- Append textual representation of canonical version of current
			-- actual generic parameter to `a_string'.
			-- A canonical version is an unaliased version, that is when
			-- aliased types such as INTEGER are replaced with the associated
			-- types such as INTEGER_32. Also, implicit type marks are
			-- replaced with explicit type marks, except when the actual
			-- generic parameters are base types where the type mark is not
			-- shown at all if 'attached', or if 'expanded' and the base class
			-- is expanded, or if 'separate' and the base class is separate
			-- (e.g. "FOO [BAR, INTEGER_8, detachable BAZ]" instead of
			-- "FOO [attached BAR, expanded INTEGER_8, detachable BAZ]").
			-- Do not show the 'detachable' type mark for base types in
			-- non-void-safe mode.
			-- Also, tuple types have no labels.
		require
			a_string_not_void: a_string /= Void
		do
			if attached type.type_mark as l_type_mark then
				if l_type_mark.is_detachable_mark then
					a_string.append_string (tokens.detachable_keyword.text)
					a_string.append_character (' ')
				end
				if l_type_mark.is_expanded_mark then
					a_string.append_string (tokens.expanded_keyword.text)
					a_string.append_character (' ')
				end
				if l_type_mark.is_reference_mark then
					a_string.append_string (tokens.reference_keyword.text)
					a_string.append_character (' ')
				end
				if l_type_mark.is_separate_mark then
					a_string.append_string (tokens.separate_keyword.text)
					a_string.append_character (' ')
				end
			end
			type.append_canonical_to_string (a_string)
		end

end
