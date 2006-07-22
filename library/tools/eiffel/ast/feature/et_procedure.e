indexing

	description:

		"Eiffel procedures"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_PROCEDURE

inherit

	ET_ROUTINE

feature {NONE} -- Initialization

	make (a_name: like extended_name; args: like arguments; a_class: like implementation_class) is
			-- Create a new procedure.
		require
			a_name_not_void: a_name /= Void
			a_class_not_void: a_class /= Void
		do
			extended_name := a_name
			hash_code := name.hash_code
			arguments := args
			is_keyword := tokens.is_keyword
			end_keyword := tokens.end_keyword
			clients := tokens.any_clients
			implementation_class := a_class
			implementation_feature := Current
		ensure
			extended_name_set: extended_name = a_name
			arguments_set: arguments = args
			implementation_class_set: implementation_class = a_class
			implementation_feature_set: implementation_feature = Current
		end

feature -- Conversion

	undefined_feature (a_name: like extended_name): ET_DEFERRED_PROCEDURE is
			-- Undefined version of current feature
		do
			create Result.make (a_name, arguments, implementation_class)
			Result.set_obsolete_message (obsolete_message)
			Result.set_preconditions (preconditions)
			Result.set_postconditions (postconditions)
			Result.set_clients (clients)
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
				if arguments /= Void then
					arguments := arguments.resolved_formal_parameters (a_parameters)
				end
			end
		end

invariant

	procedure: type = Void

end
