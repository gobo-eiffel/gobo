indexing

	description:

		"Structures that can be extended"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_EXTENDIBLE [G]

inherit

	DS_CONTAINER [G]

feature -- Status report

	extendible (n: INTEGER): BOOLEAN is
			-- May structure be extended with `n' items?
		require
			positive_n: n >= 0
		deferred
		end

feature -- Access

	item: G is
			-- Item in structure
		require
			not_empty: not is_empty
		deferred
		end

feature -- Element change

	put (v: G) is
			-- Add `v' to structure.
		require
			extendible: extendible (1)
		deferred
		ensure
			one_more: count = old count + 1
		end

	force (v: G) is
			-- Add `v' to structure.
		deferred
		ensure
			one_more: count = old count + 1
		end

	extend (other: DS_LINEAR [G]) is
			-- Add items of `other' to structure.
		require
			other_not_void: other /= Void
			extendible: extendible (other.count)
		deferred
		ensure
			new_count: count = old count + other.count
		end

	append (other: DS_LINEAR [G]) is
			-- Add items of `other' to structure.
		require
			other_not_void: other /= Void
		deferred
		ensure
			new_count: count = old count + other.count
		end

feature -- Removal

	remove is
			-- Remove an item from structure.
		require
			not_empty: not is_empty
		deferred
		ensure
			one_less: count = old count - 1
		end

	prune (n: INTEGER) is
			-- Remove `n' items from structure.
		require
			valid_n: 0 <= n and n <= count
		deferred
		ensure
			new_count: count = old count - n
		end

	keep (n: INTEGER) is
			-- Keep `n' items in structure.
		require
			valid_n: 0 <= n and n <= count
		deferred
		ensure
			new_count: count = n
		end

end -- class DS_EXTENDIBLE
