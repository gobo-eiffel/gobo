indexing

	description:

		"Cursors for sparse table traversals"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2000, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_SPARSE_TABLE_CURSOR [G, K]

inherit

	DS_BILINEAR_CURSOR [G]
		redefine
			off
		end

	DS_DYNAMIC_CURSOR [G]

	KL_IMPORTED_FIXED_ARRAY_ROUTINES
		undefine
			is_equal, copy
		end

creation

	make

feature {NONE} -- Initialization

	make (a_table: like container) is
			-- Create a new cursor for `a_table'.
		require
			a_table_not_void: a_table /= Void
		do
			container := a_table
			position := Before_position
		ensure
			container_set: container = a_table
			before: before
		end

feature -- Access

	item: G is
			-- Item at cursor position
		do
			Result := container.items.item (position)
		end

	key: K is
			-- Key at cursor position
		require
			not_off: not off
		do
			Result := container.keys.item (position)
		end

	container: DS_SPARSE_TABLE [G, K]
			-- Table traversed

feature -- Status report

	after: BOOLEAN is
			-- Is there no valid position to right of cursor?
		do
			Result := position = After_position
		end

	before: BOOLEAN is
			-- Is there no valid position to left of cursor?
		do
			Result := position = Before_position
		end

	off: BOOLEAN is
			-- Is there no item at cursor position?
		do
			Result := position < 0
		end

	is_first: BOOLEAN is
			-- Is cursor on the first item?
		local
			i: INTEGER
			clashes: like FIXED_INTEGER_ARRAY_TYPE
		do
			if not container.is_empty then
				from
					clashes := container.clashes
				until
					clashes.item (i) > Free_watermark
				loop
					i := i + 1
				end
				Result := (position = i)
			end
		end

	is_last: BOOLEAN is
			-- Is cursor on the last item?
		local
			i: INTEGER
			clashes: like FIXED_INTEGER_ARRAY_TYPE
		do
			if not container.is_empty then
				from
					clashes := container.clashes
					i := clashes.count - 1
				until
					clashes.item (i) > Free_watermark
				loop
					i := i - 1
				end
				Result := (position = i)
			end
		end

	same_position (other: like Current): BOOLEAN is
			-- Is current cursor at same position as `other'?
		do
			Result := position = other.position
		end

