indexing

	description:

		"Eiffel deferred routines"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_DEFERRED_ROUTINE

inherit

	ET_ROUTINE
		redefine
			is_deferred
		end

feature -- Status report

	is_deferred: BOOLEAN is True
			-- Is feature deferred?

end -- class ET_DEFERRED_ROUTINE
