indexing

	description:

		"List structures"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_LIST [G]

inherit

	DS_BILINEAR [G]
		redefine
			new_cursor
		end

	DS_INDEXABLE [G]

feature -- Access

	index: INTEGER is
			-- Index of current internal cursor position
		do
			Result := internal_cursor.index
		ensure
			valid_index: valid_index (Result)
		end

	new_cursor: DS_LIST_CURSOR [G] is
			-- New external cursor for traversal
		deferred
		end

feature -- Status report

	valid_index (i: INTEGER): BOOLEAN is
			-- Is `i' a valid index value?
		do
			Result := 0 <= i and i <= (count + 1)
		ensure
			definition: Result = (0 <= i and i <= (count + 1))
		end

feature -- Cursor movement

	go_i_th (i: INTEGER) is
			-- Move internal cursor to `i'-th position.
		require
			valid_index: valid_index (i)
		do
			internal_cursor.go_i_th (i)
		ensure
			moved: index = i
		end

feature -- Element change

	put_left (v: G) is
			-- Add `v' to left of internal cursor position.
			-- Do not move cursors.
		require
			extendible: extendible (1)
			not_before: not before
		do
			put_left_cursor (v, internal_cursor)
		ensure
			one_more: count = old count + 1
		end

	put_left_cursor (v: G; a_cursor: like new_cursor) is
			-- Add `v' to left of `a_cursor' position.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.put_left (v)'.)
		require
			extendible: extendible (1)
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			not_before: not a_cursor.before
		deferred
		ensure
			one_more: count = old count + 1
		end

	put_right (v: G) is
			-- Add `v' to right of internal cursor position.
			-- Do not move cursors.
		require
			extendible: extendible (1)
			not_after: not after
		do
			put_right_cursor (v, internal_cursor)
		ensure
			one_more: count = old count + 1
		end

	put_right_cursor (v: G; a_cursor: like new_cursor) is
			-- Add `v' to right of `a_cursor' position.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.put_right (v)'.)
		require
			extendible: extendible (1)
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			not_after: not a_cursor.after
		deferred
		ensure
			one_more: count = old count + 1
		end

	force_left (v: G) is
			-- Add `v' to left of internal cursor position.
			-- Do not move cursors.
		require
			not_before: not before
		do
			force_left_cursor (v, internal_cursor)
		ensure
			one_more: count = old count + 1
		end

	force_left_cursor (v: G; a_cursor: like new_cursor) is
			-- Add `v' to left of `a_cursor' position.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.force_left (v)'.)
		require
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			not_before: not a_cursor.before
		deferred
		ensure
			one_more: count = old count + 1
		end

	force_right (v: G) is
			-- Add `v' to right of internal cursor position.
			-- Do not move cursors.
		require
			not_after: not after
		do
			force_right_cursor (v, internal_cursor)
		ensure
			one_more: count = old count + 1
		end

	force_right_cursor (v: G; a_cursor: like new_cursor) is
			-- Add `v' to right of `a_cursor' position.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.force_right (v)'.)
		require
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			not_after: not a_cursor.after
		deferred
		ensure
			one_more: count = old count + 1
		end

	replace_at (v: G) is
			-- Replace item at internal cursor position by `v'.
			-- Do not move cursors.
		require
			not_off: not off
		do
			internal_cursor.replace (v)
		ensure
			same_count: count = old count
			replaced: item_for_iteration = v
		end

	replace_at_cursor (v: G; a_cursor: like new_cursor) is
			-- Replace item at `a_cursor' position by `v'.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.replace (v)'.)
		require
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			not_off: not a_cursor.off
		do
			a_cursor.replace (v)
		ensure
			same_count: count = old count
			replaced: a_cursor.item = v
		end

	extend_left (other: DS_LINEAR [G]) is
			-- Add items of `other' to left of internal cursor position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
		require
			other_not_void: other /= Void
			extendible: extendible (other.count)
			not_before: not before
		do
			extend_left_cursor (other, internal_cursor)
		ensure
			new_count: count = old count + other.count
			same_order: (not other.is_empty) implies (item (old index) = other.first)
		end

	extend_left_cursor (other: DS_LINEAR [G]; a_cursor: like new_cursor) is
			-- Add items of `other' to left of `a_cursor' position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.extend_left (other)'.)
		require
			other_not_void: other /= Void
			extendible: extendible (other.count)
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			not_before: not a_cursor.before
		deferred
		ensure
			new_count: count = old count + other.count
			same_order: (not other.is_empty) implies (item (old (a_cursor.index)) = other.first)
		end

	extend_right (other: DS_LINEAR [G]) is
			-- Add items of `other' to right of internal cursor position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
		require
			other_not_void: other /= Void
			extendible: extendible (other.count)
			not_after: not after
		do
			extend_right_cursor (other, internal_cursor)
		ensure
			new_count: count = old count + other.count
			same_order: (not other.is_empty) implies (item (index + 1) = other.first)
		end

	extend_right_cursor (other: DS_LINEAR [G]; a_cursor: like new_cursor) is
			-- Add items of `other' to right of `a_cursor' position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.extend_right (other)'.)
		require
			other_not_void: other /= Void
			extendible: extendible (other.count)
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			not_after: not a_cursor.after
		deferred
		ensure
			new_count: count = old count + other.count
			same_order: (not other.is_empty) implies (item (a_cursor.index + 1) = other.first)
		end

	append_left (other: DS_LINEAR [G]) is
			-- Add items of `other' to left of internal cursor position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
		require
			other_not_void: other /= Void
			not_before: not before
		do
			append_left_cursor (other, internal_cursor)
		ensure
			new_count: count = old count + other.count
			same_order: (not other.is_empty) implies (item (old index) = other.first)
		end

	append_left_cursor (other: DS_LINEAR [G]; a_cursor: like new_cursor) is
			-- Add items of `other' to left of `a_cursor' position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.append_left (other)'.)
		require
			other_not_void: other /= Void
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			not_before: not a_cursor.before
		deferred
		ensure
			new_count: count = old count + other.count
			same_order: (not other.is_empty) implies (item (old (a_cursor.index)) = other.first)
		end

	append_right (other: DS_LINEAR [G]) is
			-- Add items of `other' to right of internal cursor position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
		require
			other_not_void: other /= Void
			not_after: not after
		do
			append_right_cursor (other, internal_cursor)
		ensure
			new_count: count = old count + other.count
			same_order: (not other.is_empty) implies (item (index + 1) = other.first)
		end

	append_right_cursor (other: DS_LINEAR [G]; a_cursor: like new_cursor) is
			-- Add items of `other' to right of `a_cursor' position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
			-- (Synonym of `a_cursor.append_right (other)'.)
		require
			other_not_void: other /= Void
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			not_after: not a_cursor.after
		deferred
		ensure
			new_count: count = old count + other.count
			same_order: (not other.is_empty) implies (item (a_cursor.index + 1) = other.first)
		end

feature -- Removal

	remove_at is
			-- Remove item at internal cursor position.
			-- Move any cursors at this position `forth'.
		require
			not_off: not off
		do
			remove_at_cursor (internal_cursor)
		ensure
			one_less: count = old count - 1
		end

	remove_at_cursor (a_cursor: like new_cursor) is
			-- Remove item at `a_cursor' position.
			-- Move any cursors at this position `forth'.
			-- (Synonym of `a_cursor.remove'.)
		require
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			not_off: not a_cursor.off
		deferred
		ensure
			one_less: count = old count - 1
		end

	remove_left is
			-- Remove item to left of internal cursor position.
			-- Move any cursors at this position `forth'.
		require
			not_empty: not is_empty
			not_before: not before
			not_first: not is_first
		do
			remove_left_cursor (internal_cursor)
		ensure
			one_less: count = old count - 1
		end

	remove_left_cursor (a_cursor: like new_cursor) is
			-- Remove item to left of `a_cursor' position.
			-- Move any cursors at this position `forth'.
			-- (Synonym of `a_cursor.remove_left'.)
		require
			not_empty: not is_empty
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			not_before: not a_cursor.before
			not_first: not a_cursor.is_first
		deferred
		ensure
			one_less: count = old count - 1
		end

	remove_right is
			-- Remove item to right of internal cursor position.
			-- Move any cursors at this position `forth'.
		require
			not_empty: not is_empty
			not_after: not after
			not_last: not is_last
		do
			remove_right_cursor (internal_cursor)
		ensure
			one_less: count = old count - 1
		end

	remove_right_cursor (a_cursor: like new_cursor) is
			-- Remove item to right of `a_cursor' position.
			-- Move any cursors at this position `forth'.
			-- (Synonym of `a_cursor.remove_right'.)
		require
			not_empty: not is_empty
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			not_after: not a_cursor.after
			not_last: not a_cursor.is_last
		deferred
		ensure
			one_less: count = old count - 1
		end

	prune_left (n: INTEGER) is
			-- Remove `n' items to left of internal cursor position.
			-- Move all cursors `off'.
		require
			valid_n: 0 <= n and n < index
		do
			prune_left_cursor (n, internal_cursor)
		ensure
			new_count: count = old count - n
		end

	prune_left_cursor (n: INTEGER; a_cursor: like new_cursor) is
			-- Remove `n' items to left of `a_cursor' position.
			-- Move all cursors `off'.
			-- (Synonym of `a_cursor.prune_left (n)'.)
		require
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			valid_n: 0 <= n and n < a_cursor.index
		deferred
		ensure
			new_count: count = old count - n
		end

	prune_right (n: INTEGER) is
			-- Remove `n' items to right of internal cursor position.
			-- Move all cursors `off'.
		require
			valid_n: 0 <= n and n <= (count - index)
		do
			prune_right_cursor (n, internal_cursor)
		ensure
			new_count: count = old count - n
		end

	prune_right_cursor (n: INTEGER; a_cursor: like new_cursor) is
			-- Remove `n' items to right of `a_cursor' position.
			-- Move all cursors `off'.
			-- (Synonym of `a_cursor.prune_right (n)'.)
		require
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			valid_n: 0 <= n and n <= (count - a_cursor.index)
		deferred
		ensure
			new_count: count = old count - n
		end

	delete (v: G) is
			-- Remove all occurrences of `v'.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move all cursors `off'.
		deferred
		ensure
			deleted: not has (v)
			new_count: count = old (count - occurrences (v))
		end

end -- class DS_LIST
