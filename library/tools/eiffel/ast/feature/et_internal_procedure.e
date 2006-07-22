indexing

	description:

		"Eiffel internal (do or once) procedures"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_INTERNAL_PROCEDURE

inherit

	ET_PROCEDURE
		undefine
			reset, locals
		end

	ET_INTERNAL_ROUTINE

end
