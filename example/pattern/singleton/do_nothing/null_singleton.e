indexing

	description:

		"Singleton which does nothing"

	library: "Gobo Eiffel Pattern Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class NULL_SINGLETON

inherit

	SHARED_NULL_SINGLETON

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a singleton object.
		require
			singleton_not_created: not singleton_created
		do
			singleton_cell.put (Current)
		end

invariant

	singleton_created: singleton_created
	singleton_pattern: Current = singleton

end
