indexing

	description:

		"Eiffel procedures"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
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

	undefined_feature (a_name: like name): ET_DEFERRED_PROCEDURE is
			-- Undefined version of current feature
		do
			Result := universe.new_deferred_procedure (a_name, arguments,
				obsolete_message, preconditions, postconditions, clients, current_class)
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
			if arguments /= Void then
				arguments.add_to_system
			end
		end

feature -- Type processing

	has_formal_parameters (actual_parameters: ET_ACTUAL_GENERIC_PARAMETERS): BOOLEAN is
			-- Does current feature contain formal generic parameter
			-- types whose corresponding actual parameter in
			-- `actual_parameters' is different from the formal
			-- parameter?
		do
			if arguments /= Void then
				Result := arguments.has_formal_parameters (actual_parameters)
			end
		end

	resolve_formal_parameters (actual_parameters: ET_ACTUAL_GENERIC_PARAMETERS) is
			-- Replace in current feature the formal generic parameter
			-- types by those of `actual_parameters' when the 
			-- corresponding actual parameter is different from
			-- the formal parameter.
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
