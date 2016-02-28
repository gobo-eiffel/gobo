note

	description:

		"Eiffel strip expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_STRIP_EXPRESSION

inherit

	ET_EXPRESSION
		undefine
			reset
		redefine
			is_never_void
		end

	ET_FEATURE_NAME_LIST
		redefine
			make, make_with_capacity
		end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new strip expression.
		do
			strip_keyword := tokens.strip_keyword
			left_parenthesis := tokens.left_parenthesis_symbol
			right_parenthesis := tokens.right_parenthesis_symbol
			precursor
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new strip expression with capacity `nb'.
		do
			strip_keyword := tokens.strip_keyword
			left_parenthesis := tokens.left_parenthesis_symbol
			right_parenthesis := tokens.right_parenthesis_symbol
			precursor (nb)
		end

feature -- Access

	strip_keyword: ET_KEYWORD
			-- 'strip' keyword

	left_parenthesis: ET_SYMBOL
			-- Left parenthesis

	right_parenthesis: ET_SYMBOL
			-- Right parenthesis

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := strip_keyword.position
			if Result.is_null then
				Result := left_parenthesis.position
				if Result.is_null and not is_empty then
					Result := item (1).position
				end
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := strip_keyword
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := right_parenthesis
		end

feature -- Status report

	is_never_void: BOOLEAN = True
			-- Can current expression never be void?

feature -- Setting

	set_strip_keyword (a_strip: like strip_keyword)
			-- Set `strip_keyword' to `a_strip'.
		require
			a_strip_not_void: a_strip /= Void
		do
			strip_keyword := a_strip
		ensure
			strip_keyword_set: strip_keyword = a_strip
		end

	set_left_parenthesis (l: like left_parenthesis)
			-- Set `left_parenthesis' to `l'.
		require
			l_not_void: l /= Void
		do
			left_parenthesis := l
		ensure
			left_parenthesis_set: left_parenthesis = l
		end

	set_right_parenthesis (r: like right_parenthesis)
			-- Set `right_parenthesis' to `r'.
		require
			r_not_void: r /= Void
		do
			right_parenthesis := r
		ensure
			right_parenthesis_set: right_parenthesis = r
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_strip_expression (Current)
		end

invariant

	strip_keyword_not_void: strip_keyword /= Void
	left_parenthesis_not_void: left_parenthesis /= Void
	right_parenthesis: right_parenthesis /= Void

end
