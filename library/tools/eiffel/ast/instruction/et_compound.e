indexing

	description:

		"Eiffel instructions compounds"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_COMPOUND

inherit

	ET_AST_NODE

	ET_AST_LIST [ET_INSTRUCTION]
		redefine
			make, make_with_capacity
		end

creation

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

feature -- Access

	keyword: ET_KEYWORD
			-- Keyword preceding the list of instructions

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := keyword.position
			if Result.is_null and not is_empty then
				Result := item (1).position
			end
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
