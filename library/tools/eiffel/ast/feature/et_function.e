indexing

	description:

		"Eiffel functions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_FUNCTION

inherit

	ET_QUERY
		redefine
			is_prefixable, is_infixable,
			signature, undefined_feature,
			has_formal_parameters,
			resolve_formal_parameters,
			resolve_identifier_types,
			add_to_system
		end

	ET_ROUTINE
		undefine
			is_prefixable, is_infixable
		end

feature -- Access

	signature: ET_SIGNATURE is
			-- Signature of current function
			-- (Create a new object at each call.)
		do
			!! Result.make (arguments, type)
		end

feature -- Status report

	is_infixable: BOOLEAN is
			-- Can current feature have a name of
			-- the form 'infix ...'?
		do
			Result := arguments /= Void and then arguments.count = 1
		end

	is_prefixable: BOOLEAN is
			-- Can current feature have a name of
			-- the form 'prefix ...'?
		do
			Result := arguments = Void or else arguments.count = 0
		end

feature -- Conversion

	undefined_feature (a_name: like name): ET_DEFERRED_FUNCTION is
			-- Undefined version of current feature
		do
			!! Result.make (a_name, arguments, declared_type, obsolete_message,
				preconditions, postconditions, clients, current_class)
			Result.set_is_keyword (is_keyword)
			Result.set_end_keyword (end_keyword)
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
			if arguments /= Void then
				arguments.add_to_system
			end
		end

feature -- Type processing

	has_formal_parameters (actual_parameters: ET_ACTUAL_PARAMETER_LIST): BOOLEAN is
			-- Does current feature contain formal generic parameter
			-- types whose corresponding actual parameter in
			-- `actual_parameters' is different from the formal
			-- parameter?
		do
			Result := type.has_formal_parameters (actual_parameters)
			if not Result then
				if arguments /= Void then
					Result := arguments.has_formal_parameters (actual_parameters)
				end
			end
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
			if arguments /= Void then
				if arguments.has_formal_parameters (actual_parameters) then
					arguments := arguments.cloned_arguments
					arguments.resolve_formal_parameters (actual_parameters)
				end
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
			if arguments /= Void then
				arguments.resolve_identifier_types (Current, a_class)
			end
			declared_type := declared_type.resolved_identifier_types (Current, arguments, a_class)
		end

end
