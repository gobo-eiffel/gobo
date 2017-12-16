note
	description: "[
		Lists implemented as sequences of arrays, the last of which may
		be non-full. No limit on size (a new array is allocated if list
		outgrows its initial allocation).
	]"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	names: list, sequence;
	representation: array, linked;
	access: index, cursor, membership;
	contents: generic;
	date: "$Date: 2012-07-23 23:02:19 +0200 (Mon, 23 Jul 2012) $"
	revision: "$Revision: 567 $"

class MULTI_ARRAY_LIST [G] inherit

	DYNAMIC_LIST [G]
		redefine
			start, finish, move, has, first, last, prune_all, search,
			remove, duplicate, wipe_out, put_left, put_right,
			put_front, extend
		end

create
	make

feature -- Initialization

	make (b: INTEGER)
			-- Create an empty list, setting block_size to b
		do
			block_size := b
			first_element := new_cell (create {ARRAYED_LIST [G]}.make (b))
			last_element := first_element
			active := first_element
		end

feature -- Access

	item: G
			-- Item at cursor position
		do
			Result := active.item.item
		end

	first: like item
			-- Item at first position
		do
			Result := first_element.item.first
		end

	last: like item
			-- Item at last position
		do
			Result := last_element.item.last
		end

	has (v: like item): BOOLEAN
			-- Does list include `v'?
 			-- (Reference or object equality,
			-- based on `object_comparison'.)
		local
			pos: CURSOR
		do
			if not is_empty then
				pos := cursor
				start
				search (v)
				Result := not after
				go_to (pos)
			end
		end

	index: INTEGER
			-- Current cursor index

	cursor: MULTAR_LIST_CURSOR [G]
			-- Current cursor position
		do
			create Result.make (active, active.item.index, index)
		end

	first_element: BI_LINKABLE [ARRAYED_LIST [G]]
			-- First array_sequence element of the list

	last_element: BI_LINKABLE [ARRAYED_LIST [G]]
			-- Last array_sequence element of the list

	block_size: INTEGER

feature -- Measurement

	count: INTEGER
			-- Number of items

