indexing

	description:

		"Eiffel internal (do or once) routines"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_INTERNAL_ROUTINE

inherit

	ET_ROUTINE

feature -- Access

	compound: ET_COMPOUND
			-- Routine body

	locals: ET_LOCAL_VARIABLES
			-- Local variables

	rescue_clause: ET_COMPOUND
			-- Rescue clause

end
