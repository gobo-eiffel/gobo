indexing

	description:

		"Data structures whose items are accessible through keys"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2000, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_TABLE [G, K]

inherit

	DS_CONTAINER [G]

feature -- Access

	infix "@", item (k: K): G is
			-- Item associated with `k'
		require
			has_k: has (k)
		deferred
		end

feature -- Status report

	valid_key (k: K): BOOLEAN is
			-- Is `k' a valid key?
		deferred
		end

	has (k: K): BOOLEAN is
			-- Is there an item associated with `k'?
		deferred
		ensure
			valid_key: Result implies valid_key (k)
		end

feature -- Element change

	replace (v: G; k: K) is
			-- Replace item associated with `k' by `v'.
		require
			has_k: has (k)
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
			inserted: has (k) and then item (k) = v
			same_count: (old has (k)) implies (count = old count)
			one_more: (not old has (k)) implies (count = old count + 1)
		end

	put_new (v: G; k: K) is
			-- Associate `v' with key `k'.
		require
			valid_key: valid_key (k)
			new_item: not has (k)
		deferred
		ensure
			one_more: count = old count + 1
			inserted: has (k) and then item (k) = v
		end

	swap (k, l: K) is
			-- Exchange items associated with `k' and `l'.
		require
			valid_k: has (k)
			valid_l: has (l)
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

feature -- Removal

	remove (k: K) is
			-- Remove item associated with `k'.
		require
			valid_key: valid_key (k)
		deferred
		ensure
			same_count: (not old has (k)) implies (count = old count)
			one_less: (old has (k)) implies (count = old count - 1)
			removed: not has (k)
		end

end -- class DS_TABLE
