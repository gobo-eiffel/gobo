indexing

	description:

		"Eiffel queries (functions or attributes)"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_QUERY

inherit

	ET_FEATURE

feature -- Access

	type: ET_TYPE is
			-- Return type
		do
			Result := declared_type.type
		ensure then
			type_not_void: Result /= Void
		end

	declared_type: ET_DECLARED_TYPE
			-- Declared type (type preceded by a colon)

	signature: ET_SIGNATURE is
			-- Signature of current feature
			-- (Create a new object at each call.)
		do
			create Result.make (Void, type)
		end

feature -- Conversion

	undefined_feature (a_name: like name): ET_DEFERRED_FUNCTION is
			-- Undefined version of current feature
		do
			create Result.make (a_name, Void, declared_type, Void, Void, Void, clients, current_class)
			Result.set_semicolon (semicolon)
			Result.set_feature_clause (feature_clause)
			Result.set_implementation_class (implementation_class)
			if seeds /= Void then
				Result.set_seeds (seeds)
			else
				Result.set_first_seed (first_seed)
			end
			if precursors /= Void then
				Result.set_precursors (precursors)
			else
				Result.set_first_precursor (first_precursor)
			end
		end

feature -- System

	add_to_system is
			-- Recursively add to system classes that
			-- appear in current feature.
		do
			type.add_to_system
		end

feature -- Type processing

	has_formal_parameters (actual_parameters: ET_ACTUAL_PARAMETER_LIST): BOOLEAN is
			-- Does current feature contain formal generic parameter
			-- types whose corresponding actual parameter in
			-- `actual_parameters' is different from the formal
			-- parameter?
		do
			Result := type.has_formal_parameters (actual_parameters)
		end

	resolve_formal_parameters (actual_parameters: ET_ACTUAL_PARAMETER_LIST) is
			-- Replace in current feature the formal generic parameter
			-- types by those of `actual_parameters' when the 
			-- corresponding actual parameter is different from
			-- the formal parameter.
		do
			if type.has_formal_parameters (actual_parameters) then
				declared_type := declared_type.deep_cloned_type
				declared_type := declared_type.resolved_formal_parameters (actual_parameters)
			end
		end

	resolve_identifier_types (a_class: ET_CLASS) is
			-- Replace any 'like identifier' types that appear in the
			-- implementation of current feature in class `a_class' by
			-- the corresponding 'like feature' or 'like argument'.
			-- Also resolve 'BIT identifier' types and check validity
			-- of arguments' name. Set `a_class.has_flatten_error' to
			-- true if an error occurs.
		do
			declared_type := declared_type.resolved_identifier_types (Current, Void, a_class)
		end

invariant

	declared_type_not_void: declared_type /= Void

end
