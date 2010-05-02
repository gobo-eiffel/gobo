note

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

	make
			-- Create a new convert clause
		do
			convert_keyword := tokens.convert_keyword
			precursor
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new convert clause with capacity `nb'.
		do
			convert_keyword := tokens.convert_keyword
			precursor (nb)
		end

feature -- Initialization

	reset
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

	convert_feature (i: INTEGER): ET_CONVERT_FEATURE
			-- `i'-th conversion feature
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).convert_feature
		ensure
			convert_feature_not_void: Result /= Void
		end

	index_of (a_name: ET_FEATURE_NAME): INTEGER
			-- Index of convert feature named `a_name';
			-- 0 if it does not exist
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				if storage.item (i).convert_feature.name.same_feature_name (a_name) then
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
			Result := convert_keyword.position
			if Result.is_null and not is_empty then
				Result := first.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := convert_keyword
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if is_empty then
				Result := convert_keyword
			else
				Result := last.last_leaf
			end
		end

	break: ET_BREAK
			-- Break which appears just after current node
		do
			if is_empty then
				Result := convert_keyword.break
			else
				Result := last.break
			end
		end

feature -- Setting

	set_convert_keyword (a_convert: like convert_keyword)
			-- Set `convert_keyword' to `a_convert'.
		require
			a_convert_not_void: a_convert /= Void
		do
			convert_keyword := a_convert
		ensure
			convert_keyword_set: convert_keyword = a_convert
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_convert_feature_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_CONVERT_FEATURE_ITEM]
			-- Fixed array routines
		once
			create Result
		end

invariant

	convert_keyword_not_void: convert_keyword /= Void

end
