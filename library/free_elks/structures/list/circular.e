indexing

	description:
		"Circular chains, without commitment to a particular representation"

	status: "See notice at end of class"
	names: circular, ring, sequence;
	access: index, cursor, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class CIRCULAR [G] inherit

	CHAIN [G]
		redefine
			remove,
			forth, back, before, after, off,
			move, go_i_th,
			valid_cursor_index, exhausted,
			first, last, index
		end

feature -- Access

	first: G is
			-- Item at position currently defined as first
		local
			pos: INTEGER
		do
			pos := standard_index
			start
			Result := item
			move (pos - 1)
		end

	index: INTEGER is
			-- Current cursor index, with respect to position
			-- currently defined as first
		local
			first_ind, std_ind: INTEGER
			p: CURSOR
		do
			p := cursor
			std_ind := standard_index
			start
			first_ind := standard_index
			Result := std_ind - first_ind + 1
			if Result < 0 then
				Result := count + Result
			end
			move (Result - 1)
			go_to (p)
		end

	last: like first is
			-- Item at position currently defined as last
		local
			pos: INTEGER
		do
			pos := standard_index
			finish
			Result := item
			start
			move (pos - 1)
		end

feature -- Status report

	valid_cursor_index (i: INTEGER): BOOLEAN is
			-- Is `i' a possible cursor position?
		do
			Result := (i >= 0) and (i <= count)
		ensure then
			valid_cursor_index_definition: Result = ((i >= 0) and (i <= count))
		end

	after: BOOLEAN is
			-- Is there no valid cursor position to the right of cursor?
		do
			Result := is_empty and standard_after
		ensure then
			empty_and_std_after: Result = (is_empty and standard_after)
		end

	before: BOOLEAN is
			-- Is there no valid cursor position to the right of cursor?
		do
			Result := is_empty and standard_before
		ensure then
			empty_and_std_before: Result = (is_empty and standard_before)
		end

	off: BOOLEAN is
			-- Is there no current item?
		do
			Result := is_empty
		ensure then
			only_when_empty: Result = is_empty
		end

	exhausted: BOOLEAN is
			-- Has structure been completely explored?
		do
			Result := is_empty or internal_exhausted
		end

feature -- Cursor movement

	forth is
			-- Move cursor to next item, cyclically.
		do
			if islast then
				internal_exhausted := True
			end
			standard_forth
			if standard_after then
				standard_start
			end
		ensure then
			moved_forth_at_end: (old index = count) implies (index = 1)
		end

	back is
			-- Move cursor to previous item, cyclically.
		do
			if isfirst then
				internal_exhausted := True
			end
			standard_back
			if standard_before then
				standard_finish
			end
		end

	move (i: INTEGER) is
			-- Move cursor to `i'-th item from current position,
			-- cyclically.
		local
			real_move, counter, start_index: INTEGER
		do
			if i /= 0 and count > 0 then
				start_index := index
				real_move := i \\ count
				if real_move < 0 then
					real_move := count + real_move
				end
				from
				until
					counter = real_move
				loop
					forth
					counter := counter + 1
				end
				if (start_index + i > count) or (start_index + i < 1) then
					internal_exhausted := True
				end
			end
		end

	go_i_th (i: INTEGER) is
			-- Move cursor to `i'-th position from current start, cyclically.
		require else
			index_big_enough: i>= 1
			not_empty: not is_empty
		do
			start
			move (i - 1)
		end

	set_start is
			-- Define current position as the first.
		require
			not_empty: not is_empty
		deferred
		end

feature -- Removal

	remove is
			-- Remove item at cursor position.
			-- Move cursor to right neighbor (cyclically).
			-- If removed item was at current starting position,
			-- move starting position to right neighbor.
		do
			fix_start_for_remove
			standard_remove
			if standard_after then
				finish
			elseif standard_before then
				start
			end
		end

feature {CIRCULAR} -- Implementation

	fix_start_for_remove is
			-- Before deletion, update starting position if necessary.
		deferred
		end

	internal_exhausted: BOOLEAN
			-- Has last `forth' or `back' operation exhausted the structure?

	standard_after: BOOLEAN is
			-- Is there no valid cursor position to the right of cursor?
			-- (Non-cyclically)
		deferred
		end

	standard_back is
			-- Move cursor to previous element, non-cyclically.
		deferred
		end

	standard_before: BOOLEAN is
			-- Is there no valid cursor position to the left of cursor?
			-- (Non-cyclically)
		deferred
		end

	standard_finish is
			-- Move cursor to last element.
		deferred
		end

	standard_forth is
			-- Move cursor to next element, non-cyclically.
		deferred
		end

	standard_isfirst: BOOLEAN is
			-- Is cursor at first position, non-cyclically?
		deferred
		end

	standard_islast: BOOLEAN is
			-- Is cursor at last position, non-cyclically?
		deferred
		end

	standard_move (i: INTEGER) is
			-- Move cursor to `i'-th element, non-cyclically.
		deferred
		end

	standard_go_i_th (i: INTEGER) is
			-- Move cursor to `i'-th element, non-cyclically.
		deferred
		end

	standard_index: INTEGER is
			-- Current cursor index, non-cyclically
		deferred
		end

	standard_remove is
			-- Remove, non-cyclically.
		deferred
		end

	standard_search (v: like first) is
			-- Search non-cyclically.
		deferred
		end

	standard_start is
			-- Move cursor to first element.
		deferred
		end

invariant

	not_before_unless_empty: before implies is_empty
	not_after_unless_empty: after implies is_empty
	not_off_unless_empty: off implies is_empty

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

end -- class CIRCULAR



