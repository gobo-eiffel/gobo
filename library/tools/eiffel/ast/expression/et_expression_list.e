indexing

	description:

		"Eiffel comma-separated list of expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_EXPRESSION_LIST

inherit

	ET_AST_NODE

	ET_AST_LIST [ET_EXPRESSION_ITEM]
		rename
			make as make_ast_list,
			make_with_capacity as make_ast_list_with_capacity
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (l: like left_symbol; r: like right_symbol) is
			-- Create a new empty expression list.
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
		do
			left_symbol := l
			right_symbol := r
			make_ast_list
		ensure
			left_symbol_set: left_symbol = l
			right_symbol_set: right_symbol = r
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (l: like left_symbol; r: like right_symbol; nb: INTEGER) is
			-- Create a new empty expression list with capacity `nb'.
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
			nb_positive: nb >= 0
		do
			left_symbol := l
			right_symbol := r
			make_ast_list_with_capacity (nb)
		ensure
			left_symbol_set: left_symbol = l
			right_symbol_set: right_symbol = r
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	expression (i: INTEGER): ET_EXPRESSION is
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
	right_symbol: ET_SYMBOL
			-- Symbols before and after expression list

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := left_symbol.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := right_symbol.break
		end

feature -- Setting

	set_left_symbol (l: like left_symbol) is
			-- Set `left_symbol' to `l'.
		require
			l_not_void: l /= Void
		do
			left_symbol := l
		ensure
			left_symbol_set: left_symbol = l
		end

	set_right_symbol (r: like right_symbol) is
			-- Set `right_symbol' to `r'.
		require
			r_not_void: r /= Void
		do
			right_symbol := r
		ensure
			right_symbol_set: right_symbol = r
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_expression_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_FIXED_ARRAY_ROUTINES [ET_EXPRESSION_ITEM] is
			-- Fixed array routines
		once
			!! Result
		end

invariant

	left_symbol_not_void: left_symbol /= Void
	right_symbol_not_void: right_symbol /= Void

end
