indexing

	description:

		"EiffelBase ACTIVE class interface"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ACTIVE [G]

inherit

	CONTAINER [G]
		rename
			count as ds_count
		end

feature -- Access

	item: G is
			-- Current item
		require
			readable: readable
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

	readable: BOOLEAN is
			-- Is there a current item that may be read?
		deferred
		end

	writable: BOOLEAN is
			-- Is there a current item that may be modified?
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

	replace (v: G) is
			-- Replace current item by `v'.
		require
			writable: writable
		deferred
		ensure
			item_replaced: item = v
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

feature -- Removal

	remove is
			-- Remove current item.
		require
			prunable: prunable
			writable: writable
		deferred
		end

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

invariant

	writable_constraint: writable implies readable
	empty_constraint: empty implies (not readable) and (not writable)

end -- class ACTIVE
