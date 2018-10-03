note
	description: "External iteration cursor for {READABLE_INDEXABLE}."
	library: "EiffelBase: Library of reusable components for Eiffel."
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

deferred class
	INDEXABLE_ITERATION_CURSOR [G]

inherit
	ITERATION_CURSOR [G]

	ITERABLE [G]

feature -- Access

	cursor_index: INTEGER
			-- Index position of cursor in the iteration.
		require
			is_valid: is_valid
		deferred
		ensure
			positive_index: Result >= 0
		end

	target_index: INTEGER
			-- Index position of target structure for current iteration.
		deferred
		end

	first_index: INTEGER
			-- First valid index of target structure for current iteration.
			-- Note that if `is_reversed', `first_index' might be greater than `last_index'.
		deferred
		end

	last_index: INTEGER
			-- Last valid index of target structure for current iteration.
			-- Note that if `is_reversed', `first_index' might be greater than `last_index'.
		deferred
		end

	step: INTEGER
			-- Distance between successive iteration elements.
		deferred
		end

	new_cursor: INDEXABLE_ITERATION_CURSOR [G]
			-- Restarted cursor of the iteration.
		deferred
		end

	reversed alias "-": INDEXABLE_ITERATION_CURSOR [G]
			-- Reversed cursor of the iteration.
		deferred
		ensure
			is_reversed: Result.is_reversed = not is_reversed
			same_step: Result.step = step
		end

	incremented alias "+" (n: like step): INDEXABLE_ITERATION_CURSOR [G]
			-- Cursor for the iteration with step increased by `n'.
		require
			n_valid: step + n > 0
		deferred
		ensure
			is_incremented: Result.step = step + n
			same_direction: Result.is_reversed = is_reversed
		end

	decremented alias "-" (n: like step): INDEXABLE_ITERATION_CURSOR [G]
			-- Cursor for the iteration with step decreased by `n'.
		require
			n_valid: step > n
		deferred
		ensure
			is_incremented: Result.step = step - n
			same_direction: Result.is_reversed = is_reversed
		end

	with_step (n: like step): INDEXABLE_ITERATION_CURSOR [G]
			-- Cursor for the iteration with step set to `n'.
		require
			n_positive: n > 0
		deferred
		ensure
			step_set: Result.step = n
			same_direction: Result.is_reversed = is_reversed
		end

feature -- Status report

	is_reversed: BOOLEAN
			-- Are we traversing target structure backwards?
		deferred
		end

	is_valid: BOOLEAN
			-- Is the cursor still compatible with the associated underlying object?
		deferred
		end

	is_first: BOOLEAN
			-- Is cursor at first position?
		deferred
		end

	is_last: BOOLEAN
			-- Is cursor at last position?
		deferred
		end

feature -- Cursor movement

	start
			-- Move to first position.
		deferred
		ensure
			cursor_index_set_to_one: cursor_index = 1
			target_index_set_to_first: target_index = first_index
			is_first: is_first
		end

	forth
			-- <Precursor>
		deferred
		ensure then
			cursor_index_advanced: cursor_index = old cursor_index + 1
		end

invariant
	step_positive: step > 0

note
	copyright: "Copyright (c) 1984-2016, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"
end
