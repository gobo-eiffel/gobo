indexing

	description:

		"EiffelBase UNBUNDED class interface"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class UNBOUNDED [G]

inherit

	CONTAINER [G]

feature -- Status report

	empty: BOOLEAN is
			-- Is structure empty?
		do
			Result := (count = 0)
		end

	full: BOOLEAN is
			-- Is structure filled to capacity?
		deferred
		end

invariant

	empty_definition: empty = (count = 0)
	non_negative_count: count >= 0

end -- class UNBOUNDED
