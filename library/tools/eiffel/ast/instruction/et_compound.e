indexing

	description:

		"Eiffel instruction compounds"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_COMPOUND

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_INSTRUCTION]
		redefine
			make, make_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make is
			-- Create a new compound.
		do
			keyword := tokens.do_keyword
			precursor
		end

	make_with_capacity (nb: INTEGER) is
			-- Create a new compound with capacity `nb'.
		do
			keyword := tokens.do_keyword
			precursor (nb)
		end

feature -- Initialization

	reset is
			-- Reset instructions as they were when they were first parsed.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				storage.item (i).reset
				i := i + 1
			end
		end

feature -- Access

	keyword: ET_KEYWORD
			-- Keyword preceding the list of instructions

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := keyword.position
			if Result.is_null and not is_empty then
				Result := first.position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := keyword
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			if is_empty then
				Result := keyword
			else
				Result := last.last_leaf
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if is_empty then
				Result := keyword.break
			else
				Result := last.break
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

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_compound (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_INSTRUCTION] is
			-- Fixed array routines
		once
			create Result
		end

invariant

	keyword_not_void: keyword /= Void

end
