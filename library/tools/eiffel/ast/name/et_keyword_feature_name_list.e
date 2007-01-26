indexing

	description:

		"Eiffel comma-separated list of feature names preceded by a keyword"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_KEYWORD_FEATURE_NAME_LIST

inherit

	ET_FEATURE_NAME_LIST
		redefine
			make, make_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make is
			-- Create a new empty feature name list.
		do
			keyword := tokens.redefine_keyword
			precursor
		end

	make_with_capacity (nb: INTEGER) is
			-- Create a new empty feature name list with capacity `nb'.
		do
			keyword := tokens.redefine_keyword
			precursor (nb)
		end

feature -- Access

	keyword: ET_KEYWORD
			-- Keyword preceding the list of feature names

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
			a_processor.process_keyword_feature_name_list (Current)
		end

invariant

	keyword_not_void: keyword /= Void

end
