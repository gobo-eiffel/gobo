note

	description:

		"Eiffel comma-separated lists of separate arguments"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2022, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SEPARATE_ARGUMENTS

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_SEPARATE_ARGUMENT_ITEM]
		redefine
			make, make_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new separate argument list.
		do
			separate_keyword := tokens.separate_keyword
			precursor
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new separate argument list with capacity `nb'.
		do
			separate_keyword := tokens.separate_keyword
			precursor (nb)
		end

feature -- Initialization

	reset
			-- Reset separate argument as they were when they were last parsed.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				storage.item (i).argument.reset
				i := i + 1
			end
		end

feature -- Access

	argument (i: INTEGER): ET_SEPARATE_ARGUMENT
			-- Separate argument at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).argument
		ensure
			argument_not_void: Result /= Void
		end

	separate_keyword: ET_KEYWORD
			-- 'separate' keyword

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := separate_keyword.position
			if Result.is_null and not is_empty then
				Result := first.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := separate_keyword
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if is_empty then
				Result := separate_keyword
			else
				Result := last.last_leaf
			end
		end

feature -- Setting

	set_separate_keyword (a_keyword: like separate_keyword)
			-- Set `separate_keyword' to `a_keyword'.
		require
			a_keyword_not_void: a_keyword /= Void
		do
			separate_keyword := a_keyword
		ensure
			separate_keyword_set: separate_keyword = a_keyword
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_separate_arguments (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_SEPARATE_ARGUMENT_ITEM]
			-- Fixed array routines
		once
			create Result
		end

invariant

	separate_keyword_not_void: separate_keyword /= Void

end
