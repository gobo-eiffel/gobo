indexing

	description:

		"EiffelBase ARRAYED_LIST class interface"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ARRAYED_LIST [G]

inherit

	DYNAMIC_LIST [G]
		redefine
			compare_objects, compare_references
		end

	DS_ARRAYED_LIST [G]
		rename
			item as i_th,
			item_for_iteration as item,
			is_empty as empty,
			is_full as full,
			remove_at as remove,
			replace_at as replace,
			force_last as extend,
			force_left as put_left,
			force_right as put_right,
			force_first as put_front,
			is_first as isfirst,
			is_last as islast,
			search_forth as search,
			replace as put_i_th,
			delete as prune_all,

			valid_cursor as ds_valid_cursor,
			valid_index as ds_valid_index,
			extendible as ds_extendible,
			force as ds_force,
			put as ds_put,
			append as ds_append,
			prune as ds_prune,
			remove as ds_remove,
			swap as ds_swap,
			go_to as ds_go_to,
			extend as ds_extend,
			put_left as ds_put_left,
			put_right as ds_put_right,
			sorted as ds_sorted,
			sort as ds_sort
		export
			{ANY} make
		end

creation

	make, make_filled

feature -- Initialization

	make_filled (n: INTEGER) is
			-- Allocate list with `n' items.
			-- (`n' may be zero for empty list.)
			-- This list will be full.
		require
			valid_number_of_items: n >= 0
		do
			make (n)
			count := n
		ensure
			correct_position: before
			filled: full
		end

feature -- Access

	cursor: CURSOR is
			-- Current cursor position
		do
			!ARRAYED_LIST_CURSOR! Result.make (internal_cursor.position)
		end

	index_of (v: G; i: INTEGER): INTEGER is
			-- Index of `i'-th occurrence of `v'.
			-- 0 if none.
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		local
			a_tester: like equality_tester
			j, nb, occur: INTEGER
		do
			j := 1
			nb := count
			a_tester := equality_tester
			if a_tester /= Void then
				from until (j > nb or occur = i) loop
					if a_tester.test (storage.item (j), v) then
						occur := occur + 1
					end
					j := j + 1
				end
			else
				from until (j > nb or occur = i) loop
					if storage.item (j) = v then
						occur := occur + 1
					end
					j := j + 1
				end
			end
			if occur = i then
				Result := j - 1
			end
		end

feature -- Status report

	valid_cursor (p: CURSOR): BOOLEAN is
			-- Can the cursor be moved to position `p'?
		local
			a_cursor: ARRAYED_LIST_CURSOR
			i: INTEGER
		do
			a_cursor ?= p
			if a_cursor /= Void then
				Result := internal_cursor.valid_position (a_cursor.position)
			end
		end

feature -- Cursor movement

	go_to (p: CURSOR) is
			-- Move cursor to position `p'.
		local
			a_cursor: ARRAYED_LIST_CURSOR
		do
			a_cursor ?= p
			internal_cursor.set_position (a_cursor.position)
		end

	move (i: INTEGER) is
			-- Move cursor `i' positions. The cursor
			-- may end up `off' if the absolute value of `i'
			-- is too big.
		local
			j: INTEGER
		do
			j := index + i
			if j > count then
				go_after
			elseif j < 1 then
				go_before
			else
				go_i_th (j)
			end
		end

feature -- Element change

	merge_left (other: like Current) is
			-- Merge `other' into current structure before cursor
			-- position. Do not move cursor. Empty `other'.
		do
			extend_left (other)
			other.wipe_out
		end

	merge_right (other: like Current) is
			-- Merge `other' into current structure after cursor
			-- position. Do not move cursor. Empty `other'.
		do
			extend_right (other)
			other.wipe_out
		end

	append (s: LINEAR [G]) is
			-- Append a copy of `s'.
		local
			l: like s
			al: ARRAYED_LIST [G]
			i, nb: INTEGER
		do
			nb := s.ds_count
			if not ds_extendible (nb) then
				resize (new_capacity (count + nb))
			end
			i := count + 1
			from s.start until s.after loop
				storage.put (s.item, i)
				i := i + 1
				s.forth
			end
			count := count + nb
		end

	fill (other: CONTAINER [G]) is
			-- Fill with as many items of `other' as possible.
			-- The representations of `other' and current structure
			-- need not be the same.
		do
			append (other.linear_representation)
		end

feature -- Removal

	prune (v: G) is
			-- Remove the first occurrence of `v' if any.
			-- If no such occurrence go `off'.
		local
			a_tester: like equality_tester
			i, nb: INTEGER
		do
			i := index
			if i = 0 then
				i := i + 1
			end
			nb := count
			a_tester := equality_tester
			if a_tester /= Void then
				from
				until
					i > nb or else
					a_tester.test (storage.item (i), v)
				loop
					i := i + 1
				end
				if i <= nb then
					ds_remove (i)
					go_i_th (i)
				else
					go_after
				end
			else
				from
				until
					i > nb or else
					storage.item (i) = v
				loop
					i := i + 1
				end
				if i <= nb then
					ds_remove (i)
					go_i_th (i)
				else
					go_after
				end
			end
		end

feature -- Transformation

	swap (i: INTEGER) is
			-- Exchange item at `i'-th position with item
			-- at cursor position.
		do
			ds_swap (i, index)
		end

feature -- Duplication

	duplicate (n: INTEGER): like Current is
			-- Copy of sub-chain beginning at current position
			-- and having min (`n', `from_here') items,
			-- where `from_here' is the number of items
			-- at or to the right of current position.
		local
			i, nb: INTEGER
		do
			from
				i := index
				nb := i + n - 1
				if nb > count then
					nb := count
				end
				!! Result.make (n)
			until
				i > nb
			loop
				Result.put_last (storage.item (i))
				i := i + 1
			end
		end

feature -- Status setting

	compare_objects is
			-- Ensure that future search operations will use `equal'
			-- rather than `=' for comparing references.
		do
			object_comparison := True
			!! equality_tester
		end

	compare_references is
			-- Ensure that future search operations will use `='
			-- rather than `equal' for comparing references.
		do
			object_comparison := False
			equality_tester := Void
		end

end -- class ARRAYED_LIST
