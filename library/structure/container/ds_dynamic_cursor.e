indexing

	description:

		"Cursors for dynamically modifiable data structure traversals"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_DYNAMIC_CURSOR [G]

inherit

	DS_CURSOR [G]

feature -- Element change

	replace (v: G) is
			-- Replace item at cursor position by `v'.
		require
			not_off: not off
		deferred
		ensure
			replaced: item = v
		end

	swap (other: DS_DYNAMIC_CURSOR [G]) is
			-- Exchange items at current and `other''s positions.
			-- Note: cursors may reference two different containers.
		require
			not_off: not off
			other_not_void: other /= Void
			other_not_off: not other.off
		local
			v: G
		do
			if other /= Current then
				v := item
				replace (other.item)
				other.replace (v)
			end
		ensure
			new_item: item = old (other.item)
			new_other: other.item = old item
		end

end -- class DS_DYNAMIC_CURSOR
