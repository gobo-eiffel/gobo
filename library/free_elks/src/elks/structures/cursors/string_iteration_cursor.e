note
	description: "External iteration cursor on {READABLE_STRING_GENERAL} based on {CHARACTER_32} item."
	date: "$Date: 2014-03-19 06:27:01 -0700 (Wed, 19 Mar 2014) $"
	revision: "$Revision: 94630 $"

class
	STRING_ITERATION_CURSOR

inherit
	ITERATION_CURSOR [CHARACTER_32]

	ITERABLE [CHARACTER_32]

create
	make,
	make_from_substring

feature -- Initialization

	make (s: like target)
			-- Initialize cursor using structure `s'.
		require
			s_attached: s /= Void
		do
			make_from_substring (s, 1, s.count)
		end

	make_from_substring (s: like target; start_pos, end_pos: INTEGER)
			-- Initialize cursor using structure `s', with a substring containing all characters at indices
			-- between `start_pos' and `end_pos'
		require
			s_attached: s /= Void
			start_position_big_enough: start_pos >= 1
			end_position_big_enough: start_pos <= end_pos + 1
		do
			target := s
			start_index := start_pos
			end_index := end_pos
			target_index := start_index
		ensure
			target_set: target = s
			starting_index_set: start_index = start_pos
			target_index_set: target_index = start_index
			end_index_set: end_index = end_pos
		end

feature -- Access

	item: CHARACTER_32
			-- <Precursor>
		do
			Result := target [target_index]
		end

	target_index: INTEGER_32
			-- Index position of `target' for current iteration.

	new_cursor: STRING_ITERATION_CURSOR
			-- Restarted copy of Current.
		do
			Result := twin
			Result.start
		end

feature -- Status Report

	after: BOOLEAN
			-- <Precursor>
		do
			Result := target_index > end_index
		end

feature -- Cursor movement

	start
			-- Move to first position.
		do
			target_index := start_index
		ensure
			target_index_set_to_one: target_index = start_index
		end

	forth
			-- <Precursor>
		do
			target_index := target_index + 1
		ensure then
			target_index_advanced: target_index = old target_index + 1
		end


feature {ITERABLE, ITERATION_CURSOR} -- Implementation

	target: READABLE_STRING_GENERAL
			-- Associated structure used for iteration.

	start_index: INTEGER
			-- First position.

	end_index: INTEGER
			-- Last position.

invariant
	target_attached: target /= Void
	target_index_big_enough: target_index >= start_index
	target_index_small_enough: target_index <= end_index + 1

;note
	copyright: "Copyright (c) 1984-2014, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"
end
