indexing

	description:

		"Structures that can be dynamically modified"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_DYNAMIC [G]

inherit

	DS_BILINEAR [G]

	DS_EXTENDIBLE [G]
		rename
			item as first,
			put as put_first,
			force as force_first,
			extend as extend_first,
			append as append_first,
			remove as remove_first,
			prune as prune_first,
			keep as keep_first
		redefine
			put_first, force_first
		end

feature -- Element change

	put_first (v: G) is
			-- Add `v' to beginning of structure.
		deferred
		ensure then
			inserted: first = v
		end

	put_last (v: G) is
			-- Add `v' to end of structure.
		require
			extendible: extendible (1)
		deferred
		ensure
			one_more: count = old count + 1
			inserted: last = v
		end

	put_left (v: G; a_cursor: like new_cursor) is
			-- Add `v' to left of `a_cursor' position.
		require
			extendible: extendible (1)
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			not_before: not a_cursor.before
		deferred
		ensure
			one_more: count = old count + 1
		end

	put_right (v: G; a_cursor: like new_cursor) is
			-- Add `v' to right of `a_cursor' position.
		require
			extendible: extendible (1)
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			not_after: not a_cursor.after
		deferred
		ensure
			one_more: count = old count + 1
		end

	force_first (v: G) is
			-- Add `v' to beginning of structure.
		deferred
		ensure then
			inserted: first = v
		end

	force_last (v: G) is
			-- Add `v' to end of structure.
		deferred
		ensure
			one_more: count = old count + 1
			inserted: last = v
		end

	force_left (v: G; a_cursor: like new_cursor) is
			-- Add `v' to left of `a_cursor' position.
		require
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			not_before: not a_cursor.before
		deferred
		ensure
			one_more: count = old count + 1
		end

	force_right (v: G; a_cursor: like new_cursor) is
			-- Add `v' to right of `a_cursor' position.
		require
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			not_after: not a_cursor.after
		deferred
		ensure
			one_more: count = old count + 1
		end

	extend_last (other: DS_LINEAR [G]) is
			-- Add items of `other' to end of structure.
		require
			other_not_void: other /= Void
			extendible: extendible (other.count)
		deferred
		ensure
			new_count: count = old count + other.count
		end

	extend_left (other: DS_LINEAR [G]; a_cursor: like new_cursor) is
			-- Add items of `other' to left of `a_cursor' position.
		require
			other_not_void: other /= Void
			extendible: extendible (other.count)
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			not_before: not a_cursor.before
		deferred
		ensure
			new_count: count = old count + other.count
		end

	extend_right (other: DS_LINEAR [G]; a_cursor: like new_cursor) is
			-- Add items of `other' to right of `a_cursor' position.
		require
			other_not_void: other /= Void
			extendible: extendible (other.count)
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			not_after: not a_cursor.after
		deferred
		ensure
			new_count: count = old count + other.count
		end
	
	append_last (other: DS_LINEAR [G]) is
			-- Add items of `other' to end of structure.
		require
			other_not_void: other /= Void
		deferred
		ensure
			new_count: count = old count + other.count
		end

	append_left (other: DS_LINEAR [G]; a_cursor: like new_cursor) is
			-- Add items of `other' to left of `a_cursor' position.
		require
			other_not_void: other /= Void
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			not_before: not a_cursor.before
		deferred
		ensure
			new_count: count = old count + other.count
		end

	append_right (other: DS_LINEAR [G]; a_cursor: like new_cursor) is
			-- Add items of `other' to right of `a_cursor' position.
		require
			other_not_void: other /= Void
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			not_after: not a_cursor.after
		deferred
		ensure
			new_count: count = old count + other.count
		end
	
feature -- Removal

	remove_at (a_cursor: like new_cursor) is
			-- Remove item at `a_cursor' position.
			-- Move `a_cursor' to next position.
		require
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			not_off: not a_cursor.off
		deferred
		ensure
			one_less: count = old count - 1
		end

	remove_last is
			-- Remove last item from structure.
		require
			not_empty: not is_empty
		deferred
		ensure
			one_less: count = old count - 1
		end

	remove_left (a_cursor: like new_cursor) is
			-- Remove item to left of `a_cursor' position.
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

	remove_right (a_cursor: like new_cursor) is
			-- Remove item to right of `a_cursor' position.
		require
			not_empty: not is_empty
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			not_before: not a_cursor.after
			not_first: not a_cursor.is_last
		deferred
		ensure
			one_less: count = old count - 1
		end

	prune_last (n: INTEGER) is
			-- Remove `n' last items from structure.
		require
			valid_n: 0 <= n and n <= count
		deferred
		ensure
			new_count: count = old count - n
		end

	prune_left (n: INTEGER; a_cursor: like new_cursor) is
			-- Remove `n' items to left of `a_cursor' position.
		require
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			valid_n: 0 <= n and n < a_cursor.index
		deferred
		ensure
			new_count: count = old count - n
		end

	prune_right (n: INTEGER; a_cursor: like new_cursor) is
			-- Remove `n' items to right of `a_cursor' position.
		require
			cursor_not_void: a_cursor /= Void
			valid_cursor: valid_cursor (a_cursor)
			valid_n: 0 <= n and n <= count - a_cursor.index
		deferred
		ensure
			new_count: count = old count - n
		end

	keep_last (n: INTEGER) is
			-- Keep `n' last items in structure.
		require
			valid_n: 0 <= n and n <= count
		deferred
		ensure
			new_count: count = n
		end

	delete (v: G) is
			-- Remove all occurrences of `v'.
			-- (Use `searcher''s comparison criterion.)
		deferred
		ensure
			deleted: not has (v)
		end

end -- class DS_DYNAMIC
