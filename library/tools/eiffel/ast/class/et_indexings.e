indexing

	description:

		"Eiffel indexing clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INDEXINGS

inherit

	ET_AST_NODE

	ET_AST_LIST [ET_INDEXING_ITEM]
		rename
			make as make_ast_list,
			make_with_capacity as make_ast_list_with_capacity
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (an_indexing: like indexing_keyword) is
			-- Create a new indexing clause
		require
			an_indexing_not_void: an_indexing /= Void
		do
			indexing_keyword := an_indexing
			make_ast_list
		ensure
			indexing_keyword_set: indexing_keyword = an_indexing
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (an_indexing: like indexing_keyword; nb: INTEGER) is
			-- Create a new indexing clause with capacity `nb'.
		require
			an_indexing_not_void: an_indexing /= Void
			nb_positive: nb >= 0
		do
			indexing_keyword := an_indexing
			make_ast_list_with_capacity (nb)
		ensure
			indexing_keyword_set: indexing_keyword = an_indexing
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	indexing_keyword: ET_TOKEN
			-- 'indexing' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := indexing_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if is_empty then
				Result := indexing_keyword.break
			else
				Result := item (count).break
			end
		end

feature -- Setting

	set_indexing_keyword (an_indexing: like indexing_keyword) is
			-- Set `indexing_keyword' to `an_indexing'.
		require
			an_indexing_not_void: an_indexing /= Void
		do
			indexing_keyword := an_indexing
		ensure
			indexing_keyword_set: indexing_keyword = an_indexing
		end

feature {NONE} -- Implementation

	fixed_array: KL_FIXED_ARRAY_ROUTINES [ET_INDEXING_ITEM] is
			-- Fixed array routines
		once
			!! Result
		end

invariant

	indexing_keyword_not_void: indexing_keyword /= Void

end
