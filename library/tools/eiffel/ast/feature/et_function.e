indexing

	description:

		"Eiffel functions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_FUNCTION

inherit

	ET_QUERY
		undefine
			arguments,
			preconditions,
			postconditions,
			reset_preconditions,
			reset_postconditions,
			obsolete_message
		redefine
			is_function,
			is_prefixable, is_infixable,
			undefined_feature,
			resolve_inherited_signature
		end

	ET_ROUTINE
		undefine
			type, is_prefixable, is_infixable
		redefine
			is_function
		end

feature -- Status report

	is_function: BOOLEAN is True
			-- Is feature a function?

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
			create Result.make (a_name, arguments, declared_type, assigner, obsolete_message,
				preconditions, postconditions, clients, implementation_class)
			Result.set_implementation_feature (implementation_feature)
			Result.set_first_precursor (Current)
			Result.set_is_keyword (is_keyword)
			Result.set_end_keyword (end_keyword)
			Result.set_semicolon (semicolon)
			Result.set_feature_clause (feature_clause)
			Result.set_first_indexing (first_indexing)
			Result.set_first_seed (first_seed)
			Result.set_other_seeds (other_seeds)
		end

feature -- Type processing

	resolve_inherited_signature (a_parent: ET_PARENT) is
			-- Resolve arguments and type inherited from `a_parent'.
			-- Resolve any formal generic parameters of declared types
			-- with the corresponding actual parameters in `a_parent',
			-- and duplicate identifier anchored types (and clear their
			-- base types).
		local
			a_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			a_parameters := a_parent.actual_parameters
			if a_parameters /= Void then
				declared_type := declared_type.resolved_formal_parameters (a_parameters)
				if arguments /= Void then
					arguments := arguments.resolved_formal_parameters (a_parameters)
				end
			end
		end

end
