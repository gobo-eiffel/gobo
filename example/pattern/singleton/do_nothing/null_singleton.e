indexing

	description:

		"Singleton which does nothing"

	library: "Gobo Eiffel Pattern Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class NULL_SINGLETON

inherit

	ANY
		export
				-- `do_nothing' is exported to NONE in SE 2.1rc1.
			{ANY} do_nothing
		end

	SHARED_NULL_SINGLETON

create

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
