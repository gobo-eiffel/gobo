indexing

	description:

		"Stacks (Last-In, First-Out)"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_STACK [G]

inherit

	DS_DISPENSER [G]
		redefine
			put, force
		end

feature -- Element change

	put (v: G) is
			-- Push `v' on stack.
		deferred
		ensure then
			pushed: item = v
		end

	force (v: G) is
			-- Push `v' on stack.
		deferred
		ensure then
			pushed: item = v
		end

	replace (v: G) is
			-- Replace top item by `v'.
		require
			not_empty: not is_empty
		deferred
		ensure
			same_count: count = old count
			replaced: item = v
		end

end -- class DS_STACK
