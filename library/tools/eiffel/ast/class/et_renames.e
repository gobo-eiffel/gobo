indexing

	description:

		"Eiffel rename clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_RENAMES

inherit

	ET_AST_NODE

	ET_AST_LIST [ET_RENAME]
		rename
			make as make_ast_list,
			make_with_capacity as make_ast_list_with_capacity
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (a_rename: like rename_keyword) is
			-- Create a new rename clause
		require
			a_rename_not_void: a_rename /= Void
		do
			rename_keyword := a_rename
			make_ast_list
		ensure
			rename_keyword_set: rename_keyword = a_rename
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (a_rename: like rename_keyword; nb: INTEGER) is
			-- Create a new rename clause with capacity `nb'.
		require
			a_rename_not_void: a_rename /= Void
			nb_positive: nb >= 0
		do
			rename_keyword := a_rename
			make_ast_list_with_capacity (nb)
		ensure
			rename_keyword_set: rename_keyword = a_rename
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	rename_keyword: ET_KEYWORD
			-- 'rename' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := rename_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if is_empty then
				Result := rename_keyword.break
			else
				Result := item (count).break
			end
		end

feature -- Setting

	set_rename_keyword (a_rename: like rename_keyword) is
			-- Set `rename_keyword' to `a_rename'.
		require
			a_rename_not_void: a_rename /= Void
		do
			rename_keyword := a_rename
		ensure
			rename_keyword_set: rename_keyword = a_rename
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_renames (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_FIXED_ARRAY_ROUTINES [ET_RENAME] is
			-- Fixed array routines
		once
			!! Result
		end

invariant

	rename_keyword_not_void: rename_keyword /= Void

end
