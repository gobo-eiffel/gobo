indexing

	description:

		"Cursors for list traversals"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_LIST_CURSOR [G]

inherit

	DS_BILINEAR_CURSOR [G]
		redefine
			container
		end

	DS_DYNAMIC_CURSOR [G]
		redefine
			container
		end

	DS_INDEXED_CURSOR [G]
		redefine
			container
		end

feature -- Access

	container: DS_LIST [G] is
			-- List traversed
		deferred
		end

feature -- Status report

	valid_index (i: INTEGER): BOOLEAN is
			-- Is `i' a valid index value?
		do
			Result := (0 <= i and i <= (container.count + 1))
		ensure then
			definition: Result = (0 <= i and i <= (container.count + 1))
		end

feature -- Element change

	put_left (v: G) is
			-- Add `v' to left of cursor position.
			-- Do not move cursors.
		require
			extendible: container.extendible (1)
			not_before: not before
		do
			container.put_left_cursor (v, Current)
		ensure
			one_more: container.count = old (container.count) + 1
		end

	put_right (v: G) is
			-- Add `v' to right of cursor position.
			-- Do not move cursors.
		require
			extendible: container.extendible (1)
			not_after: not after
		do
			container.put_right_cursor (v, Current)
		ensure
			one_more: container.count = old (container.count) + 1
		end

	force_left (v: G) is
			-- Add `v' to left of cursor position.
			-- Do not move cursors.
		require
			not_before: not before
		do
			container.force_left_cursor (v, Current)
		ensure
			one_more: container.count = old (container.count) + 1
		end

	force_right (v: G) is
			-- Add `v' to right of cursor position.
			-- Do not move cursors.
		require
			not_after: not after
		do
			container.force_right_cursor (v, Current)
		ensure
			one_more: container.count = old (container.count) + 1
		end

	extend_left (other: DS_LINEAR [G]) is
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
			new_count: container.count = old (container.count) + other.count
		end

	extend_right (other: DS_LINEAR [G]) is
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
			new_count: container.count = old (container.count) + other.count
		end

	append_left (other: DS_LINEAR [G]) is
			-- Add items of `other' to left of cursor position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
		require
			other_not_void: other /= Void
			not_before: not before
		do
			container.append_left_cursor (other, Current)
		ensure
			new_count: container.count = old (container.count) + other.count
		end

	append_right (other: DS_LINEAR [G]) is
			-- Add items of `other' to right of cursor position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
		require
			other_not_void: other /= Void
			not_after: not after
		do
			container.append_right_cursor (other, Current)
		ensure
			new_count: container.count = old (container.count) + other.count
		end

feature -- Removal

	remove is
			-- Remove item at cursor position.
			-- Move any cursors at this position `forth'.
		require
			not_off: not off
		do
			container.remove_at_cursor (Current)
		ensure
			one_less: container.count = old (container.count) - 1
		end

	remove_left is
			-- Remove item to left of cursor position.
			-- Move any cursors at this position `forth'.
		require
			not_empty: not container.is_empty
			not_before: not before
			not_first: not is_first
		do
			container.remove_left_cursor (Current)
		ensure
			one_less: container.count = old (container.count) - 1
		end

	remove_right is
			-- Remove item to right of cursor position.
			-- Move any cursors at this position `forth'.
		require
			not_empty: not container.is_empty
			not_after: not after
			not_last: not is_last
		do
			container.remove_right_cursor (Current)
		ensure
			one_less: container.count = old (container.count) - 1
		end

	prune_left (n: INTEGER) is
			-- Remove `n' items to left of cursor position.
			-- Move all cursors `off'.
		require
			valid_n: 0 <= n and n < index
		do
			container.prune_left_cursor (n, Current)
		ensure
			new_count: container.count = old (container.count) - n
		end

	prune_right (n: INTEGER) is
			-- Remove `n' items to right of cursor position.
			-- Move all cursors `off'.
		require
			valid_n: 0 <= n and n <= (container.count - index)
		do
			container.prune_right_cursor (n, Current)
		ensure
			new_count: container.count = old (container.count) - n
		end

end -- class DS_LIST_CURSOR
