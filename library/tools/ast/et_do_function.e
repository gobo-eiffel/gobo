indexing

	description:

		"Eiffel do-functions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_DO_FUNCTION

inherit

	ET_INTERNAL_FUNCTION

creation

	make, make_with_seeds

feature -- Duplication

	synonym (a_name: like name; an_id: INTEGER): like Current is
			-- Synonym feature
		do
			!! Result.make (a_name, arguments, type, obsolete_message, preconditions,
				locals, compound, postconditions, rescue_clause, clients, implementation_class, an_id)
		end

feature -- Conversion

	renamed_feature (a_name: like name; an_id: INTEGER): like Current is
			-- Renamed version of current feature
		do
			!! Result.make_with_seeds (a_name, arguments, type, obsolete_message, preconditions,
				locals, compound, postconditions, rescue_clause, clients, implementation_class, seeds, an_id)
			Result.set_version (version)
		end

end -- class ET_DO_FUNCTION
