indexing

	description:

		"Eiffel comma-separated lists of inspect choices"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CHOICE_LIST

inherit

	ET_AST_NODE

	ET_AST_LIST [ET_CHOICE_ITEM]
		rename
			make as make_ast_list,
			make_with_capacity as make_ast_list_with_capacity
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (a_choice: like item) is
			-- Create a new choice list with `a_choice' as first item.
		require
			a_choice_not_void: a_choice /= Void
		do
			make_ast_list_with_capacity (1)
			put_first (a_choice)
		ensure
			choice_set: item (1) = a_choice
			capacity_set: capacity = 1
		end

	make_with_capacity (a_choice: like item; nb: INTEGER) is
			-- Create a new choice list with capacity `nb'
			-- and `a_choice' as first item.
		require
			nb_positive: nb >= 1
			a_choice_not_void: a_choice /= Void
		do
			make_ast_list_with_capacity (nb)
			put_first (a_choice)
		ensure
			choice_set: item (1) = a_choice
			capacity_set: capacity = nb
		end

feature -- Access

	choice (i: INTEGER): ET_CHOICE is
			-- Choice at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).choice_item
		ensure
			choice_not_void: Result /= Void
		end

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

	fixed_array: KL_FIXED_ARRAY_ROUTINES [ET_CHOICE_ITEM] is
			-- Fixed array routines
		once
			!! Result
		end

invariant

	not_empty: not is_empty

end -- class ET_CHOICE_LIST
