note

	description:

		"Eiffel boolean constants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_BOOLEAN_CONSTANT

inherit

	ET_CONSTANT
		undefine
			first_position,
			last_position,
			is_false,
			is_true,
			break
		redefine
			is_boolean_constant
		end

	ET_INDEXING_TERM
		undefine
			first_position,
			last_position,
			break
		end

	ET_KEYWORD
		undefine
			process,
			is_current
		end

feature -- Status report

	is_boolean_constant: BOOLEAN = True
			-- Is current constant a BOOLEAN constant?

end
