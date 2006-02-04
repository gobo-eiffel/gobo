indexing

	description:
		"Dynamically modifiable chains"

	status: "See notice at end of class"
	names: dynamic_chain, sequence;
	access: index, cursor, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class DYNAMIC_CHAIN [G] inherit

	CHAIN [G]
		export
			{ANY} remove, prune_all, prune
		undefine
			remove, prune_all, prune
		end

	UNBOUNDED [G]

feature -- Status report

	extendible: BOOLEAN is True
			-- May new items be added? (Answer: yes.)

	prunable: BOOLEAN is
			-- May items be removed? (Answer: yes.)
		do
			Result := True
		end

feature -- Element change

	put_front (v: like item) is
			-- Add `v' at beginning.
			-- Do not move cursor.
		deferred
		ensure
	 		new_count: count = old count + 1
			item_inserted: first = v
		end

	put_left (v: like item) is
			-- Add `v' to the left of cursor position.
			-- Do not move cursor.
		require
			extendible: extendible
			not_before: not before
		deferred
		ensure
	 		new_count: count = old count + 1
	 		new_index: index = old index + 1
		end

	put_right (v: like item) is
			-- Add `v' to the right of cursor position.
			-- Do not move cursor.
		require
			extendible: extendible
			not_after: not after
		deferred
		ensure
	 		new_count: count = old count + 1
	 		same_index: index = old index
		end

	merge_left (other: like Current) is
			-- Merge `other' into current structure before cursor
			-- position. Do not move cursor. Empty `other'.
		require
			extendible: extendible
			not_before: not before
			other_exists: other /= Void
			not_current: other /= Current
		deferred
		ensure
	 		new_count: count = old count + old other.count
	 		new_index: index = old index + old other.count
			other_is_empty: other.is_empty
		end

	merge_right (other: like Current) is
			-- Merge `other' into current structure after cursor
			-- position. Do not move cursor. Empty `other'.
		require
			extendible: extendible
			not_after: not after
			other_exists: other /= Void
			not_current: other /= Current
		deferred
		ensure
	 		new_count: count = old count + old other.count
	 		same_index: index = old index
			other_is_empty: other.is_empty
		end

feature -- Removal

	prune (v: like item) is
			-- Remove first occurrence of `v', if any,
			-- after cursor position.
			-- If found, move cursor to right neighbor;
			-- if not, make structure `exhausted'.
		do
			search (v)
			if not exhausted then
				remove
			end
		end

	remove_left is
			-- Remove item to the left of cursor position.
			-- Do not move cursor.
		require
			left_exists: index > 1
		deferred
		ensure
	 		new_count: count = old count - 1
	 		new_index: index = old index - 1
		end

	remove_right is
			-- Remove item to the right of cursor position.
			-- Do not move cursor.
		require
			right_exists: index < count
		deferred
		ensure
	 		new_count: count = old count - 1
	 		same_index: index = old index
		end

	prune_all (v: like item) is
			-- Remove all occurrences of `v'.
			-- (Reference or object equality,
			-- based on `object_comparison'.)
			-- Leave structure `exhausted'.
		do
			from
				start
				search (v)
			until
				exhausted
			loop
				remove
				search (v)
			end
		ensure then
			is_exhausted: exhausted
		end

	wipe_out is
			-- Remove all items.
		do
			from
				start
			until
				is_empty
			loop
				remove
			end
		end

feature -- Duplication

	duplicate (n: INTEGER): like Current is
			-- Copy of sub-chain beginning at current position
			-- and having min (`n', `from_here') items,
			-- where `from_here' is the number of items
			-- at or to the right of current position.
		local
			pos: CURSOR
			counter: INTEGER
		do
			from
				Result := new_chain
				if object_comparison then
					Result.compare_objects
				end
				pos := cursor
			until
				(counter = n) or else exhausted
			loop
				Result.extend (item)
				forth
				counter := counter + 1
			end
			go_to (pos)
		end

feature {DYNAMIC_CHAIN} -- Implementation

	new_chain: like Current is
			-- A newly created instance of the same type.
			-- This feature may be redefined in descendants so as to
			-- produce an adequately allocated and initialized object.
		deferred
		ensure
			result_exists: Result /= Void
		end

invariant

	extendible: extendible

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

end -- class DYNAMIC_CHAIN



