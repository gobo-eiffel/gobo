note

	description:

		"List structures"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_LIST [G]

inherit

	DS_BILINEAR [G]
		redefine
			new_cursor
		end

	DS_INDEXABLE [G]

feature -- Access

	index: INTEGER
			-- Index of current internal cursor position
		do
			Result := cursor_index (internal_cursor)
		ensure
			valid_index: valid_index (Result)
		end

	new_cursor: DS_LIST_CURSOR [G]
			-- New external cursor for traversal
		deferred
		end

feature -- Status report

	valid_index (i: INTEGER): BOOLEAN
			-- Is `i' a valid index value?
		do
			Result := 0 <= i and i <= (count + 1)
		ensure
			definition: Result = (0 <= i and i <= (count + 1))
		end

feature -- Cursor movement

	go_i_th (i: INTEGER)
			-- Move internal cursor to `i'-th position.
		require
			valid_index: valid_index (i)
		do
			cursor_go_i_th (internal_cursor, i)
		ensure
			moved: index = i
		end

feature -- Element change

	put_left (v: G)
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

	put_left_cursor (v: G; a_cursor: like new_cursor)
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

	put_right (v: G)
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

	put_right_cursor (v: G; a_cursor: like new_cursor)
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

	force_left (v: G)
			-- Add `v' to left of internal cursor position.
			-- Do not move cursors.
		require
			not_before: not before
		do
			force_left_cursor (v, internal_cursor)
		ensure
			one_more: count = old count + 1
		end

	force_left_cursor (v: G; a_cursor: like new_cursor)
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

	force_right (v: G)
			-- Add `v' to right of internal cursor position.
			-- Do not move cursors.
		require
			not_after: not after
		do
			force_right_cursor (v, internal_cursor)
		ensure
			one_more: count = old count + 1
		end

	force_right_cursor (v: G; a_cursor: like new_cursor)
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

	replace_at (v: G)
			-- Replace item at internal cursor position by `v'.
			-- Do not move cursors.
		require
			not_off: not off
		do
			internal_cursor.replace (v)
		ensure
			same_count: count = old count
			replaced: {KL_TYPE [G]}.same_objects (item_for_iteration, v)
		end

	replace_at_cursor (v: G; a_cursor: like new_cursor)
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
			replaced: {KL_TYPE [G]}.same_objects (a_cursor.item, v)
		end

	extend_left (other: DS_LINEAR [G])
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
			new_count: count = old count + old other.count
			same_order: (not other.is_empty) implies ({KL_TYPE [G]}.same_objects (item (old index), other.first))
		end

	extend_left_cursor (other: DS_LINEAR [G]; a_cursor: like new_cursor)
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
			new_count: count = old count + old other.count
			same_order: (not other.is_empty) implies ({KL_TYPE [G]}.same_objects (item (old (a_cursor.index)), other.first))
		end

	extend_right (other: DS_LINEAR [G])
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
			new_count: count = old count + old other.count
			same_order: (not other.is_empty) implies ({KL_TYPE [G]}.same_objects (item (index + 1), other.first))
		end

	extend_right_cursor (other: DS_LINEAR [G]; a_cursor: like new_cursor)
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
			new_count: count = old count + old other.count
			same_order: (not other.is_empty) implies ({KL_TYPE [G]}.same_objects (item (a_cursor.index + 1), other.first))
		end

	append_left (other: DS_LINEAR [G])
			-- Add items of `other' to left of internal cursor position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
		require
			other_not_void: other /= Void
			not_before: not before
		do
			append_left_cursor (other, internal_cursor)
		ensure
			new_count: count = old count + old other.count
			same_order: (not other.is_empty) implies ({KL_TYPE [G]}.same_objects (item (old index), other.first))
		end

	append_left_cursor (other: DS_LINEAR [G]; a_cursor: like new_cursor)
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
			new_count: count = old count + old other.count
			same_order: (not other.is_empty) implies ({KL_TYPE [G]}.same_objects (item (old (a_cursor.index)), other.first))
		end

	append_right (other: DS_LINEAR [G])
			-- Add items of `other' to right of internal cursor position.
			-- Keep items of `other' in the same order.
			-- Do not move cursors.
		require
			other_not_void: other /= Void
			not_after: not after
		do
			append_right_cursor (other, internal_cursor)
		ensure
			new_count: count = old count + old other.count
			same_order: (not other.is_empty) implies ({KL_TYPE [G]}.same_objects (item (index + 1), other.first))
		end

	append_right_cursor (other: DS_LINEAR [G]; a_cursor: like new_cursor)
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
			new_count: count = old count + old other.count
			same_order: (not other.is_empty) implies ({KL_TYPE [G]}.same_objects (item (a_cursor.index + 1), other.first))
		end

feature -- Removal

	remove_at
			-- Remove item at internal cursor position.
			-- Move any cursors at this position `forth'.
		require
			not_off: not off
		do
			remove_at_cursor (internal_cursor)
		ensure
			one_less: count = old count - 1
		end

	remove_at_cursor (a_cursor: like new_cursor)
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

	remove_left
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

	remove_left_cursor (a_cursor: like new_cursor)
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

	remove_right
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

	remove_right_cursor (a_cursor: like new_cursor)
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

	prune_left (n: INTEGER)
			-- Remove `n' items to left of internal cursor position.
			-- Move all cursors `off'.
		require
			valid_n: 0 <= n and n < index
		do
			prune_left_cursor (n, internal_cursor)
		ensure
			new_count: count = old count - n
		end

	prune_left_cursor (n: INTEGER; a_cursor: like new_cursor)
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

	prune_right (n: INTEGER)
			-- Remove `n' items to right of internal cursor position.
			-- Move all cursors `off'.
		require
			valid_n: 0 <= n and n <= (count - index)
		do
			prune_right_cursor (n, internal_cursor)
		ensure
			new_count: count = old count - n
		end

	prune_right_cursor (n: INTEGER; a_cursor: like new_cursor)
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

	delete (v: G)
			-- Remove all occurrences of `v'.
			-- (Use `equality_tester''s comparison criterion
			-- if not void, use `=' criterion otherwise.)
			-- Move all cursors `off'.
		deferred
		ensure
			deleted: not has (v)
			new_count: count = old (count - occurrences (v))
		end

feature {DS_LIST_CURSOR} -- Cursor implementation

	cursor_index (a_cursor: like new_cursor): INTEGER
			-- Index of `a_cursor''s current position
		require
			cursor_not_void: a_cursor /= Void
			a_cursor_valid: valid_cursor (a_cursor)
		deferred
		ensure
			valid_index: valid_index (Result)
		end

	cursor_go_i_th (a_cursor: like new_cursor; i: INTEGER)
			-- Move `a_cursor' to `i'-th position.
		require
			cursor_not_void: a_cursor /= Void
			a_cursor_valid: valid_cursor (a_cursor)
			valid_index: valid_index (i)
		deferred
		ensure
			moved: cursor_index (a_cursor) = i
		end

end
