indexing

	description:
		"Unbounded queues implemented as linked lists"

	status: "See notice at end of class"
	names: linked_queue, dispenser, linked_list;
	representation: linked;
	access: fixed, fifo, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

class LINKED_QUEUE [G] inherit

	QUEUE [G]
		undefine
			is_empty, copy, is_equal
		redefine
			linear_representation, prune_all, extend
		select
			item, put
		end

	LINKED_LIST [G]
		rename
			item as ll_item,
			remove as ll_remove,
			make as ll_make,
			remove_left as remove,
			put as ll_put
		export
			{NONE}
				all
			{LINKED_QUEUE}
				cursor, valid_cursor, start, forth, go_to,
				first_element, last_element
			{ANY}
				writable, extendible, wipe_out,
				readable, off, before, after, index
		undefine
			fill, append, prune,
			readable, writable, prune_all, extend,
			force, is_inserted
		redefine
			duplicate, linear_representation
		select
			remove
		end

create
	make

create {LINKED_QUEUE}
	ll_make

feature -- Initialization

	make is
			-- Create linked queue.
		do
			after := True
		end

feature -- Access

	item: G is
			-- Oldest item
		do
			Result := active.item
		ensure then
			last_element_if_not_empty: 
				not is_empty implies (active = last_element)
		end

feature -- Element change

	put, extend, force (v: G) is
			-- Add `v' as newest item.
		do
			put_front (v)
			before := False
			after := True
		ensure then
			single_item_constraint: (old is_empty) implies (item = v)
		end

feature -- Conversion

	linear_representation: ARRAYED_LIST [G] is
			-- Representation as a linear structure
			-- (order is same as original order of insertion)
		do
			create Result.make_filled (count)
			from
				start
				Result.finish
			until
				after
			loop
				Result.replace (ll_item)
				forth
				Result.back
			end
		end

feature -- Duplication

	duplicate (n: INTEGER): like Current is
			-- New queue containing the `n' oldest items in current queue.
			-- If `n' is greater than `count', identical to current queue.
		do
			start
			from
				create Result.make
				start
			until
				after or Result.count = n
			loop
				Result.extend (ll_item)
				forth
			end
			finish
		end

feature {NONE} -- Not applicable

	prune (v: like item) is
			-- Remove one occurrence of `v'.
			-- Not available.
		do
			-- Do nothing
		end

	prune_all (v: like item) is
			-- Remove all occurrences of `v'.
			-- Not available
		do
			-- Do nothing
		end

invariant

	is_always_after: not is_empty implies after

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

end -- class LINKED_QUEUE



