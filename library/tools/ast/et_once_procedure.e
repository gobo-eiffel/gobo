indexing

	description:

		"Eiffel once-procedures"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_ONCE_PROCEDURE

inherit

	ET_INTERNAL_PROCEDURE

creation

	make, make_with_seeds

feature -- Duplication

	synonym (a_name: like name): like Current is
			-- Synonym feature
		do
			!! Result.make (a_name, arguments, obsolete_message, preconditions,
				locals, compound, postconditions, rescue_clause, clients, base_class)
		end

feature -- Conversion

	renamed_feature (a_name: like name; a_class: like base_class): like Current is
			-- Renamed version of current feature
		do
			!! Result.make_with_seeds (a_name, arguments, obsolete_message, preconditions,
				locals, compound, postconditions, rescue_clause, clients, a_class, seeds)
			Result.set_version (version)
			Result.set_implementation_class (implementation_class)
		end

end -- class ET_ONCE_PROCEDURE
