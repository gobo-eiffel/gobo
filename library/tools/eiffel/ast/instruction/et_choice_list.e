note

	description:

		"Eiffel comma-separated lists of inspect choices"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CHOICE_LIST

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_CHOICE_ITEM]
		redefine
			make, make_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new choice list.
		do
			when_keyword := tokens.when_keyword
			precursor
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new choice list with capacity `nb'.
		do
			when_keyword := tokens.when_keyword
			precursor (nb)
		end

feature -- Initialization

	reset
			-- Reset choices as they were when they were last parsed.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				storage.item (i).choice.reset
				i := i + 1
			end
		end

feature -- Access

	choice (i: INTEGER): ET_CHOICE
			-- Choice at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).choice
		ensure
			choice_not_void: Result /= Void
		end

	when_keyword: ET_KEYWORD
			-- 'when' keyword

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := when_keyword.position
			if Result.is_null and not is_empty then
				Result := first.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := when_keyword
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if is_empty then
				Result := when_keyword
			else
				Result := last.last_leaf
			end
		end

feature -- Setting

	set_when_keyword (a_keyword: like when_keyword)
			-- Set `when_keyword' to `a_keyword'.
		require
			a_keyword_not_void: a_keyword /= Void
		do
			when_keyword := a_keyword
		ensure
			when_keyword_set: when_keyword = a_keyword
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_choice_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_CHOICE_ITEM]
			-- Fixed array routines
		once
			create Result
		end

invariant

	when_keyword_not_void: when_keyword /= Void

end
