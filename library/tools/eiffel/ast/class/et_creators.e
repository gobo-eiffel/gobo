indexing

	description:

		"Eiffel creation clause lists"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_CREATORS

inherit

	ET_AST_NODE

	ET_AST_LIST [ET_CREATOR]
		rename
			make as make_ast_list,
			make_with_capacity as make_ast_list_with_capacity
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (a_creator: like item) is
			-- Create a new creation clause list with initially
			-- one clause `a_creator'.
		require
			a_creator_not_void: a_creator /= Void
		do
			make_ast_list_with_capacity (1)
			put_first (a_creator)
		ensure
			creator_set: item (1) = a_creator
			capacity_set: capacity = 1
		end

	make_with_capacity (a_creator: like item; nb: INTEGER) is
			-- Create a new creation clause list with capacity
			-- `nb' and initially one clause `a_creator'.
		require
			a_creator_not_void: a_creator /= Void
			nb_positive: nb >= 1
		do
			make_ast_list_with_capacity (nb)
			put_first (a_creator)
		ensure
			creator_set: item (1) = a_creator
			capacity_set: capacity = nb
		end

feature -- Status report

	is_exported_to (a_name: ET_FEATURE_NAME; a_class: ET_CLASS): BOOLEAN is
			-- Is feature name listed in current creation clauses
			-- and is it exported to `a_class'?
		require
			a_name_not_void: a_name /= Void
			a_class_not_void: a_class /= Void
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if item (i).is_exported_to (a_name, a_class) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
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

	fixed_array: KL_FIXED_ARRAY_ROUTINES [ET_CREATOR] is
			-- Fixed array routines
		once
			!! Result
		end

invariant

	not_empty: not is_empty

end -- class ET_CREATORS
