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

feature -- Conversion

	undefined_feature (a_name: like name; an_id: INTEGER): ET_DEFERRED_PROCEDURE is
			-- Undefined version of current feature
		do
			!! Result.make_with_seeds (a_name, arguments, obsolete_message,
				preconditions, postconditions, clients, implementation_class, seeds, an_id)
		end

end -- class ET_PROCEDURE
