indexing

	description:

		"Eiffel boolean constants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_BOOLEAN_CONSTANT

inherit

	ET_CONSTANT

	ET_INDEXING_TERM

	ET_TOKEN
		undefine
			process
		end

feature -- Status report

	is_true: BOOLEAN is
			-- Is boolean value true?
		deferred
		end

end
