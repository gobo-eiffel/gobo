indexing

	description:

		"Cursors for dynamically modifiable structure traversals"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_DYNAMIC_CURSOR [G]

inherit

	DS_CURSOR [G]

feature -- Element change

	put (v: G) is
			-- Replace item at cursor position by `v'.
		require
			valid_cursor: is_valid
			not_off: not off
		deferred
		ensure
			replaced: item = v
		end

feature -- Transformation

	swap (other: like Current) is
			-- Exchange items at current and `other' positions.
			-- Note: cursors may reference two different structures.
		require
			valid_cursor: is_valid
			not_off: not off
			other_not_void: other /= Void
			valid_other: other.is_valid
			other_not_off: not other.off
		local
			v: G
		do
			v := item
			put (other.item)
			other.put (v)
		ensure
			new_item: item = old other.item
			new_other: other.item = old item
		end

end -- class DS_DYNAMIC_CURSOR
