indexing

	description:

		"Singleton3"

	library: "Gobo Eiffel Pattern Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class SINGLETON3

inherit

	ANY -- required by SE 2.1b1

	SHARED_SINGLETON3

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a singleton object.
		require
			singleton3_not_created: not singleton3_created
		do
			singleton3_cell.put (Current)
		end

invariant

	singleton3_created: singleton3_created
	singleton_pattern: Current = singleton3

end
