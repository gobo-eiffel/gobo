indexing

	description:
		"Stacks implemented by resizable arrays"

	status: "See notice at end of class"
	names: dispenser, array;
	representation: array;
	access: fixed, lifo, membership;
	size: fixed;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

class ARRAYED_STACK [G] inherit

	STACK [G]
		undefine
			copy, is_equal, prune_all, replace, is_inserted
		redefine
			linear_representation
		select
			remove, extend, put
		end

	ARRAYED_LIST [G]
		rename
			put as al_put,
			extend as al_extend,
			force as al_force,
			remove as al_remove,
			start as finish,
			finish as start,
			forth as back,
			back as forth,
			after as before,
			before as after
		export
			{NONE} all
			{ANY}
				count, readable, writable, extendible,
			 	make, wipe_out, valid_index, index, off
			{STACK} before, after, start, finish, forth, back
			{ARRAYED_STACK} valid_cursor, cursor, go_to, area,
				subarray, subcopy, i_th, upper, lower
		undefine
			readable, writable,
			append, fill
		redefine
			linear_representation
		end

create
	make
	
create {ARRAYED_STACK}
	make_filled

feature -- Element change

	extend, put, force (v: like item) is
			-- Push `v' on top.
		do
			al_extend (v)
			start
		end

feature -- Removal

	remove is
			-- Remove top item.
		require else
			not_empty: count /= 0
		do
			al_remove
			start
		end

feature -- Conversion

	linear_representation: ARRAYED_LIST [G] is
			-- Representation as a linear structure
			-- (in the reverse order of original insertion)
		local
			i: INTEGER
		do
			from
				create Result.make (count)
				i := count
			until
				i < 1
			loop
				Result.extend (i_th (i))
				i := i - 1
			end
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

end -- class ARRAYED_STACK



