indexing

	description:
		"Circular chains implemented as two-way linked lists"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: two_way_circular, ring, sequence;
	representation: linked;
	access: index, cursor, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

class TWO_WAY_CIRCULAR [G] inherit

	LINKED_CIRCULAR [G]
		redefine
			list
		end
create
	make

feature -- Implementation

	list: TWO_WAY_LIST [G];

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







end -- class TWO_WAY_CIRCULAR



