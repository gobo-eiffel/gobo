indexing

	description:

		"Eiffel lists of rename pairs"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_RENAME_LIST

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_RENAME_ITEM]
		redefine
			make, make_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make is
			-- Create a new rename clause
		do
			rename_keyword := tokens.rename_keyword
			precursor
		end

	make_with_capacity (nb: INTEGER) is
			-- Create a new rename clause with capacity `nb'.
		do
			rename_keyword := tokens.rename_keyword
			precursor (nb)
		end

feature -- Initialization

	reset is
			-- Reset rename pairs as they were when they were first parsed.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				storage.item (i).rename_pair.reset
				i := i + 1
			end
		end

feature -- Access

	rename_keyword: ET_KEYWORD
			-- 'rename' keyword

	rename_pair (i: INTEGER): ET_RENAME is
			-- `i'-th rename pair
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).rename_pair
		ensure
			rename_pair_not_void: Result /= Void
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := rename_keyword.position
			if Result.is_null and not is_empty then
				Result := first.position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := rename_keyword
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			if is_empty then
				Result := rename_keyword
			else
				Result := last.last_leaf
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if is_empty then
				Result := rename_keyword.break
			else
				Result := last.break
			end
		end

feature -- Setting

	set_rename_keyword (a_rename: like rename_keyword) is
			-- Set `rename_keyword' to `a_rename'.
		require
			a_rename_not_void: a_rename /= Void
		do
			rename_keyword := a_rename
		ensure
			rename_keyword_set: rename_keyword = a_rename
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_rename_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_RENAME_ITEM] is
			-- Fixed array routines
		once
			create Result
		end

invariant

	rename_keyword_not_void: rename_keyword /= Void

end
