indexing

	description:

		"EiffelBase INDEXABLE class interface"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class INDEXABLE [G, H -> INTEGER]

inherit

	CONTAINER [G]
		rename
			put as bag_put
		end

feature -- Access

	item, infix "@" (k: H): G is
			-- Entry of key `k'.
		require
			valid_index: valid_index (k)
		deferred
		end

feature -- Measurement

	occurrences (v: G): INTEGER is
			-- Number of times `v' appears in structure
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		deferred
		ensure
			non_negative_occurrences: Result >= 0
		end

feature -- Status report

	prunable: BOOLEAN is
			-- May items be removed?
		deferred
		end

	valid_index (k: H): BOOLEAN is
			-- Is `k' a valid index?
		deferred
		end

feature -- Element change

	extend (v: G) is
			-- Add a new occurrence of `v'.
		require
			extendible: extendible
		deferred
		ensure
			item_inserted: has (v)
			one_more_occurrence: occurrences (v) = old (occurrences (v)) + 1
		end

	fill (other: CONTAINER [G]) is
			-- Fill with as many items of `other' as possible.
			-- The representations of `other' and current structure
			-- need not be the same.
		require
			other_not_void: other /= Void
			extendible
		local
			lin_rep: LINEAR [G]
		do
			lin_rep := other.linear_representation
			from
				lin_rep.start
			until
				not extendible or else lin_rep.off
			loop
				extend (lin_rep.item)
				lin_rep.forth
			end
		end

	put (v: G; k: H) is
			-- Associate value `v' with key `k'.
		require
			valid_index: valid_index (k)
		deferred
		ensure
			insertion_done: item (k) = v
		end

feature -- Removal

	prune (v: G) is
			-- Remove one occurrence of `v' if any.
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		require
			prunable: prunable
		deferred
		end

	prune_all (v: G) is
			-- Remove all occurrences of `v'.
			-- (Reference or object equality,
			-- based on `object_comparison'.)
			--|Default implementation, usually inefficient.
		require
			prunable
		do
			from
			until not has (v) loop
				prune (v)
			end
		ensure
			no_more_occurrences: not has (v)
		end

feature {NONE} -- Inapplicable

	bag_put (v: G) is do end

end -- class INDEXABLE
