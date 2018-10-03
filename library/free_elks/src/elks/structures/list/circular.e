note
	description: "Circular chains, without commitment to a particular representation"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
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

	first: G
			-- Item at position currently defined as first
		local
			pos: INTEGER
		do
			pos := standard_index
			start
			Result := item
			move (pos - 1)
		end

	index: INTEGER
			-- Current cursor index, with respect to position
			-- currently defined as first
		local
			std_ind: INTEGER
			p: CURSOR
		do
			p := cursor
			std_ind := standard_index
			start
			Result := std_ind - standard_index + 1
			if Result < 0 then
				Result := count + Result
			end
			move (Result - 1)
			go_to (p)
		end

	last: like first
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

	valid_cursor_index (i: INTEGER): BOOLEAN
			-- Is `i' a possible cursor position?
		do
			Result := (i >= 0) and (i <= count)
		ensure then
			valid_cursor_index_definition: Result = ((i >= 0) and (i <= count))
		end

	after: BOOLEAN
			-- Is there no valid cursor position to the right of cursor?
		do
			Result := is_empty and standard_after
		ensure then
			empty_and_std_after: Result = (is_empty and standard_after)
		end

	before: BOOLEAN
			-- Is there no valid cursor position to the right of cursor?
		do
			Result := is_empty and standard_before
		ensure then
			empty_and_std_before: Result = (is_empty and standard_before)
		end

	off: BOOLEAN
			-- Is there no current item?
		do
			Result := is_empty
		ensure then
			only_when_empty: Result = is_empty
		end

	exhausted: BOOLEAN
			-- Has structure been completely explored?
		do
			Result := is_empty or internal_exhausted
		end

feature -- Cursor movement

	forth
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

	back
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

	move (i: INTEGER)
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

	go_i_th (i: INTEGER)
			-- Move cursor to `i'-th position from current start, cyclically.
		require else
			index_big_enough: i>= 1
			not_empty: not is_empty
		do
			start
			move (i - 1)
		end

	set_start
			-- Define current position as the first.
		require
			not_empty: not is_empty
		deferred
		end

feature -- Removal

	remove
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

	fix_start_for_remove
			-- Before deletion, update starting position if necessary.
		deferred
		end

	internal_exhausted: BOOLEAN
			-- Has last `forth' or `back' operation exhausted the structure?

	standard_after: BOOLEAN
			-- Is there no valid cursor position to the right of cursor?
			-- (Non-cyclically)
		deferred
		end

	standard_back
			-- Move cursor to previous element, non-cyclically.
		deferred
		end

	standard_before: BOOLEAN
			-- Is there no valid cursor position to the left of cursor?
			-- (Non-cyclically)
		deferred
		end

	standard_finish
			-- Move cursor to last element.
		deferred
		end

	standard_forth
			-- Move cursor to next element, non-cyclically.
		deferred
		end

	standard_isfirst: BOOLEAN
			-- Is cursor at first position, non-cyclically?
		deferred
		end

	standard_islast: BOOLEAN
			-- Is cursor at last position, non-cyclically?
		deferred
		end

	standard_move (i: INTEGER)
			-- Move cursor to `i'-th element, non-cyclically.
		deferred
		end

	standard_go_i_th (i: INTEGER)
			-- Move cursor to `i'-th element, non-cyclically.
		deferred
		end

	standard_index: INTEGER
			-- Current cursor index, non-cyclically
		deferred
		end

	standard_remove
			-- Remove, non-cyclically.
		deferred
		end

	standard_search (v: like first)
			-- Search non-cyclically.
		deferred
		end

	standard_start
			-- Move cursor to first element.
		deferred
		end

invariant

	not_before_unless_empty: before implies is_empty
	not_after_unless_empty: after implies is_empty
	not_off_unless_empty: off implies is_empty

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
