indexing

	description:

		"Singleton2"

	library: "Gobo Eiffel Pattern Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class SINGLETON2

inherit

	SHARED_SINGLETON2

creation

	make

feature {NONE} -- Initialization

	make is
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
