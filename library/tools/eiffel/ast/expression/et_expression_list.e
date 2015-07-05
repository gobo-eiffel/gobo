note

	description:

		"Eiffel comma-separated lists of expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_EXPRESSION_LIST

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_EXPRESSION_ITEM]

feature -- Initialization

	reset
			-- Reset expressions as they were when they were last parsed.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				storage.item (i).expression.reset
				i := i + 1
			end
		end

feature -- Access

	expression (i: INTEGER): ET_EXPRESSION
			-- Expression at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).expression
		ensure
			expression_not_void: Result /= Void
		end

	left_symbol: ET_SYMBOL
			-- Symbol before expression list

	right_symbol: ET_SYMBOL
			-- Symbols after expression list

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := left_symbol.position
			if Result.is_null and not is_empty then
				Result := item (1).position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := left_symbol
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := right_symbol
		end

feature -- Setting

	set_left_symbol (l: like left_symbol)
			-- Set `left_symbol' to `l'.
		require
			l_not_void: l /= Void
		do
			left_symbol := l
		ensure
			left_symbol_set: left_symbol = l
		end

	set_right_symbol (r: like right_symbol)
			-- Set `right_symbol' to `r'.
		require
			r_not_void: r /= Void
		do
			right_symbol := r
		ensure
			right_symbol_set: right_symbol = r
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_EXPRESSION_ITEM]
			-- Fixed array routines
		once
			create Result
		end

invariant

	left_symbol_not_void: left_symbol /= Void
	right_symbol_not_void: right_symbol /= Void

end
