note
	description: "Dynamically modifiable chains"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: dynamic_chain, sequence
	access: index, cursor, membership
	contents: generic
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

	DYNAMIC_TABLE [G, INTEGER]
		rename
			bag_put as sequence_put,
			force as put_i_th,
			item as i_th alias "[]",
			put as put_i_th,
			remove as remove_i_th,
			valid_key as valid_index
		undefine
			fill,
			sequence_put
		redefine
			prune_all
		end

feature -- Status report

	extendible: BOOLEAN
			-- May new items be added? (Answer: yes.)
		do
			Result := True
		end

feature -- Element change

	put_front (v: like item)
			-- Add `v' at beginning.
			-- Do not move cursor.
		require
			extendible: extendible
		deferred
		ensure
	 		new_count: count = old count + 1
			item_inserted: first = v
		end

	put_left (v: like item)
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

	put_right (v: like item)
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

	merge_left (other: like Current)
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

	merge_right (other: like Current)
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

	prune (v: like item)
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

	prune_all (v: like item)
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

	remove_left
			-- Remove item to the left of cursor position.
			-- Do not move cursor.
		require
			left_exists: index > 1
		deferred
		ensure
	 		new_count: count = old count - 1
	 		new_index: index = old index - 1
		end

	remove_right
			-- Remove item to the right of cursor position.
			-- Do not move cursor.
		require
			right_exists: index < count
		deferred
		ensure
	 		new_count: count = old count - 1
	 		same_index: index = old index
		end

	remove_i_th (i: INTEGER)
			-- Remove item at index `i`.
			-- Move cursor to next neighbor (or `after' if no next neighbor) if it is at `i`-th position.
			-- Do not change cursor otherwise.
		local
			new_index: like index
		do
				-- Default, inefficient implementation.
			new_index := index
			if new_index > i then
					-- Take into account that the old `i`-th element is going to be removed.
				new_index := new_index - 1
			end
			go_i_th (i)
			remove
			go_i_th (new_index)
		ensure then
			new_count: count = old count - 1
			same_index_if_below: index <= i implies index = old index
			new_index_if_above: index > i implies index = old index - 1
			same_leading_items: across old twin as c all c.target_index < i implies c.item = i_th (c.target_index) end
			same_trailing_items: across old twin as c all c.target_index > i implies c.item = i_th (c.target_index - 1) end
		end

	wipe_out
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

	duplicate (n: INTEGER): like Current
			-- Copy of sub-chain beginning at current position
			-- and having min (`n', `from_here') items,
			-- where `from_here' is the number of items
			-- at or to the right of current position.
		obsolete
			"[
				Create a new container explicitly using `make_from_iterable` if available.
				Otherwise, replace a call to the feature with code that creates and initializes container.
				[2018-11-30]
			]"
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

	new_chain: like Current
			-- A newly created instance of the same type.
			-- This feature may be redefined in descendants so as to
			-- produce an adequately allocated and initialized object.
		obsolete "Use explicit creation instead. See also explanations for `duplicate`. [2018-11-30]"
		deferred
		ensure
			result_exists: Result /= Void
		end

note
	copyright: "Copyright (c) 1984-2019, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
