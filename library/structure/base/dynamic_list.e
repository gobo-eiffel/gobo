indexing

	description:

		"EiffelBase DYNAMIC_LIST class interface"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DYNAMIC_LIST [G]

inherit

	LIST [G]
		undefine
			has, copy, is_equal
		end

feature -- Status report

	extendible: BOOLEAN is True
			-- May new items be added?

	prunable: BOOLEAN is
			-- May items be removed? (Answer: yes.)
		do
			Result := True
		end

feature -- Element change

	put_front (v: G) is
			-- Add `v' at beginning.
			-- Do not move cursor.
		deferred
		ensure
	 		new_count: count = old count + 1
			item_inserted: first = v
		end

	put_left (v: G) is
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

	put_right (v: G) is
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
			not_off: not before
			other_exists: other /= void
		deferred
		ensure
			new_count: count = old count + old other.count
			new_index: index = old index + old other.count
			other_is_empty: other.empty
		end

	merge_right (other: like Current) is
			-- Merge `other' into current structure after cursor
			-- position. Do not move cursor. Empty `other'.
		require
			extendible: extendible
			not_off: not after
			other_exists: other /= void
		deferred
		ensure
			new_count: count = old count + old other.count
			same_index: index = old index
			other_is_empty: other.empty
		end

feature -- Removal

	remove_left is
			-- Remove item to the left of cursor position.
			-- Do not move cursor.
		require
			not_before: not before
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

invariant

	extendible: extendible

end -- class DYNAMIC_LIST
