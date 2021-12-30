note
	description: "Stacks implemented by resizable arrays"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: dispenser, array
	representation: array
	access: fixed, lifo, membership
	size: fixed
	contents: generic
	date: "$Date: 2021-06-18 17:01:52 +0000 (Fri, 18 Jun 2021) $"
	revision: "$Revision: 105548 $"

class ARRAYED_STACK [G] inherit

	STACK [G]
		undefine
			copy, is_equal, prune_all, replace, is_inserted
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
			{ARRAYED_STACK} valid_cursor, cursor, go_to, area, area_v2,
				i_th, lower
		undefine
			readable, writable,
			append, fill
		redefine
			linear_representation,
			make_from_iterable
		end

create
	make,
	make_from_iterable

create {ARRAYED_STACK}
	make_filled

convert
	make_from_iterable ({ARRAY [G]})

feature {NONE} -- Creation

	make_from_iterable (other: ITERABLE [G])
			-- Create a stack with all items obtained from `other`.
		do
			make (estimated_count_of (other))
			⟳ o: other ¦ extend (o) ⟲
		end

feature -- Element change

	extend, put, force (v: like item)
			-- Push `v' on top.
		do
			al_extend (v)
			start
		end

feature -- Removal

	remove
			-- Remove top item.
		require else
			not_empty: count /= 0
		do
			al_remove
			start
		end

feature -- Conversion

	linear_representation: ARRAYED_LIST [G]
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

note
	copyright: "Copyright (c) 1984-2021, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
