indexing

	description:

		"Eiffel local variable lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_LOCAL_VARIABLES

inherit

	ET_AST_NODE

	ET_AST_LIST [ET_LOCAL_VARIABLE_ITEM]
		rename
			make as make_ast_list,
			make_with_capacity as make_ast_list_with_capacity
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (a_local: like local_keyword) is
			-- Create a new local variable list.
		require
			a_local_not_void: a_local /= Void
		do
			local_keyword := a_local
			make_ast_list
		ensure
			local_keyword_set: local_keyword = a_local
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (a_local: like local_keyword; nb: INTEGER) is
			-- Create a new local variable list with capacity `nb'.
		require
			a_local_not_void: a_local /= Void
			nb_positive: nb >= 0
		do
			local_keyword := a_local
			make_ast_list_with_capacity (nb)
		ensure
			local_keyword_set: local_keyword = a_local
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	local_variable (i: INTEGER): ET_LOCAL_VARIABLE is
			-- Local variable at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).local_variable_item
		ensure
			local_variable_not_void: Result /= Void
		end

	local_keyword: ET_TOKEN
			-- 'local' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := local_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if is_empty then
				Result := local_keyword.break
			else
				Result := item (count).break
			end
		end

feature -- Setting

	set_local_keyword (a_local: like local_keyword) is
			-- Set `local_keyword' to `a_local'.
		require
			a_local_not_void: a_local /= Void
		do
			local_keyword := a_local
		ensure
			local_keyword_set: local_keyword = a_local
		end

feature -- System

	add_to_system is
			-- Recursively add to system classes that
			-- appear in current local declarations.
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				local_variable (i).type.add_to_system
				i := i + 1
			end
		end

feature {NONE} -- Implementation

	fixed_array: KL_FIXED_ARRAY_ROUTINES [ET_LOCAL_VARIABLE_ITEM] is
			-- Fixed array routines
		once
			!! Result
		end

invariant

	local_keyword_not_void: local_keyword /= Void

end
