indexing

	description:

		"Eiffel comma-separated list of feature names preceded by a keyword"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_KEYWORD_FEATURE_NAME_LIST

inherit

	ET_FEATURE_NAME_LIST
		rename
			make as make_feature_name_list,
			make_with_capacity as make_feature_name_list_with_capacity
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (a_keyword: like keyword) is
			-- Create a new empty feature name list.
		require
			a_keyword_not_void: a_keyword /= Void
		do
			keyword := a_keyword
		ensure
			keyword_set: keyword = a_keyword
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (a_keyword: like keyword; nb: INTEGER) is
			-- Create a new empty feature name list with capacity `nb'.
		require
			a_keyword_not_void: a_keyword /= Void
			nb_positive: nb >= 0
		do
			keyword := a_keyword
			storage := fixed_array.make (nb)
		ensure
			keyword_set: keyword = a_keyword
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	keyword: ET_TOKEN
			-- Keyword preceding the list of feature names

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := keyword.position
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

invariant

	keyword_not_void: keyword /= Void

end -- class ET_KEYWORD_FEATURE_NAME_LIST
