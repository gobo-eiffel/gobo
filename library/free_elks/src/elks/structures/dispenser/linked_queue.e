note
	description: "Unbounded queues implemented as linked lists"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: linked_queue, dispenser, linked_list
	representation: linked
	access: fixed, fifo, membership
	contents: generic
	date: "$Date: 2021-06-18 17:01:52 +0000 (Fri, 18 Jun 2021) $"
	revision: "$Revision: 105548 $"

class LINKED_QUEUE [G] inherit

	QUEUE [G]
		undefine
			is_empty, copy, is_equal
		redefine
			prune_all
		select
			item, put, extend
		end

	LINKED_LIST [G]
		rename
			item as ll_item,
			remove as ll_remove,
			make as ll_make,
			remove_left as remove,
			put as ll_put,
			extend as ll_extend
		export
			{NONE} all
			{LINKED_QUEUE}
				cursor, valid_cursor, start, forth, go_to,
				first_element, last_element, ll_item
			{ANY}
				writable, extendible, wipe_out,
				readable, off, before, after, index
		undefine
			fill, append, prune,
			readable, writable, prune_all,
			force, is_inserted
		redefine
			copy,
			duplicate,
			linear_representation,
			make_from_iterable
		select
			remove
		end

create
	make,
	make_from_iterable

create {LINKED_QUEUE}
	ll_make

convert
	make_from_iterable ({ARRAY [G]})

feature -- Initialization

	make
			-- Create linked queue.
		do
			after := True
		end

feature {NONE} -- Creation

	make_from_iterable (other: ITERABLE [G])
			-- Create a queue with all items obtained from `other`.
		do
			make
			⟳ o: other ¦ extend (o) ⟲
		end

feature -- Access

	item: G
			-- Oldest item
		do
			check attached active as a then
				Result := a.item
			end
		ensure then
			last_element_if_not_empty:
				not is_empty implies (active = last_element)
		end

feature -- Element change

	put, extend, force (v: G)
			-- Add `v' as newest item.
		do
			put_front (v)
			before := False
			after := True
		ensure then
			single_item_constraint: (old is_empty) implies (item = v)
		end

feature -- Conversion

	linear_representation: ARRAYED_LIST [G]
			-- Representation as a linear structure
			-- (order is same as original order of insertion)
		local
			l_list: ARRAYED_LIST [G]
		do
			create l_list.make (count)
			from
				start
			until
				after
			loop
				l_list.extend (ll_item)
				forth
			end

			from
				create Result.make (count)
				l_list.finish
			until
				l_list.before
			loop
				Result.extend (l_list.item)
				l_list.back
			end
		end

feature -- Duplication

	duplicate (n: INTEGER): like Current
			-- New queue containing the `n' oldest items in current queue.
			-- If `n' is greater than `count', identical to current queue.
		obsolete
			"[
				Create a new container explicitly using `make_from_iterable` if available.
				Otherwise, replace a call to the feature with code that creates and initializes container.
				[2018-11-30]
			]"
		local
			l_cur: like cursor
		do
			l_cur := cursor
			from
				create Result.make
				start
			until
				after or Result.count = n
			loop
				Result.extend (ll_item)
				forth
			end
			go_to (l_cur)
		end

	copy (other: like Current)
			-- Update current object using fields of object attached
			-- to `other', so as to yield equal objects.
		local
			cur: LINKED_LIST_CURSOR [G]
		do
			if other /= Current then
				standard_copy (other)
				if not other.is_empty then
					internal_wipe_out
					cur := other.cursor
					from
						other.start
					until
						other.off
					loop
						ll_extend (other.ll_item)
							-- For speeding up next insertion, we go
							-- to the end, that way `extend' does not
							-- need to traverse the list completely.
						forth
						other.forth
					end
					if cur /= Void then
						other.go_to (cur)
					end
				end
				after := True
				before := False
			end
		end

feature {NONE} -- Not applicable

	prune (v: like item)
			-- Remove one occurrence of `v'.
			-- Not available.
		do
			-- Do nothing
		end

	prune_all (v: like item)
			-- Remove all occurrences of `v'.
			-- Not available
		do
			-- Do nothing
		end

invariant

	is_always_after: not is_empty implies after

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
