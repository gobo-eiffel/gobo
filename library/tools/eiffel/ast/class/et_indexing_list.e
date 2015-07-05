note

	description:

		"Eiffel lists of note clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_INDEXING_LIST

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_INDEXING_ITEM]
		redefine
			make, make_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new note clause
		do
			indexing_keyword := tokens.indexing_keyword
			precursor
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new note clause with capacity `nb'.
		do
			indexing_keyword := tokens.indexing_keyword
			precursor (nb)
		end

feature -- Access

	indexing_keyword: ET_KEYWORD
			-- 'indexing' keyword

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := indexing_keyword.position
			if Result.is_null and not is_empty then
				Result := first.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := indexing_keyword
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if is_empty then
				Result := indexing_keyword
			else
				Result := last.last_leaf
			end
		end

feature -- Setting

	set_indexing_keyword (an_indexing: like indexing_keyword)
			-- Set `indexing_keyword' to `an_indexing'.
		require
			an_indexing_not_void: an_indexing /= Void
		do
			indexing_keyword := an_indexing
		ensure
			indexing_keyword_set: indexing_keyword = an_indexing
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_indexing_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_INDEXING_ITEM]
			-- Fixed array routines
		once
			create Result
		end

invariant

	indexing_keyword_not_void: indexing_keyword /= Void

end
