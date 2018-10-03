note
	description: "[
		Hierarchical structures in which each item has zero or
		one immediate predecessor, and zero or more successors.
		]"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: hierarchical, traversing;
	access: cursor;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class HIERARCHICAL [G] inherit

	TRAVERSABLE [G]

feature -- Access

	successor_count: INTEGER
			-- Number of successors of current element
		require
			not_off: not off
		deferred
		end

feature -- Cursor movement

	up
			-- Move to predecessor.
		require
			not_off: not off
		deferred
		end

	down (i: INTEGER)
			-- Move to `i'-th successor.
		require
			not_off: not off
 			argument_within_bounds: i >= 1 and i <= successor_count
		deferred
		end

invariant

	non_negative_successor_count: successor_count >= 0

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
