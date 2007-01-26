indexing

	description:

		"EiffelBase UNBUNDED class interface"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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

end
