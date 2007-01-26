indexing

	description:

		"EiffelBase COUNTABLE class interface"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class COUNTABLE [G]

inherit

	CONTAINER [G]
		rename
			count as ds_count
		end

feature -- Access

	item (i: INTEGER): G is
			-- The `i'-th item
		require
			positive_argument: i > 0
		deferred
		end

feature -- Status report

	empty: BOOLEAN is False
			-- Is structure empty? (Answer: no.)

	full: BOOLEAN is True
			-- The structure is complete

end
