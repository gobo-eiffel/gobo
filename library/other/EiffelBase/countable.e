indexing

	description:

		"EiffelBase COUNTABLE class interface"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

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

end -- class COUNTABLE
