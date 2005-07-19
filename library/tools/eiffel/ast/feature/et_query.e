indexing

	description:

		"Eiffel queries (functions or attributes)"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_QUERY

inherit

	ET_FEATURE
		redefine
			type
		end

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

	assigner: ET_ASSIGNER
			-- Assigner procedure

feature -- Conversion

	undefined_feature (a_name: like extended_name): ET_DEFERRED_FUNCTION is
			-- Undefined version of current feature
		do
			create Result.make (a_name, Void, declared_type, assigner, Void, Void, Void, clients, implementation_class)
			Result.set_implementation_feature (implementation_feature)
			Result.set_first_precursor (Current)
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
			end
		end

invariant

	declared_type_not_void: declared_type /= Void

end
