note

	description:

		"Cursors for dynamically modifiable data structure traversals"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2018, Eric Bezault and others"
	license: "MIT License"

deferred class DS_DYNAMIC_CURSOR [G]

inherit

	DS_CURSOR [G]

feature -- Element change

	replace (v: G)
			-- Replace item at cursor position by `v'.
		require
			not_off: not off
		deferred
		ensure
			replaced: {KL_TYPE [G]}.same_objects (item, v)
		end

	swap (other: DS_DYNAMIC_CURSOR [G])
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
			new_item: {KL_TYPE [G]}.same_objects (item, old (other.item))
			new_other: {KL_TYPE [G]}.same_objects (other.item, old item)
		end

end
