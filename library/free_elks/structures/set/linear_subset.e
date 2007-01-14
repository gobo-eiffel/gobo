indexing

	description: "[
		Subsets that are traversable linearly without commitment to a concrete
		implementation.
		]"
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

	index: INTEGER is
			-- Current index
		deferred
		end
	 
feature -- Status report

	before: BOOLEAN is
			-- Is cursor at left from first item?
		deferred
		end
	
	islast: BOOLEAN is
			-- Is cursor at last item?
		deferred
		end
	 
	valid_index (n: INTEGER): BOOLEAN is
			-- Is `n' a valid index?
		deferred
		ensure
			index_valid: 0 <= n and n <= count + 1
		end

feature -- Cursor movement

	go_i_th (i: INTEGER) is
			-- Move cursor to `i'-th item.
		require
			valid_index: valid_index (i)
		deferred
		ensure
			cursor_moved: index = i
		end

feature -- Element change

	put_left (v: G) is
			-- Insert `v' before the cursor.
		require
			item_exists: v /= Void
			not_before: not before
		deferred
		ensure
			cursor_position_unchanged: index = old index + 1
		end

	move_item (v: G) is
			-- Move `v' to the left of cursor.
		require
			item_exists: v /= Void
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
					found := equal (v, item)
				else
					found := (v = item)
				end
				if not found then
					forth
				end
			end
			check
				found: found and not after
					-- Because the precondition states that `v' is in the set.
			end
			remove
			go_i_th (idx)
			put_left (v)
		end

feature {NONE} -- Implementation

	subset_strategy_selection (v: G; other: TRAVERSABLE_SUBSET [G]): 
								SUBSET_STRATEGY [G] is
			-- Strategy to calculate several subset features selected depending
			-- on the dynamic type of `v' and `other'
		local
			h: HASHABLE
		do
			h ?= v
			if h /= Void then
				create {SUBSET_STRATEGY_HASHABLE [G]} Result
			else
				create {SUBSET_STRATEGY_GENERIC [G]} Result
			end
		end

invariant

	before_definition: before = (index = 0)

indexing
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"







end -- class LINEAR_SUBSET
