indexing

	description:

		"Singleton1"

	library: "Gobo Eiffel Pattern Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class SINGLETON1

inherit

	ANY -- Needed for SE 2.1.

	SHARED_SINGLETON1

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a singleton object.
		require
			singleton1_not_created: not singleton1_created
		do
			singleton1_cell.put (Current)
		end

invariant

	singleton1_created: singleton1_created
	singleton_pattern: Current = singleton1

end
