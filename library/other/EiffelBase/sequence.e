indexing

	description:

		"EiffelBase SEQUENCE class interface"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class SEQUENCE [G]

inherit

	BILINEAR [G]

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
			Result := not off
		end

	writable: BOOLEAN is
			-- Is there a current item that may be modified?
		do
			Result := not off
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

	append (s: LINEAR [G]) is
			-- Append a copy of `s'.
		require
			argument_not_void: s /= Void
		local
			l: like s
			al: ARRAYED_LIST [G]
			nb: INTEGER
		do
			nb := s.ds_count
			if s = Current then
				!! al.make (nb)
				al.append (s)
				l := al
			else
				l := s
			end
			from l.start until l.after loop
				extend (l.item)
				l.forth
			end
		ensure
			new_count: count >= old count
		end

	force (v: G) is
			-- Add `v' to end.
		require
			extendible: extendible
		do
			extend (v)
		ensure
			new_count: count = old count + 1
			item_inserted: has (v)
		end

	put (v: G) is
			-- Add `v' to end.
		do
			extend (v)
		ensure then
			new_count: count = old count + 1
		end

	replace (v: G) is
			-- Replace current item by `v'.
		require
			writable: writable
		deferred
		ensure
			item_replaced: item = v
		end

feature -- Removal

	remove is
			-- Remove current item.
			-- Move cursor to right neighbor
			-- (or `after' if no right neighbor).
		require
			prunable: prunable
			writable: writable
		deferred
		end

	prune (v: G) is
			-- Remove the first occurrence of `v' if any.
			-- If no such occurrence go `off'.
		require
			prunable: prunable
		do
			start
			search (v)
			if not exhausted then
				remove
			end
		end

	prune_all (v: G) is
			-- Remove all occurrences of `v'; go `off'.
		require
			prunable: prunable
		do
			from
				start
			until
				exhausted
			loop
				search (v)
				if not exhausted then
					remove
				end
			end
		ensure
			no_more_occurrences: not has (v)
		end

invariant

		-- from ACTIVE
	writable_constraint: writable implies readable
	empty_constraint: empty implies (not readable) and (not writable)
		-- from FINITE
	empty_definition: empty = (count = 0)
	non_negative_count: count >= 0

end -- class SEQUENCE
