indexing

	description:

		"Eiffel comma-separated list of expressions"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_EXPRESSION_LIST

inherit

	ET_AST_NODE

	KL_IMPORTED_FIXED_ARRAY_TYPE [ET_EXPRESSION_ITEM]

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
			storage := fixed_array.make (nb)
		ensure
			left_symbol_set: left_symbol = l
			right_symbol_set: right_symbol = r
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	item (i: INTEGER): ET_EXPRESSION_ITEM is
			-- Item at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := storage.item (count - i)
		ensure
			item_not_void: Result /= Void
		end

	expression (i: INTEGER): ET_EXPRESSION is
			-- Expression at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).expression_item
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

feature -- Measurement

	count: INTEGER
			-- Number of expressions in list

	capacity: INTEGER is
			-- Maximum number of expressions in list
		do
			if storage /= Void then
				Result := storage.count
			end
		end

feature -- Status report

	is_empty: BOOLEAN is
			-- Is there no expression in list?
		do
			Result := (count = 0)
		ensure
			definition: Result = (count = 0)
		end

feature -- Element change

	put_first (an_item: like item) is
			-- Put `an_item' at first position in list.
		require
			an_item_not_void: an_item /= Void
			not_full: count < capacity
		do
			storage.put (an_item, count)
			count := count + 1
		ensure
			one_more: count = old count + 1
			first: item (1) = an_item
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

feature {NONE} -- Implementation

	storage: like FIXED_ARRAY_TYPE
			-- Internal storage

	fixed_array: KL_FIXED_ARRAY_ROUTINES [ET_EXPRESSION_ITEM] is
			-- Fixed array routines
		once
			!! Result
		ensure
			fixed_array_not_void: Result /= Void
		end

invariant

	count_positive: count >= 0
	consistent_count: count <= capacity
	left_symbol_not_void: left_symbol /= Void
	right_symbol_not_void: right_symbol /= Void
	storage_not_void: not is_empty implies storage /= Void

end -- class ET_EXPRESSION_LIST
