indexing

	description:

		"Eiffel invariants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INVARIANTS

inherit

	ET_ASSERTIONS

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (an_invariant: like invariant_keyword) is
			-- Create a new invariant clause.
		require
			an_invariant_not_void: an_invariant /= Void
		do
			invariant_keyword := an_invariant
			make_ast_list
		ensure
			invariant_keyword_set: invariant_keyword = an_invariant
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (an_invariant: like invariant_keyword; nb: INTEGER) is
			-- Create a new invariant clause with capacity `nb'.
		require
			an_invariant_not_void: an_invariant /= Void
			nb_positive: nb >= 0
		do
			invariant_keyword := an_invariant
			make_ast_list_with_capacity (nb)
		ensure
			invariant_keyword_set: invariant_keyword = an_invariant
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	invariant_keyword: ET_TOKEN
			-- 'invariant' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := invariant_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if not is_empty then
				Result := item (count).break
			else
				Result := invariant_keyword.break
			end
		end

invariant

	invariant_keyword_not_void: invariant_keyword /= Void

end
