indexing

	description:

		"Eiffel procedures"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_PROCEDURE

inherit

	ET_ROUTINE

feature -- Access

	type: ET_TYPE is
			-- Return type;
			-- Void for procedures
		do
			-- Result := Void
		ensure then
			procedure: Result = Void
		end

	signature: ET_SIGNATURE is
			-- Signature of current procedure
			-- (Create a new object at each call.)
		do
			!! Result.make (arguments, Void)
		end

feature -- Conversion

	undefined_feature (a_name: like name; an_id: INTEGER): ET_DEFERRED_PROCEDURE is
			-- Undefined version of current feature
		do
			!! Result.make_with_seeds (a_name, arguments, obsolete_message,
				preconditions, postconditions, clients, implementation_class, seeds, an_id)
		end

feature -- System

	add_to_system is
			-- Recursively add to system classes that
			-- appear in current feature.
		do
			if arguments /= Void then
				arguments.add_to_system
			end
		end

feature -- Type processing

	has_formal_parameters (actual_parameters: ARRAY [ET_TYPE]): BOOLEAN is
			-- Does current feature contain formal generic parameter
			-- types of index 'i' such that 'actual_parameters.item (i)'
			-- is not void?
		do
			if arguments /= Void then
				Result := arguments.has_formal_parameters (actual_parameters)
			end
		end

	resolve_formal_parameters (actual_parameters: ARRAY [ET_TYPE]) is
			-- Replace in current feature the formal generic parameter
			-- types of index 'i' by 'actual_parameters.item (i)'
			-- when these new parameters are not void.
		do
			if arguments /= Void then
				if arguments.has_formal_parameters (actual_parameters) then
					arguments := arguments.cloned_arguments
					arguments.resolve_formal_parameters (actual_parameters)
				end
			end
		end

	resolve_identifier_types (a_flattener: ET_FEATURE_FLATTENER) is
			-- Replace any 'like identifier' types that appear
			-- in the implementation of current feature by the
			-- corresponding 'like feature' or 'like argument'.
			-- Also resolve 'BIT identifier' types and check
			-- validity of arguments' name.
		do
			if arguments /= Void then
				arguments.resolve_identifier_types (Current, a_flattener)
			end
		end

end -- class ET_PROCEDURE
