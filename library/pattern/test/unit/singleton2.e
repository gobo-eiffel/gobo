note

	description:

		"Singleton2"

	library: "Gobo Eiffel Pattern Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class SINGLETON2

inherit

	ANY -- Needed for SE 2.1.

	SHARED_SINGLETON2

create

	make

feature {NONE} -- Initialization

	make
			-- Create a singleton object.
		require
			singleton2_not_created: not singleton2_created
		do
			singleton2_cell.put (Current)
		end

invariant

	singleton2_created: singleton2_created
	singleton_pattern: Current = singleton2

end
