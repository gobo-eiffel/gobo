note
	description: "An external iteration cursor for {HASH_TABLE}."
	library: "EiffelBase: Library of reusable components for Eiffel."
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	HASH_TABLE_ITERATION_CURSOR [G, K -> detachable HASHABLE]

inherit
	READABLE_INDEXABLE_ITERATION_CURSOR [G]
		rename
			target_index as iteration_position
		redefine
			after,
			cursor_index,
			forth,
			item,
			target
		end

	TABLE_ITERATION_CURSOR [G, K]

create
	make

feature -- Access

	item: G
			-- <Precursor>
		do
			Result := target.content [iteration_position]
		end

	key: K
			-- Key at current cursor position
		do
			Result := target.keys [iteration_position]
		end

	cursor_index: INTEGER
			-- <Precursor>
		local
			p: like iteration_position
			n: like step
			i: like iteration_position
		do
			i := iteration_position
			n := 1
			if is_reversed then
				from
					p := target.keys.count
				until
					p <= i
				loop
					p := target.previous_iteration_position (p)
					n := n - 1
					if n = 0 then
						Result := Result + 1
						n := step
					end
				end
			else
				from
					p := -1
				until
					p >= i
				loop
					p := target.next_iteration_position (p)
					n := n - 1
					if n = 0 then
						Result := Result + 1
						n := step
					end
				end
			end
			if 0 < n and then n < step then
					-- `iteration_position` is `before` or `after`, so the cursor index has to be increased.
				Result := Result + 1
			end
		end

feature -- Status report

	after: BOOLEAN
			-- <Precursor>
		local
			l_pos: like iteration_position
		do
			l_pos := iteration_position
			Result := not is_valid or l_pos < 0 or l_pos >= target.keys.count
		end

feature -- Cursor movement

	forth
			-- <Precursor>
		local
			i, nb: like step
			l_pos: like iteration_position
		do
			l_pos := iteration_position
			nb := step
			if is_reversed then
				from
					i := 1
				until
					i > nb or else l_pos < 0
				loop
					l_pos := target.previous_iteration_position (l_pos)
					i := i + 1
				end
			else
				from
					i := 1
				until
					i > nb or else l_pos >= target.keys.count
				loop
					l_pos := target.next_iteration_position (l_pos)
					i := i + 1
				end
			end
			iteration_position := l_pos
		end

feature {ITERABLE, ITERATION_CURSOR} -- Access

	target: HASH_TABLE [G, K];
			-- <Precursor>

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
