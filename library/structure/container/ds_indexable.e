indexing

	description:

		"Structures that can be traversed and %
		%modified through integer access";

	library:    "Gobo Eiffel Structure Library";
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

deferred class DS_INDEXABLE [G]

inherit

	DS_TABLE [G, INTEGER]
		rename
			valid_key as valid_index,
			put as force
		redefine
			force
		end

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
			first,
			put_first, force_first
		end

	DS_SORTABLE [G]

feature -- Access

	first: G is
			-- First item in structure
		deferred
		ensure then
			definition: Result = item (1)
		end

	last: G is
			-- Last item in structure
		require
			not_empty: not is_empty
		deferred
		ensure
			definition: Result = item (count)
		end

feature -- Status report

	valid_entry (i: INTEGER): BOOLEAN is
			-- Is there an item at index `i'?
		do
			Result := 1 <= i and i <= count
		ensure then
			definition: Result = (1 <= i and i <= count)
		end

	valid_index (i: INTEGER): BOOLEAN is
			-- Is `i' a valid index?
		do
			Result := 1 <= i and i <= count + 1
		ensure then
			definition: Result = (1 <= i and i <= count + 1)
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

	put (v: G; i: INTEGER) is
			-- Add `v' at `i'-th position.
		require
			extendible: extendible (1)
			valid_index: valid_index (i)
		deferred
		ensure
			one_more: count = old count + 1
			valid_entry: valid_entry (i)
			inserted: item (i) = v
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

	force (v: G; i: INTEGER) is
			-- Add `v' at `i'-th position.
		deferred
		ensure then
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

	extend (other: DS_LINEAR [G]; i: INTEGER) is
			-- Add items of `other' at `i'-th position.
		require
			other_not_void: other /= Void
			extendible: extendible (other.count)
			valid_index: valid_index (i)
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

	append (other: DS_LINEAR [G]; i: INTEGER) is
			-- Add items of `other' at `i'-th position.
		require
			other_not_void: other /= Void
			valid_index: valid_index (i)
		deferred
		ensure
			new_count: count = old count + other.count
		end

feature -- Removal

	remove_last is
			-- Remove last item from structure.
		require
			not_empty: not is_empty
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

	prune (n: INTEGER; i: INTEGER) is
			-- Remove `n' items at and after `i'-th position.
		require
			valid_entry: valid_entry (i)
			valid_n: 0 <= n and n <= count - i + 1
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

end -- class DS_INDEXABLE
