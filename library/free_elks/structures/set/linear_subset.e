indexing

	description: "[
		Subsets that are traversable linearly without commitment to a concrete
		implementation.
		]"

	status: "See notice at end of class"
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

	library: "[
			EiffelBase: Library of reusable components for Eiffel.
			]"

	status: "[
			Copyright 1986-2001 Interactive Software Engineering (ISE).
			For ISE customers the original versions are an ISE product
			covered by the ISE Eiffel license and support agreements.
			]"

	license: "[
			EiffelBase may now be used by anyone as FREE SOFTWARE to
			develop any product, public-domain or commercial, without
			payment to ISE, under the terms of the ISE Free Eiffel Library
			License (IFELL) at http://eiffel.com/products/base/license.html.
			]"

	source: "[
			Interactive Software Engineering Inc.
			ISE Building
			360 Storke Road, Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Electronic mail <info@eiffel.com>
			Customer support http://support.eiffel.com
			]"

	info: "[
			For latest info see award-winning pages: http://eiffel.com
			]"

end -- class LINEAR_SUBSET
