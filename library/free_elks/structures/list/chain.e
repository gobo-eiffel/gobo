indexing

	description: "[
		Possibly circular sequences of items,
		without commitment to a particular representation
		]"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: chain, sequence;
	access: index, cursor, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class CHAIN [G] inherit

	CURSOR_STRUCTURE [G]
		undefine
			prune_all
		redefine
			fill
		select
			put
		end

	INDEXABLE [G, INTEGER]
		rename
			item as i_th alias "[]",
			put as put_i_th
		undefine
			prune_all
		redefine
			fill
		end

	SEQUENCE [G]
		rename
			put as sequence_put
		export
			{NONE} sequence_put
		redefine
			index_of, has, off, occurrences, fill, append
		select
			index_of, has, occurrences
		end

	SEQUENCE [G]
		rename
			put as sequence_put,
			index_of as sequential_index_of,
			has as sequential_has,
			occurrences as sequential_occurrences
		export
			{NONE}
				sequential_index_of, sequential_has,
				sequence_put
		redefine
			off, fill, append
		end

feature -- Access

	first: like item is
			-- Item at first position
		require
			not_empty: not is_empty
		local
			pos: CURSOR
		do
			pos := cursor
			start
			Result := item
			go_to (pos)
		end

	last: like item is
			-- Item at last position
		require
			not_empty: not is_empty
		local
			pos: CURSOR
		do
			pos := cursor
			finish
			Result := item
			go_to (pos)
		end

	has (v: like item): BOOLEAN is
			-- Does chain include `v'?
			-- (Reference or object equality,
			-- based on `object_comparison'.)

		local
			pos: CURSOR
		do
			pos := cursor
			Result := sequential_has (v)
			go_to (pos)
		end

	index_of (v: like item; i: INTEGER): INTEGER is
			-- Index of `i'-th occurrence of item identical to `v'.
			-- (Reference or object equality,
			-- based on `object_comparison'.)
			-- 0 if none.
		local
			pos: CURSOR
		do
			pos := cursor
			Result := sequential_index_of (v, i)
			go_to (pos)
		end

	i_th alias "[]", infix "@" (i: INTEGER): like item assign put_i_th is
			-- Item at `i'-th position
		local
			pos: CURSOR
		do
			pos := cursor
			go_i_th (i)
			Result := item
			go_to (pos)
		end

feature -- Measurement

	occurrences (v: like item): INTEGER is
			-- Number of times `v' appears.
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		local
			pos: CURSOR
		do
			pos := cursor
			Result := sequential_occurrences (v)
			go_to (pos)
		end

	index_set: INTEGER_INTERVAL is
			-- Range of acceptable indexes
		do
			create Result.make (1, count)
		ensure then
			count_definition: Result.count = count
		end

feature -- Cursor movement

	start is
			-- Move cursor to first position.
			-- (No effect if empty)
		do
			if not is_empty then
				go_i_th (1)
			end
		ensure then
			at_first: not is_empty implies isfirst
		end

	finish is
			-- Move cursor to last position.
			-- (No effect if empty)
		do
			if not is_empty then
				go_i_th (count)
			end
		ensure then
			at_last: not is_empty implies islast
		end

	move (i: INTEGER) is
			-- Move cursor `i' positions. The cursor
			-- may end up `off' if the absolute value of `i'
			-- is too big.
		local
			counter, pos, final: INTEGER
		do
			if i > 0 then
				from
				until
					(counter = i) or else off
				loop
					forth
					counter := counter + 1
				end
			elseif i < 0 then
				final := index + i
				if final <= 0 then
					start
					back
				else
					from
						start
						pos := 1
					until
						pos = final
					loop
						forth
						pos := pos + 1
					end
				end
			end
		ensure
			too_far_right: (old index + i > count) implies exhausted
			too_far_left: (old index + i < 1) implies exhausted
			expected_index: (not exhausted) implies (index = old index + i)
		end

	go_i_th (i: INTEGER) is
			-- Move cursor to `i'-th position.
		require
			valid_cursor_index: valid_cursor_index (i)
		do
			move (i - index)
		ensure
			position_expected: index = i
		end

 feature -- Status report

	valid_index (i: INTEGER): BOOLEAN is
			-- Is `i' within allowable bounds?
		do
			Result := (i >= 1) and (i <= count)
		ensure then
			valid_index_definition: Result = ((i >= 1) and (i <= count))
		end


	isfirst: BOOLEAN is
			-- Is cursor at first position?
		do
			Result := not is_empty and (index = 1)
		ensure
			valid_position: Result implies not is_empty
		end

	islast: BOOLEAN is
			-- Is cursor at last position?
		do
			Result := not is_empty and (index = count)
		ensure
			valid_position: Result implies not is_empty
		end

	off: BOOLEAN is
			-- Is there no current item?
		do
			Result := (index = 0) or (index = count + 1)
		end


	valid_cursor_index (i: INTEGER): BOOLEAN is
			-- Is `i' correctly bounded for cursor movement?
		do
			Result := (i >= 0) and (i <= count + 1)
		ensure
			valid_cursor_index_definition: Result = ((i >= 0) and (i <= count + 1))
		end

feature -- Element change

	put (v: like item) is
			-- Replace current item by `v'.
			-- (Synonym for `replace')
		do
			replace (v)
		ensure then
	 		same_count: count = old count
		end

	put_i_th (v: like item; i: INTEGER) is
			-- Put `v' at `i'-th position.
		local
			pos: CURSOR
		do
			pos := cursor
			go_i_th (i)
			replace (v)
			go_to (pos)
		end

	append (s: SEQUENCE [G]) is
			-- Append a copy of `s'.
		local
			l: like s
			l_cursor: CURSOR
		do
			if s = Current then
				l := s.twin
			else
				l := s
			end
			from
				l_cursor := cursor
				l.start
			until
				l.exhausted
			loop
				extend (l.item)
				finish
				l.forth
			end
			go_to (l_cursor)
		end

	fill (other: CONTAINER [G]) is
			-- Fill with as many items of `other' as possible.
			-- The representations of `other' and current structure
			-- need not be the same.
		local
			lin_rep: LINEAR [G]
			l_cursor: CURSOR
		do
			lin_rep := other.linear_representation
			from
				l_cursor := cursor
				lin_rep.start
			until
				not extendible or else lin_rep.off
			loop
				extend (lin_rep.item)
				finish
				lin_rep.forth
			end
			go_to (l_cursor)
		end
feature -- Transformation

	swap (i: INTEGER) is
			-- Exchange item at `i'-th position with item
			-- at cursor position.
		require
			not_off: not off
			valid_index: valid_index (i)
		local
			old_item, new_item: like item
			pos: CURSOR
		do
			pos := cursor
			old_item := item
			go_i_th (i)
			new_item := item
			replace (old_item)
			go_to (pos)
			replace (new_item)
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

feature {NONE} -- Inapplicable

	remove is
			-- Remove current item.
		do
		end

invariant

	non_negative_index: index >= 0
	index_small_enough: index <= count + 1
	off_definition: off = ((index = 0) or (index = count + 1))
	isfirst_definition: isfirst = ((not is_empty) and (index = 1))
	islast_definition: islast = ((not is_empty) and (index = count))
	item_corresponds_to_index: (not off) implies (item = i_th (index))
	index_set_has_same_count: index_set.count = count

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







end -- class CHAIN