feature -- Cursor movement

	start is
			-- Move cursor to first position.
		local
			i, nb: INTEGER
			a_table: like container
			clashes: like FIXED_INTEGER_ARRAY_TYPE
			was_off: BOOLEAN
		do
			if container.is_empty then
				position := After_position
			else
				was_off := off
				from
					a_table := container
					clashes := a_table.clashes
					nb := a_table.capacity - 1
				until
					i > nb or else
					clashes.item (i) > Free_watermark
				loop
					i := i + 1
				end
				if i > nb then
					position := After_position
					if not was_off then
						a_table.remove_traversing_cursor (Current)
					end
				else
					position := i
					if was_off then
						a_table.add_traversing_cursor (Current)
					end
				end
			end
		end

	finish is
			-- Move cursor to last position.
		local
			i: INTEGER
			a_table: like container
			clashes: like FIXED_INTEGER_ARRAY_TYPE
			was_off: BOOLEAN
		do
			if container.is_empty then
				position := Before_position
			else
				was_off := off
				from
					a_table := container
					clashes := a_table.clashes
					i := a_table.capacity - 1
				until
					i < 0 or else
					clashes.item (i) > Free_watermark
				loop
					i := i - 1
				end
				if i < 0 then
					position := Before_position
					if not was_off then
						a_table.remove_traversing_cursor (Current)
					end
				else
					position := i
					if was_off then
						a_table.add_traversing_cursor (Current)
					end
				end
			end
		end

	forth is
			-- Move cursor to next position.
		local
			i, nb: INTEGER
			a_table: like container
			clashes: like FIXED_INTEGER_ARRAY_TYPE
			was_off: BOOLEAN
		do
			if position = Before_position then
				was_off := True
				-- i := 0
			else
				-- was_off := False
				i := position + 1
			end
			from
				a_table := container
				clashes := a_table.clashes
				nb := a_table.capacity - 1
			until
				i > nb or else
				clashes.item (i) > Free_watermark
			loop
				i := i + 1
			end
			if i > nb then
				position := After_position
				if not was_off then
					a_table.remove_traversing_cursor (Current)
				end
			else
				position := i
				if was_off then
					a_table.add_traversing_cursor (Current)
				end
			end
		end

	back is
			-- Move cursor to previous position.
		local
			i: INTEGER
			a_table: like container
			clashes: like FIXED_INTEGER_ARRAY_TYPE
			was_off: BOOLEAN
		do
			a_table := container
			clashes := a_table.clashes
			if position = After_position then
				was_off := True
				i := a_table.capacity - 1
			else
				-- was_off := False
				i := position - 1
			end
			from
			until
				i < 0 or else
				clashes.item (i) > Free_watermark
			loop
				i := i - 1
			end
			if i < 0 then
				position := Before_position
				if not was_off then
					a_table.remove_traversing_cursor (Current)
				end
			else
				position := i
				if was_off then
					a_table.add_traversing_cursor (Current)
				end
			end
		end

	search_forth (v: G) is
			-- Move to first position at or after current
			-- position where `item' and `v' are equal.
			-- (Use `equality_tester''s criterion from `container'
			-- if not void, use `=' criterion otherwise.)
			-- Move `after' if not found.
		local
			a_tester: DS_EQUALITY_TESTER [G]
		do
			a_tester := container.equality_tester
			if a_tester /= Void then
				from until
					after or else a_tester.test (item, v)
				loop
					forth
				end
			else
					-- Use `=' as comparison criterion.
				from until
					after or else item = v
				loop
					forth
				end
			end
		end

	search_back (v: G) is
			-- Move to first position at or before current
			-- position where `item' and `v' are equal.
			-- (Use `equality_tester''s criterion from `container'
			-- if not void, use `=' criterion otherwise.)
			-- Move `before' if not found.
		local
			a_tester: DS_EQUALITY_TESTER [G]
		do
			a_tester := container.equality_tester
			if a_tester /= Void then
				from until
					before or else a_tester.test (item, v)
				loop
					back
				end
			else
					-- Use `=' as comparison criterion.
				from until
					before or else item = v
				loop
					back
				end
			end
		end

	go_after is
			-- Move cursor to `after' position.
		local
			was_off: BOOLEAN
		do
			was_off := off
			position := After_position
			if not was_off then
				container.remove_traversing_cursor (Current)
			end
		end

	go_before is
			-- Move cursor to `before' position.
		local
			was_off: BOOLEAN
		do
			was_off := off
			position := Before_position
			if not was_off then
				container.remove_traversing_cursor (Current)
			end
		end

	go_to (other: like Current) is
			-- Move cursor to `other''s position.
		local
			was_off: BOOLEAN
		do
			was_off := off
			position := other.position
			if not off then
				if was_off then
					container.add_traversing_cursor (Current)
				end
			elseif not was_off then
				container.remove_traversing_cursor (Current)
			end
		end

feature -- Element change

	replace (v: G) is
			-- Replace item at cursor position by `v'.
		do
			container.items.put (v, position)
		end

feature {DS_SPARSE_TABLE, DS_SPARSE_TABLE_CURSOR} -- Implementation

	position: INTEGER
			-- Internal position in table

feature {DS_SPARSE_TABLE} -- Implementation

	set_position (p: INTEGER) is
			-- Set `position' to `p'.
		require
			valid_p: valid_position (p)
		do
			position := p
		ensure
			position_set: position = p
		end

	set_after is
			-- Set `position' to after position
		do
			position := After_position
		ensure
			after: after
		end

	valid_position (p: INTEGER): BOOLEAN is
			-- Is `p' a valid value for `position'?
		do
			Result := (p = Before_position or p = After_position) or
				(container.valid_position (p) and then container.valid_slot (p))
		ensure
			not_off: (container.valid_position (p) and then container.valid_slot (p)) implies Result
			before: (p = Before_position) implies Result
			after: (p = After_position) implies Result
			valid_slot: (Result and container.valid_position (p)) implies container.valid_slot (p)
		end

feature {NONE} -- Implementation

	Before_position: INTEGER is -1
	After_position: INTEGER is -2
			-- Special values for before and after positions

	Free_watermark: INTEGER is -2
			-- Limit between free and occupied slots in
			-- `container.clashes'

invariant

-- The following assertion are commented out because
-- some Eiffel compilers check invariants even when the
-- execution of the creation procedure is not completed.
-- (In this case, this is `container' which is not fully
-- created yet, breaking its invariant.)

--	valid_position: valid_position (position)

end -- class DS_SPARSE_TABLE_CURSOR
