indexing

	description:

		"EiffelBase STACK class interface"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class STACK [G]

inherit

	CONTAINER [G]
		undefine
			copy, is_equal
		redefine
			put
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
			-- Push `v' onto top.
		require
			extendible: extendible
		deferred
		ensure
			item_inserted: has (v)
			one_more_occurrence: occurrences (v) = old (occurrences (v)) + 1
			item_pushed: item = v
		end

	put (v: G) is
			-- Push `v' onto top.
		deferred
		ensure then
			one_more_occurrence: occurrences (v) = old (occurrences (v)) + 1
			item_pushed: item = v
		end

	replace (v: G) is
			-- Replace top item by `v'.
		require
			writable: writable
		deferred
		ensure
			item_replaced: item = v
		end

	append (s: SEQUENCE [G]) is
			-- Append a copy of `s'.
			-- (Synonym for `fill')
		require
			s_not_void: s /= Void
		do
			fill (s)
		end

	fill (other: LINEAR [G]) is
			-- Fill with as many items of `other' as possible.
			-- Fill items with greatest index from `other' first.
			-- Items inserted with lowest index (from `other') will
			-- always be on the top of stack.
			-- The representations of `other' and current structure
			-- need not be the same.
		require
			other_not_void: other /= void
			extendible
		deferred
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

end -- class STACK
