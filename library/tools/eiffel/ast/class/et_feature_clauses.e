indexing

	description:

		"Eiffel feature clause lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_FEATURE_CLAUSES

inherit

	ET_AST_NODE

	ET_AST_LIST [ET_FEATURE_CLAUSE]
		rename
			make as make_ast_list,
			make_with_capacity as make_ast_list_with_capacity
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (a_feature_clause: like item) is
			-- Create a new feature clause list with initially
			-- one clause `a_feature_clause'.
		require
			a_feature_clause_not_void: a_feature_clause /= Void
		do
			make_ast_list_with_capacity (1)
			put_first (a_feature_clause)
		ensure
			feature_clause_set: item (1) = a_feature_clause
			capacity_set: capacity = 1
		end

	make_with_capacity (a_feature_clause: like item; nb: INTEGER) is
			-- Create a new feature clause list with capacity
			-- `nb' and initially one clause `a_feature_clause'.
		require
			a_feature_clause_not_void: a_feature_clause /= Void
			nb_positive: nb >= 1
		do
			make_ast_list_with_capacity (nb)
			put_first (a_feature_clause)
		ensure
			feature_clause_set: item (1) = a_feature_clause
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

	fixed_array: KL_FIXED_ARRAY_ROUTINES [ET_FEATURE_CLAUSE] is
			-- Fixed array routines
		once
			!! Result
		end

invariant

	not_empty: not is_empty

end
