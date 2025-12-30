note
	description: "[
		Subsets that are traversable linearly without commitment to a concrete
		implementation.
		]"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: linear_subset, subset, set;
	access: membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class LINEAR_SUBSET [G] inherit

	TRAVERSABLE_SUBSET [G]

feature -- Access

	index: INTEGER
			-- Current index
		deferred
		end

feature -- Status report

	before: BOOLEAN
			-- Is cursor at left from first item?
		deferred
		end

	islast: BOOLEAN
			-- Is cursor at last item?
		deferred
		end

	valid_index (i: INTEGER): BOOLEAN
			-- Is `i' a valid index?
		deferred
		ensure
			valid_index_definition: Result = ((i >= 1) and (i <= count))
		end

feature -- Cursor movement

	go_i_th (i: INTEGER)
			-- Move cursor to `i'-th item.
		require
			valid_index: valid_index (i)
		deferred
		ensure
			cursor_moved: index = i
		end

feature -- Element change

	put_left (v: G)
			-- Insert `v' before the cursor.
		require
			not_before: not before
		deferred
		ensure
			cursor_position_unchanged: index = old index + 1
		end

	move_item (v: G)
			-- Move `v' to the left of cursor.
		require
			not_before: not before
			item_in_set: has (v)
		local
			idx: INTEGER
			found: BOOLEAN
		do
			idx := index
			from
				start
			until
				found or after
			loop
				if object_comparison then
					found := v ~ item
				else
					found := v = item
				end
				if not found then
					forth
				end
			end
			check
				found: found and not after
					-- Because the precondition states that `v' is in the set.
			end
			if index < idx then
				idx := idx - 1 -- Items are shifted to the left by one position
			end
			remove
			go_i_th (idx)
			put_left (v)
		end

feature {NONE} -- Implementation

	subset_strategy_selection (v: G; other: TRAVERSABLE_SUBSET [G]):
								SUBSET_STRATEGY [G]
			-- Strategy to calculate several subset features selected depending
			-- on the dynamic type of `v' and `other'
		do
			if attached {HASHABLE} v as h then
				create {SUBSET_STRATEGY_HASHABLE [G]} Result
			else
				create {SUBSET_STRATEGY_GENERIC [G]} Result
			end
		end

invariant

	before_definition: before = (index = 0)

note
	copyright: "Copyright (c) 1984-2017, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
