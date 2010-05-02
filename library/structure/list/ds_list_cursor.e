note

	description:

		"Cursors for list traversals"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_LIST_CURSOR [G]

inherit

	DS_BILINEAR_CURSOR [G]
		redefine
			container,
			next_cursor
		end

	DS_DYNAMIC_CURSOR [G]
		redefine
			container,
			next_cursor
		end

	DS_INDEXED_CURSOR [G]
		redefine
			container,
			next_cursor
		end

feature -- Access

	index: INTEGER
			-- Index of current position
		do
			Result := container.cursor_index (Current)
		end

	container: DS_LIST [G]
			-- List traversed
		deferred
		end

feature -- Status report

	valid_index (i: INTEGER): BOOLEAN
			-- Is `i' a valid index value?
		do
			Result := (0 <= i and i <= (container.count + 1))
		ensure then
			i_large_enough: Result implies (i >= 0)
			i_small_enough: Result implies (i <= (container.count + 1))
		end

feature -- Cursor movement

	go_i_th (i: INTEGER)
			-- Move cursor to `i'-th position.
		do
			container.cursor_go_i_th (Current, i)
		end

feature -- Element change

	put_left (v: G)
			-- Add `v' to left of cursor position.
			-- Do not move cursors.
		require
			extendible: container.extendible (1)
			not_before: not before
		do
			container.put_left_cursor (v, Current)
		ensure
			one_more: container.count = old container.count + 1
		end

	put_right (v: G)
			-- Add `v' to right of cursor position.
			-- Do not move cursors.
		require
			extendible: container.extendible (1)
			not_after: not after
		do
			container.put_right_cursor (v, Current)
		ensure
			one_more: container.count = old container.count + 1
		end

	force_left (v: G)
			-- Add `v' to left of cursor position.
			-- Do not move cursors.
		require
			not_before: not before
		do
			container.force_left_cursor (v, Current)
		ensure
			one_more: container.count = old container.count + 1
		end

	force_right (v: G)
			-- Add `v' to right of cursor position.
			-- Do not move cursors.
		require
			not_after: not after
		do
			container.force_right_cursor (v, Current)
		ensure
			one_more: container.count = old container.count + 1
		end

	extend_left (other: DS_LINEAR [G])
			-- Add items of `other' to left of cursor position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
		require
			other_not_void: other /= Void
			extendible: container.extendible (other.count)
			not_before: not before
		do
			container.extend_left_cursor (other, Current)
		ensure
			new_count: container.count = old container.count + old other.count
		end

	extend_right (other: DS_LINEAR [G])
			-- Add items of `other' to right of cursor position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
		require
			other_not_void: other /= Void
			extendible: container.extendible (other.count)
			not_after: not after
		do
			container.extend_right_cursor (other, Current)
		ensure
			new_count: container.count = old container.count + old other.count
		end

	append_left (other: DS_LINEAR [G])
			-- Add items of `other' to left of cursor position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
		require
			other_not_void: other /= Void
			not_before: not before
		do
			container.append_left_cursor (other, Current)
		ensure
			new_count: container.count = old container.count + old other.count
		end

	append_right (other: DS_LINEAR [G])
			-- Add items of `other' to right of cursor position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
		require
			other_not_void: other /= Void
			not_after: not after
		do
			container.append_right_cursor (other, Current)
		ensure
			new_count: container.count = old container.count + old other.count
		end

feature -- Removal

	remove
			-- Remove item at cursor position.
			-- Move any cursors at this position `forth'.
		require
			not_off: not off
		do
			container.remove_at_cursor (Current)
		ensure
			one_less: container.count = old container.count - 1
		end

	remove_left
			-- Remove item to left of cursor position.
			-- Move any cursors at this position `forth'.
		require
			not_empty: not container.is_empty
			not_before: not before
			not_first: not is_first
		do
			container.remove_left_cursor (Current)
		ensure
			one_less: container.count = old container.count - 1
		end

	remove_right
			-- Remove item to right of cursor position.
			-- Move any cursors at this position `forth'.
		require
			not_empty: not container.is_empty
			not_after: not after
			not_last: not is_last
		do
			container.remove_right_cursor (Current)
		ensure
			one_less: container.count = old container.count - 1
		end

	prune_left (n: INTEGER)
			-- Remove `n' items to left of cursor position.
			-- Move all cursors `off'.
		require
			valid_n: 0 <= n and n < index
		do
			container.prune_left_cursor (n, Current)
		ensure
			new_count: container.count = old container.count - n
		end

	prune_right (n: INTEGER)
			-- Remove `n' items to right of cursor position.
			-- Move all cursors `off'.
		require
			valid_n: 0 <= n and n <= (container.count - index)
		do
			container.prune_right_cursor (n, Current)
		ensure
			new_count: container.count = old container.count - n
		end

feature {DS_LIST} -- Implementation

	next_cursor: DS_LIST_CURSOR [G]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

end
