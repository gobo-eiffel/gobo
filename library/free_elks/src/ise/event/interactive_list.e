note
	description: "[
		Sequential, one-way linked lists that call add/remove features
		when an item is removed or added.
		]"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	keywords: "event, linked, list"
	date: "$Date: 2018-11-13 12:58:34 +0000 (Tue, 13 Nov 2018) $"
	revision: "$Revision: 102449 $"

deferred class
	INTERACTIVE_LIST [G]

inherit
	ARRAYED_LIST [G]
		undefine
			new_filled_list
		redefine
			default_create,
			merge_left,
			merge_right,
			wipe_out,
			put_front,
			put_left,
			put_right,
			remove_right,
			replace,
			remove,
			put_i_th,
			append,
			make_from_array,
			prune_all,
			extend
		end

feature {NONE} -- Initialization

	default_create
			-- Initialize linked list.
		do
			make (4)
		end

	make_from_array (a: ARRAY [like item])
			-- Create list from array `a'.
		local
			l_index: INTEGER
		do
			make (a.count)
			from
				l_index := a.lower
			until
				l_index > a.upper
			loop
				extend (a.item (l_index))
				l_index := l_index + 1
			end
		end

feature -- Miscellaneous

	on_item_added_at (an_item: like item; item_index: INTEGER)
			-- `an_item' has just been added at index `item_index'.
		require
			item_index_valid: (1 <= item_index) and (item_index <= count)
		do
		end

	on_item_removed_at (an_item: like item; item_index: INTEGER)
			-- `an_item' has just been removed from index `item_index'.
		require
			item_index_valid: (1 <= item_index) and (item_index <= count + 1)
		do
		end

feature -- Element Change

	put_front (v: like item)
			-- Add `v' to beginning.
			-- Do not move cursor.
		do
			in_operation := True
			Precursor {ARRAYED_LIST} (v)
			in_operation := False

			added_item (v, 1)
		end

	extend (v: like item)
			-- <Precursor>
		do
			in_operation := True
			Precursor {ARRAYED_LIST} (v)
			in_operation := False

			added_item (v, count)
		end

	append (s: SEQUENCE [like item])
			-- Append a copy of `s'.
		local
			new_count: INTEGER
		do
			new_count := count + s.count
			if new_count > capacity then
				grow (new_count)
			end
			across
				if s = Current then s.twin else s end as c
			loop
				extend (c.item)
			end
		end

	put_left (v: like item)
			-- Add `v' to the left of cursor position.
			-- Do not move cursor.
		do
			in_operation := True
			Precursor {ARRAYED_LIST} (v)
			in_operation := False

			added_item (v, index - 1)
		end

	put_right (v: like item)
			-- Add `v' to the right of cursor position.
			-- Do not move cursor.
		do
			in_operation := True
			Precursor {ARRAYED_LIST} (v)
			in_operation := False

			added_item (v, index + 1)
		end

	put_i_th (v: like i_th; i: INTEGER)
			-- Replace `i'-th entry, if in index interval, by `v'.
		local
			original_item: like item
		do
			original_item := i_th (i)
			in_operation := True
			Precursor {ARRAYED_LIST} (v, i)
			in_operation := False
				-- We currently have to test for `Void' because in `put_i_th'
				-- we don't know if we are replacing:
				-- 1 - an inserted item whose value was Void
				-- 2 - an unset item that has the default value of Void.
			if original_item /= Void then
				removed_item (original_item, i)
			end
			added_item (v, i)
		end

	replace (v: like item)
			-- Replace current item by `v'.
		local
			original_index: INTEGER
			original_item: like item
		do
			original_index := index
			original_item := item
			in_operation := True
			Precursor {ARRAYED_LIST} (v)
			in_operation := False

			removed_item (original_item, original_index)
			added_item (v, original_index)
		end

	remove
			-- Remove current item.
			-- Move cursor to right neighbor
			-- (or `after' if no right neighbor).
		local
			original_index: INTEGER
			original_item: like item
		do
			original_index := index
			original_item := item

			in_operation := True
			Precursor {ARRAYED_LIST}
			in_operation := False

			removed_item (original_item, original_index)
		end

	remove_right
			-- Remove item to the right of cursor position.
			-- Do not move cursor.
		local
			item_removed: like item
		do
			item_removed := i_th (index + 1)
			in_operation := True
			Precursor {ARRAYED_LIST}
			in_operation := False

			removed_item (item_removed, index + 1)
		end

	merge_left (other: like Current)
			-- Merge `other' into current structure after cursor
			-- position. Do not move cursor. Empty `other'
		local
			original_index: INTEGER
			original_other_count: INTEGER
		do
			original_index := index
			original_other_count := other.count
			index := index - 1
			merge_right (other)
			index := original_index + original_other_count
		end

	merge_right (other: like Current)
			-- Merge `other' into current structure before cursor
			-- position. Do not move cursor. Empty `other'
		local
			original_index: INTEGER
		do
			original_index := index
			in_operation := True
			Precursor {ARRAYED_LIST} (other)
			in_operation := False

			update_for_added (original_index + 1)
			go_i_th (original_index)
		end

	prune_all (v: like item)
			-- Remove all occurrences of `v'.
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		local
			i, nb: INTEGER
			offset: INTEGER
			res: BOOLEAN
			obj_cmp: BOOLEAN
			l_item: like item
			l_area: like area
		do
			obj_cmp := object_comparison
			from
				l_area := area
				i := 0
				nb := count
			until
				i = count
			loop
				if i < nb - offset then
					if offset > 0 then
						l_area.put (l_area.item (i + offset), i)
					end
					l_item := l_area.item (i)
					if obj_cmp then
						res := v ~ l_item
					else
						res := v = l_item
					end
					if res then
						removed_item (l_item, i + lower)
						offset := offset + 1
					else
						i := i + 1
					end
				else
					i := i + 1
				end
			end
			l_area.remove_tail (offset)
			index := count + 1
		ensure then
			is_after: after
		end

	update_for_added (start_index: INTEGER)
			-- Call `added_item' for all items from index `start_index' to `count'
		local
			l_index: INTEGER
		do
			l_index := index
			from
				go_i_th (start_index)
			until
				index > count
			loop
				added_item (item, index)
				forth
			end
			go_i_th (l_index)
		end

feature -- Removal

	wipe_out
			-- Remove all items.
		local
			l: like area
			i, l_count: INTEGER
		do
			l := area.twin
			l_count := count
			Precursor {ARRAYED_LIST}
			from
				i := 0
			until
				i = l_count
			loop
				on_item_removed_at (l @ i, 1)
				i := i + 1
			end
		end

feature {NONE} -- Implementation

	add_all (other: like Current; start_index: INTEGER)
			-- Call `on_item_added' for all elements in `other'.
		local
			cur: CURSOR
			current_index: INTEGER
		do
			current_index := start_index
			cur := other.cursor
			from
				other.start
			until
				other.after
			loop
				added_item (other.item, current_index)
				other.forth
				current_index := current_index + 1
			end
			other.go_to (cur)
		end

	in_operation: BOOLEAN
			-- Are we executing an operation from ARRAYED_LIST?

	added_item (an_item: like item; item_index: INTEGER)
			-- `an_item' is has been added.
		do
			if not in_operation then
				on_item_added_at (an_item, item_index)
			end
		end

	removed_item (an_item: like item; item_index: INTEGER)
			-- `an_item' has been removed.
		do
			if not in_operation then
				on_item_removed_at (an_item, item_index)
			end
		end

note
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2018, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
