indexing

	description:
		"Linkable cells containing a reference to their right neighbor"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: linkable, cell;
	representation: linked;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

class LINKABLE [G] inherit

	CELL [G]
		export
			{CELL, CHAIN}
				put
			{ANY}
				item
		end

feature -- Access

	right: like Current
			-- Right neighbor

feature {CELL, CHAIN} -- Implementation

	put_right (other: like Current) is
			-- Put `other' to the right of current cell.
		do
			right := other
		ensure
			chained: right = other
		end

	forget_right is
			-- Remove right link.
		do
			right := Void
		ensure
			not_chained: right = Void
		end

indexing
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"







end -- class LINKABLE



