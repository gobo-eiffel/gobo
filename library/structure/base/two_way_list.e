indexing

	description:

		"EiffelBase TWO_WAY_LIST class interface"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class TWO_WAY_LIST [G]

inherit

	LINKED_LIST [G]
		undefine
			new_cursor, put_left_cursor, force_left_cursor,
			extend_left_cursor, append_left_cursor,
			remove_last, remove_at_cursor,
			remove_left_cursor, prune_last,
			prune_left_cursor, keep_last,
			set_first_cell
		redefine
			move, first_cell, cursor_anchor
		end

	DS_BILINKED_LIST [G]
		rename
			item as i_th,
			item_for_iteration as item,
			is_empty as empty,
			remove_at as remove,
			replace_at as replace,
			force_last as extend,
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
			sorted as ds_sorted,
			sort as ds_sort
		export
			{ANY} make
		redefine
			first_cell
		end

creation

	make

feature -- Cursor movement

	move (i: INTEGER) is
			-- Move cursor `i' positions. The cursor
			-- may end up `off' if the absolute value of `i'
			-- is too big.
		local
			j: INTEGER
		do
			if i >= 0 then
				from j := 1 until (j > i or after) loop
					forth
					j := j + 1
				end
			else
				from j := 1 until (j > i or before) loop
					back
					j := j + 1
				end
			end
		end

feature {DS_LINKED_LIST, DS_LINKED_LIST_CURSOR} -- Implementation

	first_cell: DS_BILINKABLE [G]
			-- First cell in list

feature {NONE} -- Type anchors

	cursor_anchor: TWO_WAY_LIST_CURSOR [G] is do end
			-- Type anchor for `cursor'

end -- class TWO_WAY_LIST
