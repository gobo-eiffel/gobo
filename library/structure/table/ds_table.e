indexing

	description:

		"Structures whose items are accessible through keys"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_TABLE [G, K]

inherit

	DS_CONTAINER [G]

feature -- Access

	infix "@", item (k: K): G is
			-- Item associated with `k'
		require
			valid_entry: valid_entry (k)
		deferred
		end

feature -- Status report

	valid_key (k: K): BOOLEAN is
			-- Is `k' a valid key?
		deferred
		end

	valid_entry (k: K): BOOLEAN is
			-- Is there an item associated with `k'?
		deferred
		ensure
			valid_key: Result implies valid_key (k)
		end

feature -- Element change

	replace (v: G; k: K) is
			-- Replace item associated with `k' by `v'.
		require
			valid_entry: valid_entry (k)
		deferred
		ensure
			replaced: item (k) = v
			same_count: count = old count
		end

	put (v: G; k: K) is
			-- Associate `v' with key `k'.
		require
			valid_key: valid_key (k)
		deferred
		ensure
			valid_entry: valid_entry (k)
			inserted: item (k) = v
		end

feature -- Removal

	remove (k: K) is
			-- Remove item associated with `k'.
		require
			valid_entry: valid_entry (k)
		deferred
		ensure
			one_less: count = old count - 1
		end

feature -- Transformation

	swap (k, l: K) is
			-- Exchange items associated with `k' and `l'.
		require
			valid_k: valid_entry (k)
			valid_l: valid_entry (l)
		local
			v: G
		do
			v := item (k)
			replace (item (l), k)
			replace (v, l)
		ensure
			same_count: count = old count
			new_k: item (k) = old item (l)
			new_l: item (l) = old item (k)
		end

end -- class DS_TABLE
