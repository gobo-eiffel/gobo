indexing

	description:

		"Eiffel queries (functions or attributes)"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_QUERY

inherit

	ET_FEATURE

feature -- Access

	type: ET_TYPE
			-- Return type

	signature: ET_SIGNATURE is
			-- Signature of current feature
			-- (Create a new object at each call.)
		do
			!! Result.make (Void, type)
		end

feature -- Conversion

	undefined_feature (a_name: like name; an_id: INTEGER): ET_DEFERRED_FUNCTION is
			-- Undefined version of current feature
		do
			!! Result.make_with_seeds (a_name, Void, type, Void,
				Void, Void, clients, implementation_class, seeds, an_id)
		end

feature -- System

	add_to_system is
			-- Recursively add to system classes that
			-- appear in current feature.
		do
			type.add_to_system
		end

feature -- Type processing

	has_formal_parameters (actual_parameters: ARRAY [ET_TYPE]): BOOLEAN is
			-- Does current feature contain formal generic parameter
			-- types of index 'i' such that 'actual_parameters.item (i)'
			-- is not void?
		do
			Result := type.has_formal_parameters (actual_parameters)
		end

	resolve_formal_parameters (actual_parameters: ARRAY [ET_TYPE]) is
			-- Replace in current feature the formal generic parameter
			-- types of index 'i' by 'actual_parameters.item (i)'
			-- when these new parameters are not void.
		do
			if type.has_formal_parameters (actual_parameters) then
				type := type.deep_cloned_type
				type := type.resolved_formal_parameters (actual_parameters)
			end
		end

	resolve_identifier_types (a_flattener: ET_FEATURE_FLATTENER) is
			-- Replace any 'like identifier' types that appear
			-- in the implementation of current feature by the
			-- corresponding 'like feature' or 'like argument'.
			-- Also resolve 'BIT identifier' types.
		do
			type := type.resolved_identifier_types (Current, Void, a_flattener)
		end

invariant

	type_not_void: type /= Void

end -- class ET_QUERY
