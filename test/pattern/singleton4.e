note

	description:

		"Singleton4"

	library: "Gobo Eiffel Pattern Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class SINGLETON4

inherit

	ANY -- required by SE 2.1b1

	SHARED_SINGLETON4

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a singleton object.
		require
			singleton4_not_created: not singleton4_created
		do
			singleton4_cell.put (Current)
		end

invariant

	singleton4_created: singleton4_created
	singleton_pattern: Current = singleton4

end
