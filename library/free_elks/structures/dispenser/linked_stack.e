note
	description: "Unbounded stacks implemented as linked lists"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: linked_stack, dispenser, linked_list;
	representation: linked;
	access: fixed, lifo, membership;
	contents: generic;
	date: "$Date: 2012-05-24 06:13:10 +0200 (Thu, 24 May 2012) $"
	revision: "$Revision: 559 $"

class LINKED_STACK [G] inherit

	STACK [G]
		undefine
			replace, copy, is_equal
		select
			remove, put, item
		end

	LINKED_LIST [G]
		rename
			item as ll_item,
			remove as ll_remove,
			put as ll_put
		export
			{NONE} all
			{LINKED_STACK}
				cursor, start, forth, go_to, index, first_element,
				last_element, valid_cursor, ll_item
			{ANY}
				count, readable, writable, extendible,
				make, wipe_out, off, after
		undefine
			readable, writable, fill,
			append, linear_representation,
			prune_all, is_inserted
		redefine
			extend, force, duplicate
		end

create

	make

feature -- Access

	item: G
			-- Item at the first position
		do
			check
				not_empty: not is_empty
			end
			check attached first_element as f then
				Result := f.item
			end
		end

feature -- Element change

	force (v: like item)
			-- Push `v' onto top.
		do
			put_front (v)
		end

	extend (v: like item)
			-- Push `v' onto top.
		do
			put_front (v)
		end

	put (v: like item)
		do
			put_front (v)
		end

feature -- Removal

	remove
			-- Remove item on top.
		do
			start
			ll_remove
		end

feature -- Conversion

	linear_representation: ARRAYED_LIST [G]
			-- Representation as a linear structure
			-- (order is reverse of original order of insertion)
		local
			old_cursor: CURSOR
		do
			old_cursor := cursor
			from
				create Result.make (count)
				start
			until
				after
			loop
				Result.extend (ll_item)
				forth
			end
			go_to (old_cursor)
		end

feature -- Duplication

	duplicate (n: INTEGER): like Current
			-- New stack containing the `n' latest items inserted
			-- in current stack.
			-- If `n' is greater than `count', identical to current stack.
		require else
			positive_argument: n > 0
		local
			counter: INTEGER
			old_cursor: CURSOR
			list: LINKED_LIST [G]
		do
			create Result.make
			if not is_empty then
				old_cursor := cursor
				from
					list := Result
					start
				until
					after or counter = n
				loop
					list.finish
					list.put_right (ll_item)
					counter := counter + 1
					forth
				end
				go_to (old_cursor)
			end
		end

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