feature -- Status report

	full: BOOLEAN
		do
			Result := False
		end

	valid_cursor (p: CURSOR): BOOLEAN
			-- Can the cursor be moved to position `p'?
		do
			if attached {MULTAR_LIST_CURSOR [G]} p as al_c then
				Result := (al_c /= Void)
					and then valid_cursor_index (al_c.index)
					and then al_c.active.item.valid_cursor_index (al_c.active_index)
			end
		end

feature -- Cursor movement

	start
			-- Move cursor to first position.
			-- (No effect if empty)
		do
			active := first_element
			active.item.start
			index := 1
		end

	finish
			-- Move cursor to last position.
			-- (No effect if empty)
		do
			active := last_element
			active.item.finish
			index := count
		end

	forth
			-- Move cursor to next position, if any.
		local
			current_array: ARRAYED_LIST [G]
			a: detachable like active
		do
			if not is_empty then
				current_array := active.item
				current_array.forth
				if
					current_array.after and then
					active /= last_element
				then
					a := active.right
					if a /= Void then
						active := a
					end
					active.item.start
				end
			end
			index := index + 1
		end

	back
			-- Move cursor to previous position, if any.
		local
			current_array: ARRAYED_LIST [G]
			a: detachable like active
		do
			if not is_empty then
				current_array := active.item
				current_array.back
				if
					current_array.before and then
					active /= first_element
				then
					a := active.left
					if a /= Void then
						active := a
					end
					active.item.finish
				end
			end
			index := index - 1
		end

	move (i: INTEGER)
			-- Move cursor `i' positions. The cursor
			-- may end up `off' if the offset is too big.
		local
			counter: INTEGER
			cell: detachable like active
			current_array: ARRAYED_LIST [G]
		do
			cell := active
			current_array := cell.item
			if i > 0 then
				from
					counter := i + active.item.index
				until
					counter <= current_array.count or cell = Void
				loop
					counter := counter - current_array.count
					cell := cell.right
					if cell /= Void then
						current_array := cell.item
					end
				end
				if cell = Void then
					current_array.finish
					current_array.forth
				else
					active := cell
					current_array.go_i_th (counter)
				end
			elseif i < 0 then
				from
					counter := current_array.count - current_array.index - i
				until
					counter <= current_array.count or cell = Void
				loop
					counter := counter - current_array.count
					cell := cell.left
					if cell /= Void then
						current_array := cell.item
					end
				end
				if counter = current_array.count then
					counter := 0
					if cell /= Void then
						cell := cell.left
						if cell /= Void then
							current_array := cell.item
						end
					end
				end
				if cell = Void then
					current_array.go_i_th (0)
				else
					active := cell
					current_array.go_i_th (current_array.count - counter)
				end
			end
			if i /= 0 then
				if current_array.before then
					index := 0
				elseif current_array.after then
					index := count + 1
				else
					index := index + i
				end
			end
		end

	go_to (p: CURSOR)
			-- Move cursor to position `p'
		do
			if attached {MULTAR_LIST_CURSOR [G]} p as al_c then
				active := al_c.active
				active.item.go_i_th (al_c.active_index)
				index := al_c.index
			end
		end

	search (v: like item)
			-- Move cursor to first position (at or after current
			-- cursor position) where `item' and `v' are equal.
 			-- (Reference or object equality,
			-- based on `object_comparison'.)
		local
			current_array: ARRAYED_LIST [G]
			old_index: INTEGER
			cell: detachable like active
		do
			cell := active
			current_array := cell.item
			old_index := current_array.index
			if object_comparison then
				current_array.compare_objects
			else
				current_array.compare_references
			end
			current_array.search (v)
			if current_array.after then
				cell := cell.right
				index := index + current_array.count - old_index + 1
			else
				index := index + current_array.index - old_index
			end
			from
			invariant
				index <= count + 1
			until
				not current_array.after or else cell = Void
			loop
				current_array := cell.item
				if object_comparison then
					current_array.compare_objects
				else
					current_array.compare_references
				end
				current_array.start
				current_array.search (v)
				if current_array.after then
					cell := cell.right
					index := index + current_array.count
				else
					index := index + current_array.index - 1
				end
			end
			if cell /= Void then
				active := cell
			else
				active := last_element
			end
		end

feature -- Element change

	replace (v: like item)
			-- Replace current item by `v'.
		do
			active.item.replace (v)
		end

	extend (v: like item)
			-- Add `v' to end.
		local
			current_array: ARRAYED_LIST [G]
			n: like new_cell
		do
			current_array := last_element.item
			if current_array.count = block_size then
				create current_array.make (block_size)
				n := new_cell (current_array)
				last_element.put_right (n)
				last_element := n
			end
			current_array.extend (v)
			count := count + 1
		end

	put_front (v: like item)
			-- Add `v' at the beginning.
			-- Do not move cursor.
		local
			first_array: ARRAYED_LIST [G]
			pos: INTEGER
		do
			first_array := first_element.item
			if active = first_element then
				pos := first_array.index
			else
				pos := -1
			end
			first_array.start
				-- `count' is updated in `put_left'.
			put_left (v)
			if pos > 0 then
				first_array.go_i_th	(pos + 1)
			elseif pos = 0 then
				first_array.go_i_th (0)
			end
			if not before then
				index := index + 1
			end
		end

	put_left (v: like item)
			-- Add `v' to the left of current position.
			-- Do not move cursor.
		local
			cell: like first_element
			current_array: ARRAYED_LIST [G]
			pos, cut: INTEGER
			l: detachable like first_element
		do
			current_array := active_array
			check is_empty implies after end
			if after then
				extend (v)
			else
				if active /= first_element then
					l := active.left
				end
				if l /= Void and then not l.item.full then
					l.item.extend (v)
				elseif current_array.count <= block_size then
					current_array.put_left (v)
				else
					pos := current_array.index
					current_array.go_i_th (block_size // 2 + 1)
					cut := index
					cell := new_cell (current_array.duplicate (count))
					cell.put_right (active.right)
					cell.put_left (active)
					if last_element = active then
						last_element := cell
					end
					if pos < cut then
						current_array.go_i_th (pos)
						current_array.put_left (v)
					elseif pos = cut then
						current_array.extend (v)
						active := cell
						active.item.start
					else
						active := cell
						current_array := cell.item
						current_array.go_i_th (pos - cut + 1)
						current_array.put_left (v)
					end
				end
			end
			index := index + 1
			count := count + 1
		end

	put_right (v: like item)
			-- Add `v' to the left of current position.
			-- Do not move cursor.
		do
			forth
			put_left (v)
			back
			back
		end

feature -- Removal

	wipe_out
			-- Remove all items.
		do
			count := 0
			index := 0
			first_element.item.wipe_out
			first_element.forget_right
			active := first_element
			last_element := first_element
		end

	remove
			-- Remove current item
		local
			current_array: ARRAYED_LIST [G]
			new_active: detachable like active
			e: detachable like first_element
		do
			current_array := active.item
			current_array.remove
			if current_array.is_empty then
				if active = first_element then
					if active /= last_element then
						e := active.right
						if e /= Void then
							first_element := e
							e.forget_left
						end
						active := first_element
						active.item.start
					end
				elseif active = last_element then
					e := active.left
					if e /= Void then
						last_element := e
						e.forget_right
					end
					active := last_element
					active.item.finish
				else
						-- `put_left' modifies `active.right', so we need to remeber it
						-- as it will become the new value for `active'.
					new_active := active.right
					if new_active /= Void then
						e := active.left
						if e /= Void then
							new_active.put_left (e)
						end
						active := new_active
					end
					active.item.start
				end
			elseif current_array.after then
				if active /= last_element then
					e := active.right
					if e /= Void then
						active := e
					end
					active.item.start
				end
			end
			count := count - 1
		end

	remove_left
		do
			back
			remove
		end

	remove_right
		do
			forth
			remove
			back
		end

	prune_all (v: like item)
		local
			cell: detachable like active
			new_active: like active
			array: ARRAYED_LIST [G]
		do
			from
				cell := first_element
			until
				cell = Void
			loop
				array := cell.item
				if object_comparison then
					array.compare_objects
				else
					array.compare_references
				end
				count := count - array.count
				array.prune_all (v)
				count := count + array.count
				if array.is_empty then
					if cell = first_element then
						if cell = last_element then
							cell := Void
						else
							if attached cell.right as e then
								first_element := e
							end
							cell := first_element
							cell.forget_left
						end
					elseif cell = last_element then
						if attached cell.left as e then
							last_element := e
						end
						last_element.forget_right
						cell := Void
					else
							-- `put_left' modifies `cell.right', so we need to remeber it
							-- as it will become the new value for `cell'.
						new_active := cell.right
						if
							attached new_active and then
							attached cell.left as e
						then
							new_active.put_left (e)
						end
						cell := new_active
					end
				else
					cell := cell.right
				end
			end
			active := last_element
			index := count + 1
		end

feature -- Duplication

	duplicate (n: INTEGER): like Current
			-- Copy of sub-list beginning at cursor position
			-- and having min (`n', `count' - `index' + 1) items
		local
			pos: CURSOR
			counter: INTEGER
		do
			from
				pos := cursor
				Result := new_chain
			until
				(counter = n) or exhausted
			loop
				Result.extend (item)
				forth
				counter := counter + 1
			end
			go_to (pos)
		end

feature {MULTI_ARRAY_LIST} -- Implementation

	new_chain: like Current
			-- A newly created instance of the same type.
			-- This feature may be redefined in descendants so as to
			-- produce an adequately allocated and initialized object.
		do
			create Result.make (block_size)
		end

	active_array: ARRAYED_LIST [G]
			-- Array_sequence at cursor position
		require
			active_exists: active /= Void
			not_off: not off
		do
			Result := active.item
		end

	active: like first_element
			-- Element at cursor position

feature {NONE} -- Implementation

	new_cell (a: ARRAYED_LIST [G]): like first_element
		do
			create Result.put (a)
		end

invariant

	writable_definition: writable = not off
	readable_definition: readable = not off
	extendible_definition: extendible

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
