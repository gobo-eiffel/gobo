indexing

	description:

		"Eiffel '=' or '/=' symbols"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_EQUALITY_SYMBOL

inherit

	ET_SYMBOL

feature -- Status report

	is_not_equal: BOOLEAN is
			-- Is symbol '/='?
		deferred
		end

end
