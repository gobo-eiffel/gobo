indexing

	description:

		"Eiffel indexing terms"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INDEXING_TERMS

inherit

	ET_AST_NODE

	ET_AST_LIST [ET_INDEXING_TERM_ITEM]
		rename
			make as make_ast_list,
			make_with_capacity as make_ast_list_with_capacity
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (a_term: like item) is
			-- Create a new indexing term list with initially
			-- one term `a_term'.
		require
			a_term_not_void: a_term /= Void
		do
			make_ast_list_with_capacity (1)
			put_first (a_term)
		ensure
			term_set: item (1) = a_term
			capacity_set: capacity = 1
		end

	make_with_capacity (a_term: like item; nb: INTEGER) is
			-- Create a new indexing term list with capacity
			-- `nb' and initially one term `a_term'.
		require
			a_term_not_void: a_term /= Void
			nb_positive: nb >= 1
		do
			make_ast_list_with_capacity (nb)
			put_first (a_term)
		ensure
			term_set: item (1) = a_term
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

	fixed_array: KL_FIXED_ARRAY_ROUTINES [ET_INDEXING_TERM_ITEM] is
			-- Fixed array routines
		once
			!! Result
		end

invariant

	not_empty: not is_empty

end
