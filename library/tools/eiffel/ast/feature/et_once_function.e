indexing

	description:

		"Eiffel once-functions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_ONCE_FUNCTION

inherit

	ET_INTERNAL_FUNCTION

creation

	make

feature -- Duplication

	synonym (a_name: like name): like Current is
			-- Synonym feature
		do
			Result := universe.new_once_function (a_name, arguments, type,
				obsolete_message, preconditions, locals, compound, postconditions,
				rescue_clause, clients, current_class)
		end

feature -- Conversion

	renamed_feature (a_name: like name): like Current is
			-- Renamed version of current feature
		do
			Result := universe.new_once_function (a_name, arguments, type,
				obsolete_message, preconditions, locals, compound, postconditions,
				rescue_clause, clients, current_class)
			Result.set_implementation_class (implementation_class)
			Result.set_version (version)
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

end
