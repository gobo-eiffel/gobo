indexing

	description:

		"Eiffel lists of inspect when parts"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_WHEN_PART_LIST

inherit

	ET_AST_NODE

	ET_AST_LIST [ET_WHEN_PART]
		rename
			make as make_ast_list,
			make_with_capacity as make_ast_list_with_capacity
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (a_when_part: like item) is
			-- Create a new when part list with `a_when_part' as first item.
		require
			a_when_part_not_void: a_when_part /= Void
		do
			make_ast_list_with_capacity (1)
			put_first (a_when_part)
		ensure
			when_part_set: item (1) = a_when_part
			capacity_set: capacity = 1
		end

	make_with_capacity (a_when_part: like item; nb: INTEGER) is
			-- Create a new when part list with capacity `nb'
			-- and `a_when_part' as first item.
		require
			nb_positive: nb >= 1
			a_when_part_not_void: a_when_part /= Void
		do
			make_ast_list_with_capacity (nb)
			put_first (a_when_part)
		ensure
			when_part_set: item (1) = a_when_part
			capacity_set: capacity = nb
		end

feature -- Access

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := item (1).position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := item (count).break
		end

feature {NONE} -- Implementation

	fixed_array: KL_FIXED_ARRAY_ROUTINES [ET_WHEN_PART] is
			-- Fixed array routines
		once
			!! Result
		end

invariant

	not_empty: not is_empty

end -- class ET_WHEN_PART_LIST
