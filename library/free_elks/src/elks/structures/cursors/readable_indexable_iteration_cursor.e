note
	description: "Concrete version of an external iteration cursor for {READABLE_INDEXABLE}."
	library: "EiffelBase: Library of reusable components for Eiffel."
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	READABLE_INDEXABLE_ITERATION_CURSOR [G]

inherit
	TYPED_INDEXABLE_ITERATION_CURSOR [G, READABLE_INDEXABLE [G]]

create
	make

feature {NONE} -- Initialization

	make (t: like target)
			-- Initialize cursor for target `t'.
		require
			t_attached: attached t
		do
			target := t
			step := 1
			is_reversed := False
		ensure
			target_set: target = t
			is_valid: is_valid
			default_step: step = 1
			ascending_traversal: not is_reversed
		end

feature -- Access

	cursor_index: INTEGER
			-- <Precursor>
		do
			Result := ((target_index - first_index).abs + step - 1) // step + 1
		end

	target_index: INTEGER
			-- <Precursor>

	first_index: INTEGER
			-- <Precursor>

	last_index: INTEGER
			-- <Precursor>

	step: INTEGER
			-- <Precursor>

	new_cursor: like Current
			-- <Precursor>
		do
			Result := twin
			Result.start
		end

	reversed alias "-": like Current
			-- <Precursor>
		do
			Result := twin
			Result.reverse
		end

	incremented alias "+" (n: like step): like Current
			-- <Precursor>
		do
			Result := twin
			Result.set_step (step + n)
		end

	decremented alias "-" (n: like step): like Current
			-- <Precursor>
		do
			Result := twin
			Result.set_step (step - n)
		end

	with_step (n: like step): like Current
			-- <Precursor>
		do
			Result := twin
			Result.set_step (n)
		end

feature -- Status report

	after: BOOLEAN
			-- <Precursor>
		do
			Result := not is_valid or not target.valid_index (target_index)
		end

	is_reversed: BOOLEAN
			-- <Precursor>

	is_valid: BOOLEAN
			-- <Precursor>
		do
			Result := True
		end

	is_first: BOOLEAN
			-- <Precursor>
		do
			Result := target_index = first_index and then is_valid
		end

	is_last: BOOLEAN
			-- <Precursor>
		do
			Result := target_index = last_index and then is_valid
		end

feature -- Status setting

	reverse
			-- Flip traversal order.
		do
			is_reversed := not is_reversed
		ensure
			is_reversed: is_reversed = not old is_reversed
		end

	set_step (v: like step)
			-- Set increment step to `v'.
		require
			v_positive: v > 0
		do
			step := v
		ensure
			step_set: step = v
		end

feature -- Cursor movement

	start
			-- <Precursor>
		local
			l_target: like target
		do
			l_target := target
			if is_reversed then
				first_index := l_target.upper
				last_index := l_target.lower
			else
				last_index := l_target.upper
				first_index := l_target.lower
			end
			target_index := first_index
		end

	forth
			-- <Precursor>
		do
			if is_reversed then
				target_index := target_index - step
			else
				target_index := target_index + step
			end
		ensure then
			cursor_index_advanced: cursor_index = old cursor_index + 1
		end

feature {TYPED_INDEXABLE_ITERATION_CURSOR} -- Access

	target: READABLE_INDEXABLE [G]
			-- <Precursor>

;note
	copyright: "Copyright (c) 1984-2024, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"
end
