indexing

	description:

		"Eiffel postcondition lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_POSTCONDITIONS

inherit

	ET_ASSERTIONS

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (an_ensure: like ensure_keyword) is
			-- Create a new postcondition clause.
		require
			an_ensure_not_void: an_ensure /= Void
		do
			ensure_keyword := an_ensure
			make_ast_list
		ensure
			ensure_keyword_set: ensure_keyword = an_ensure
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (an_ensure: like ensure_keyword; nb: INTEGER) is
			-- Create a new postcondition clause with capacity `nb'.
		require
			an_ensure_not_void: an_ensure /= Void
			nb_positive: nb >= 0
		do
			ensure_keyword := an_ensure
			make_ast_list_with_capacity (nb)
		ensure
			ensure_keyword_set: ensure_keyword = an_ensure
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	ensure_keyword: ET_TOKEN
			-- 'ensure' keyword

	then_keyword: ET_TOKEN
			-- 'then' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := ensure_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if not is_empty then
				Result := item (count).break
			elseif then_keyword /= Void then
				Result := then_keyword.break
			else
				Result := ensure_keyword.break
			end
		end

feature -- Status report

	is_ensure_then: BOOLEAN is
			-- Has postcondition clause been declared with "ensure then"?
		do
			Result := (then_keyword /= Void)
		end

feature -- Setting

	set_then_keyword (a_then: like then_keyword) is
			-- Set `else_keyword' to `an_else'.
		do
			then_keyword := a_then
		ensure
			then_keyword_set: then_keyword = a_then
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_postconditions (Current)
		end

invariant

	ensure_keyword_not_void: ensure_keyword /= Void

end
