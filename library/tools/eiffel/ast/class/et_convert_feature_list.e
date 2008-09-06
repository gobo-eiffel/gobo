indexing

	description:

		"Eiffel lists of conversion features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CONVERT_FEATURE_LIST

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_CONVERT_FEATURE_ITEM]
		redefine
			make, make_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make is
			-- Create a new convert clause
		do
			convert_keyword := tokens.convert_keyword
			precursor
		end

	make_with_capacity (nb: INTEGER) is
			-- Create a new convert clause with capacity `nb'.
		do
			convert_keyword := tokens.convert_keyword
			precursor (nb)
		end

feature -- Initialization

	reset is
			-- Reset convert features as they were when they were last parsed.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				storage.item (i).convert_feature.reset
				i := i + 1
			end
		end

feature -- Access

	convert_keyword: ET_KEYWORD
			-- 'convert' keyword

	convert_feature (i: INTEGER): ET_CONVERT_FEATURE is
			-- `i'-th conversion feature
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).convert_feature
		ensure
			convert_feature_not_void: Result /= Void
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := convert_keyword.position
			if Result.is_null and not is_empty then
				Result := first.position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := convert_keyword
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			if is_empty then
				Result := convert_keyword
			else
				Result := last.last_leaf
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if is_empty then
				Result := convert_keyword.break
			else
				Result := last.break
			end
		end

feature -- Setting

	set_convert_keyword (a_convert: like convert_keyword) is
			-- Set `convert_keyword' to `a_convert'.
		require
			a_convert_not_void: a_convert /= Void
		do
			convert_keyword := a_convert
		ensure
			convert_keyword_set: convert_keyword = a_convert
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_convert_feature_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_CONVERT_FEATURE_ITEM] is
			-- Fixed array routines
		once
			create Result
		end

invariant

	convert_keyword_not_void: convert_keyword /= Void

end
