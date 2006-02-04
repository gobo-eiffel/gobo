indexing

	description:
		"Dynamically modifiable circular chains"

	status: "See notice at end of class"
	names: dynamic_circular, ring, sequence;
	access: index, cursor, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class DYNAMIC_CIRCULAR [G] inherit

	CIRCULAR [G]
		undefine
			prune, prune_all
		end

	DYNAMIC_CHAIN [G]
		undefine
			valid_cursor_index,
			search, first, last,
			finish, start, move, go_i_th,
			off, exhausted
		redefine
			duplicate
		end

feature -- Duplication

	duplicate (n: INTEGER): like Current is
			-- Copy of sub-chain beginning at current position
			-- and having min (`n', `count') items.
		local
			pos: CURSOR
			to_be_removed, counter: INTEGER
		do
			from
				Result := new_chain
				pos := cursor
				to_be_removed := count.min (n)
			until
				counter = to_be_removed
			loop
				Result.extend (item)
				forth
				counter := counter + 1
			end
			go_to (pos)
		end

indexing

	library: "[
			EiffelBase: Library of reusable components for Eiffel.
			]"

	status: "[
			Copyright 1986-2001 Interactive Software Engineering (ISE).
			For ISE customers the original versions are an ISE product
			covered by the ISE Eiffel license and support agreements.
			]"

	license: "[
			EiffelBase may now be used by anyone as FREE SOFTWARE to
			develop any product, public-domain or commercial, without
			payment to ISE, under the terms of the ISE Free Eiffel Library
			License (IFELL) at http://eiffel.com/products/base/license.html.
			]"

	source: "[
			Interactive Software Engineering Inc.
			ISE Building
			360 Storke Road, Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Electronic mail <info@eiffel.com>
			Customer support http://support.eiffel.com
			]"

	info: "[
			For latest info see award-winning pages: http://eiffel.com
			]"

end -- class DYNAMIC_CIRCULAR



