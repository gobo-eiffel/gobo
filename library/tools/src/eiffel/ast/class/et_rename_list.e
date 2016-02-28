note

	description:

		"Eiffel lists of rename pairs"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"
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

	make
			-- Create a new rename clause
		do
			rename_keyword := tokens.rename_keyword
			precursor
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new rename clause with capacity `nb'.
		do
			rename_keyword := tokens.rename_keyword
			precursor (nb)
		end

feature -- Initialization

	reset
			-- Reset rename pairs as they were when they were last parsed.
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

	rename_pair (i: INTEGER): ET_RENAME
			-- `i'-th rename pair
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).rename_pair
		ensure
			rename_pair_not_void: Result /= Void
		end

	index_of (a_old_name: ET_FEATURE_NAME): INTEGER
			-- Index of rename pair with old name `a_old_name';
			-- 0 if it does not exist
		require
			a_old_name_not_void: a_old_name /= Void
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).rename_pair.old_name.same_feature_name (a_old_name) then
					Result := count - i
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		ensure
			index_large_enough: Result >= 0
			index_small_enough: Result <= count
		end

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := rename_keyword.position
			if Result.is_null and not is_empty then
				Result := first.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := rename_keyword
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if is_empty then
				Result := rename_keyword
			else
				Result := last.last_leaf
			end
		end

feature -- Setting

	set_rename_keyword (a_rename: like rename_keyword)
			-- Set `rename_keyword' to `a_rename'.
		require
			a_rename_not_void: a_rename /= Void
		do
			rename_keyword := a_rename
		ensure
			rename_keyword_set: rename_keyword = a_rename
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_rename_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_RENAME_ITEM]
			-- Fixed array routines
		once
			create Result
		end

invariant

	rename_keyword_not_void: rename_keyword /= Void

end
