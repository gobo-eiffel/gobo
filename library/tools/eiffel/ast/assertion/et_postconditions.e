indexing

	description:

		"Eiffel postcondition lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_POSTCONDITIONS

inherit

	ET_ASSERTIONS
		redefine
			make, make_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make is
			-- Create a new postcondition clause.
		do
			ensure_keyword := tokens.ensure_keyword
			precursor
		end

	make_with_capacity (nb: INTEGER) is
			-- Create a new postcondition clause with capacity `nb'.
		do
			ensure_keyword := tokens.ensure_keyword
			precursor (nb)
		end

feature -- Access

	ensure_keyword: ET_KEYWORD
			-- 'ensure' keyword

	then_keyword: ET_KEYWORD
			-- 'then' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := ensure_keyword.position
			if Result.is_null and not is_empty then
				Result := first.position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := ensure_keyword
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			if not is_empty then
				Result := last.last_leaf
			elseif then_keyword /= Void then
				Result := then_keyword
			else
				Result := ensure_keyword
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if not is_empty then
				Result := last.break
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

	set_ensure_keyword (an_ensure: like ensure_keyword) is
			-- Set `ensure_keyword' to `an_ensure'.
		require
			an_ensure_not_void: an_ensure /= Void
		do
			ensure_keyword := an_ensure
		ensure
			ensure_keyword_set: ensure_keyword = an_ensure
		end

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
