indexing

	description:

		"Eiffel instructions compounds"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_COMPOUND

inherit

	ET_AST_NODE

	ET_AST_LIST [ET_INSTRUCTION]
		rename
			make as make_ast_list,
			make_with_capacity as make_ast_list_with_capacity
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (a_keyword: like keyword) is
			-- Create a new compound.
		require
			a_keyword_not_void: a_keyword /= Void
		do
			keyword := a_keyword
			make_ast_list
		ensure
			keyword_set: keyword = a_keyword
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (a_keyword: like keyword; nb: INTEGER) is
			-- Create a new compound with capacity `nb'.
		require
			a_keyword_not_void: a_keyword /= Void
			nb_positive: nb >= 0
		do
			keyword := a_keyword
			make_ast_list_with_capacity (nb)
		ensure
			keyword_set: keyword = a_keyword
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	keyword: ET_TOKEN
			-- Keyword preceding the list of instructions

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if is_empty then
				Result := keyword.break
			else
				Result := item (count).break
			end
		end

feature -- Setting

	set_keyword (a_keyword: like keyword) is
			-- Set `keyword' to `a_keyword'.
		require
			a_keyword_not_void: a_keyword /= Void
		do
			keyword := a_keyword
		ensure
			keyword_set: keyword = a_keyword
		end

feature -- System

	add_to_system is
			-- Recursively add to system classes that
			-- appear in current compound.
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				item (i).add_to_system
				i := i + 1
			end
		end

feature {NONE} -- Implementation

	fixed_array: KL_FIXED_ARRAY_ROUTINES [ET_INSTRUCTION] is
			-- Fixed array routines
		once
			!! Result
		end

invariant

	keyword_not_void: keyword /= Void

end -- class ET_COMPOUND
