indexing

	description:

		"EiffelBase LIST class interface"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class LIST [G]

inherit

	SEQUENCE [G]
		rename
			put as sequence_put
		export
			{NONE} sequence_put
		undefine
			index_of, occurrences, off,
			search, append, prune, prune_all
		end

	INDEXABLE [G, INTEGER]
		rename
			item as i_th,
			put as put_i_th,
			bag_put as sequence_put
		undefine
			sequence_put,
			prune_all, fill
		end

feature -- Access

	cursor: CURSOR is
			-- Current cursor position
		deferred
		end

	first: G is
			-- Item at first position
		require
			not_empty: not empty
		deferred
		end

	last: G is
			-- Item at last position
		require
			not_empty: not empty
		deferred
		end

feature -- Status report

	isfirst: BOOLEAN is
			-- Is cursor at first position?
		deferred
		ensure
			valid_position: Result implies not empty
		end

	islast: BOOLEAN is
			-- Is cursor at last position?
		deferred
		ensure
			valid_position: Result implies not empty
		end

	valid_cursor (p: CURSOR): BOOLEAN is
			-- Can the cursor be moved to position `p'?
		deferred
		end

	valid_cursor_index (i: INTEGER): BOOLEAN is
			-- Is `i' correctly bounded for cursor movement?
		do
			Result := i >= 0 and i <= count + 1
		ensure
			valid_cursor_index_definition: Result = ((i >= 0) and (i <= count + 1))
		end

	valid_index (i: INTEGER): BOOLEAN is
			-- Is `i' within allowable bounds?
		do
			Result := (i >= 1) and (i <= count)
		ensure then
			valid_index_definition: Result = ((i >= 1) and (i <= count))
		end

feature -- Cursor movement

	go_i_th (i: INTEGER) is
			-- Move cursor to `i'-th position.
		require
			valid_cursor_index: valid_cursor_index (i)
		deferred
		ensure
			position_expected: index = i
		end

	go_to (p: CURSOR) is
			-- Move cursor to position `p'.
		require
			cursor_position_valid: valid_cursor (p)
		deferred
		end

	move (i: INTEGER) is
			-- Move cursor `i' positions. The cursor
			-- may end up `off' if the absolute value of `i'
			-- is too big.
		deferred
		ensure
			too_far_right: (old index + i > count) implies exhausted
			too_far_left: (old index + i < 1) implies exhausted
			expected_index: (not exhausted) implies (index = old index + i)
		end

feature -- Element change

	put (v: G) is
			-- Replace current item by `v'.
			-- (Synonym for `replace')
		require 
			extendible: extendible
		do
			replace (v)
		ensure
			tem_inserted: has (v)
			same_count: count = old count
		end

feature -- Transformation

	swap (i: INTEGER) is
			-- Exchange item at `i'-th position with item
			-- at cursor position.
		require
			not_off: not off
			valid_index: valid_index (i)
		deferred
		ensure
	 		swapped_to_item: item = old i_th (i)
	 		swapped_from_item: i_th (i) = old item
		end

feature -- Duplication

	duplicate (n: INTEGER): like Current is
			-- Copy of sub-chain beginning at current position
			-- and having min (`n', `from_here') items,
			-- where `from_here' is the number of items
			-- at or to the right of current position.
		require
			not_off_unless_after: off implies after
			valid_subchain: n >= 0
		deferred
		end

invariant

	before_definition: before = (index = 0)
	after_definition: after = (index = count + 1)
		-- from CHAIN
	non_negative_index: index >= 0
	index_small_enough: index <= count + 1
	off_definition: off = ((index = 0) or (index = count + 1))
	isfirst_definition: isfirst = ((not empty) and (index = 1))
	islast_definition: islast = ((not empty) and (index = count))
	item_corresponds_to_index: (not off) implies (item = i_th (index))

end -- class LIST
