indexing

	description:

		"Eiffel debug keys"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DEBUG_KEYS

inherit

	ET_AST_NODE

	ET_AST_LIST [ET_MANIFEST_STRING_ITEM]
		rename
			make as make_ast_list,
			make_with_capacity as make_ast_list_with_capacity
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (l: like left_parenthesis; r: like right_parenthesis) is
			-- Create a new debug keys.
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
		do
			left_parenthesis := l
			right_parenthesis := r
			make_ast_list
		ensure
			left_parenthesis_set: left_parenthesis = l
			right_parenthesis_set: right_parenthesis = r
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (l: like left_parenthesis; r: like right_parenthesis; nb: INTEGER) is
			-- Create a new debug keys with capacity `nb'.
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
			nb_positive: nb >= 0
		do
			left_parenthesis := l
			right_parenthesis := r
			make_ast_list_with_capacity (nb)
		ensure
			left_parenthesis_set: left_parenthesis = l
			right_parenthesis_set: right_parenthesis = r
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	key (i: INTEGER): ET_MANIFEST_STRING is
			-- Key at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).manifest_string
		ensure
			key_not_void: Result /= Void
		end

	left_parenthesis: ET_SYMBOL
			-- Left parenthesis

	right_parenthesis: ET_SYMBOL
			-- Right parenthesis

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := left_parenthesis.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := right_parenthesis.break
		end

feature -- Setting

	set_left_parenthesis (l: like left_parenthesis) is
			-- Set `left_parenthesis' to `l'.
		require
			l_not_void: l /= Void
		do
			left_parenthesis := l
		ensure
			left_parenthesis_set: left_parenthesis = l
		end

	set_right_parenthesis (r: like right_parenthesis) is
			-- Set `right_parenthesis' to `r'.
		require
			r_not_void: r /= Void
		do
			right_parenthesis := r
		ensure
			right_parenthesis_set: right_parenthesis = r
		end

feature {NONE} -- Implementation

	fixed_array: KL_FIXED_ARRAY_ROUTINES [ET_MANIFEST_STRING_ITEM] is
			-- Fixed array routines
		once
			!! Result
		end

invariant

	left_parenthesis_not_void: left_parenthesis /= Void
	right_parenthesis: right_parenthesis /= Void

end
