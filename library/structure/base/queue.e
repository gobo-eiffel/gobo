indexing

	description:

		"EiffelBase QUEUE class interface"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class QUEUE [G]

inherit

	CONTAINER [G]
		undefine
			copy, is_equal
		redefine
			put
		end

feature -- Access

	item: G is
			-- Oldest item
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

	full: BOOLEAN is
			-- Is structure filled to capacity?
		deferred
		end

	prunable: BOOLEAN is
			-- May items be removed?
		deferred
		end

	readable: BOOLEAN is
			-- Is there a current item that may be read?
		do
			Result := not empty
		end

	writable: BOOLEAN is
			-- Is there a current item that may be modified?
		do
			Result := not empty
		end

feature -- Element change

	extend, force (v: G) is
			-- Add `v' to queue.
		require
			extendible: extendible
		deferred
		ensure
			item_inserted: has (v)
			one_more_occurrence: occurrences (v) = old (occurrences (v)) + 1
			item_pushed: item = v
		end

	put (v: G) is
			-- Add `v' to queue.
		deferred
		ensure then
			one_more_occurrence: occurrences (v) = old (occurrences (v)) + 1
			item_pushed: item = v
		end

	append (s: LINEAR [G]) is
			-- Append a copy of `s'.
			-- (Synonym for `fill')
		require
			s_not_void: s /= Void
		deferred
		end

	fill (other: CONTAINER [G]) is
			-- Fill with as many items of `other' as possible.
			-- The representations of `other' and current structure
			-- need not be the same.
		require
			other_not_void: other /= void
			extendible
		do
			append (other.linear_representation)
		end

feature -- Removal

	remove is
			-- Remove current item.
		require
			prunable: prunable
			writable: writable
		deferred
		end

invariant

		-- from DISPENSER
	readable_definition: readable = not empty
	writable_definition: writable = not empty
		-- from ACTIVE
	writable_constraint: writable implies readable
	empty_constraint: empty implies (not readable) and (not writable)

end -- class QUEUE
