indexing

	description:

		"Eiffel invariants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INVARIANTS

inherit

	ET_ASSERTIONS
		redefine
			make, make_with_capacity
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make is
			-- Create a new invariant clause.
		do
			invariant_keyword := tokens.invariant_keyword
			precursor
		end

	make_with_capacity (nb: INTEGER) is
			-- Create a new invariant clause with capacity `nb'.
		do
			invariant_keyword := tokens.invariant_keyword
			precursor (nb)
		end

feature -- Access

	invariant_keyword: ET_KEYWORD
			-- 'invariant' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := invariant_keyword.position
			if Result.is_null and not is_empty then
				Result := item (1).position
			end
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

feature -- Setting

	set_invariant_keyword (an_invariant: like invariant_keyword) is
			-- Set `invariant_keyword' to `an_invariant'.
		require
			an_invariant_not_void: an_invariant /= Void
		do
			invariant_keyword := an_invariant
		ensure
			invariant_keyword_not_void: invariant_keyword = an_invariant
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_invariants (Current)
		end

invariant

	invariant_keyword_not_void: invariant_keyword /= Void

end
