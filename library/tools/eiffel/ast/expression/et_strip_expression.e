indexing

	description:

		"Eiffel strip expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_STRIP_EXPRESSION

inherit

	ET_EXPRESSION

	ET_FEATURE_NAME_LIST
		rename
			make as make_feature_name_list,
			make_with_capacity as make_feature_name_list_with_capacity
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (a_strip: like strip_keyword; l: like left_parenthesis; r: like right_parenthesis) is
			-- Create a new strip expression.
		require
			a_strip_not_void: a_strip /= Void
			l_not_void: l /= Void
			r_not_void: r /= Void
		do
			strip_keyword := a_strip
			left_parenthesis := l
			right_parenthesis := r
			make_feature_name_list
		ensure
			strip_keyword_set: strip_keyword = a_strip
			left_parenthesis_set: left_parenthesis = l
			right_parenthesis_set: right_parenthesis = r
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (a_strip: like strip_keyword; l: like left_parenthesis;
		r: like right_parenthesis; nb: INTEGER) is
			-- Create a new strip expression with capacity `nb'.
		require
			a_strip_not_void: a_strip /= Void
			l_not_void: l /= Void
			r_not_void: r /= Void
			nb_positive: nb >= 0
		do
			strip_keyword := a_strip
			left_parenthesis := l
			right_parenthesis := r
			make_feature_name_list_with_capacity (nb)
		ensure
			strip_keyword_set: strip_keyword = a_strip
			left_parenthesis_set: left_parenthesis = l
			right_parenthesis_set: right_parenthesis = r
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	strip_keyword: ET_TOKEN
			-- 'strip' keyword

	left_parenthesis: ET_SYMBOL
	right_parenthesis: ET_SYMBOL
			-- Parentheses

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := strip_keyword.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := right_parenthesis.break
		end

feature -- Setting

	set_strip_keyword (a_strip: like strip_keyword) is
			-- Set `strip_keyword' to `a_strip'.
		require
			a_strip_not_void: a_strip /= Void
		do
			strip_keyword := a_strip
		ensure
			strip_keyword_set: strip_keyword = a_strip
		end

	set_left_parenthesis (l: like left_parenthesis) is
			-- Set `left_parenthesis' to `l'.
		require
			l_not_void: l /= Void
		do
			left_parenthesis := l
		ensure
			left_parenthesis_set: left_parenthesis = l
		end

	set_right_parenthesis (r: like right_parenthesis) is
			-- Set `right_parenthesis' to `r'.
		require
			r_not_void: r /= Void
		do
			right_parenthesis := r
		ensure
			right_parenthesis_set: right_parenthesis = r
		end

invariant

	strip_keyword_not_void: strip_keyword /= Void
	left_parenthesis_not_void: left_parenthesis /= Void
	right_parenthesis: right_parenthesis /= Void

end -- class ET_STRIP_EXPRESSION
