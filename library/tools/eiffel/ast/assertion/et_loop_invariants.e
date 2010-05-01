note

	description:

		"Eiffel loop invariants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_LOOP_INVARIANTS

inherit

	ET_ASSERTIONS
		redefine
			make, make_with_capacity
		end

create

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

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := invariant_keyword
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			if not is_empty then
				Result := last.last_leaf
			else
				Result := invariant_keyword
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if not is_empty then
				Result := last.break
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
			a_processor.process_loop_invariants (Current)
		end

invariant

	invariant_keyword_not_void: invariant_keyword /= Void

end
