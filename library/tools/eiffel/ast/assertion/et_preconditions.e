indexing

	description:

		"Eiffel precondition lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_PRECONDITIONS

inherit

	ET_ASSERTIONS

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (a_require: like require_keyword) is
			-- Create a new precondition clause.
		require
			a_require_not_void: a_require /= Void
		do
			require_keyword := a_require
			make_ast_list
		ensure
			require_keyword_set: require_keyword = a_require
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (a_require: like require_keyword; nb: INTEGER) is
			-- Create a new precondition clause with capacity `nb'.
		require
			a_require_not_void: a_require /= Void
			nb_positive: nb >= 0
		do
			require_keyword := a_require
			make_ast_list_with_capacity (nb)
		ensure
			require_keyword_set: require_keyword = a_require
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	require_keyword: ET_TOKEN
			-- 'require' keyword

	else_keyword: ET_TOKEN
			-- 'else' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := require_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if not is_empty then
				Result := item (count).break
			elseif else_keyword /= Void then
				Result := else_keyword.break
			else
				Result := require_keyword.break
			end
		end

feature -- Status report

	is_require_else: BOOLEAN is
			-- Has precondition clause been declared with "require else"?
		do
			Result := (else_keyword /= Void)
		end

feature -- Setting

	set_else_keyword (an_else: like else_keyword) is
			-- Set `else_keyword' to `an_else'.
		do
			else_keyword := an_else
		ensure
			else_keyword_set: else_keyword = an_else
		end

invariant

	require_keyword_not_void: require_keyword /= Void

end
