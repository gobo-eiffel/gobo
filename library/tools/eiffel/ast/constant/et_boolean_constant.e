indexing

	description:

		"Eiffel boolean constants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_BOOLEAN_CONSTANT

inherit

	ET_CONSTANT
		redefine
			is_boolean_constant
		end

	ET_INDEXING_TERM

	ET_KEYWORD
		undefine
			process
		end

feature -- Status report

	is_boolean_constant: BOOLEAN is True
			-- Is current constant a BOOLEAN constant?

end
