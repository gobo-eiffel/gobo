indexing

	description:

		"Eiffel functions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_FUNCTION

inherit

	ET_QUERY
	ET_ROUTINE

feature -- Conversion

	undefined_feature (a_name: like name; an_id: INTEGER): ET_DEFERRED_FUNCTION is
			-- Undefined version of current feature
		do
			!! Result.make_with_seeds (a_name, arguments, type, obsolete_message,
				preconditions, postconditions, clients, implementation_class, seeds, an_id)
		end

end -- class ET_FUNCTION
