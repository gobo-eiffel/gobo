note

	description:

		"LSP lists of document symbols"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DOCUMENT_SYMBOL_LIST

inherit

	LS_OPTIONAL_DOCUMENT_SYMBOL_RESULT

create

	make,
	make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new list of document symbols.
		do
			make_with_capacity (0)
		ensure
			is_empty: count = 0
			capacity_set: capacity = 0
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new list of document symbols with capacity `nb`.
		require
			nb_positive: nb >= 1
		do
			create document_symbols.make (nb)
		ensure
			is_empty: count = 0
			capacity_set: capacity = nb
		end

feature -- Measurement

	count: INTEGER
			-- Number of values in the current list
		do
			Result := document_symbols.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = document_symbols.count
		end

	capacity: INTEGER
			-- Maximum number of values in the current list
		do
			Result := document_symbols.capacity
		ensure
			capacity_not_negative: Result >= 0
			definition: Result = document_symbols.capacity
		end

feature -- Access

	document_symbol (i: INTEGER): LS_DOCUMENT_SYMBOL
			-- Document symbol at index `i`
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := document_symbols.item (i)
		ensure
			document_symbol_not_void: Result /= Void
			definition: Result = document_symbols.item (i)
		end

	document_symbols: DS_ARRAYED_LIST [LS_DOCUMENT_SYMBOL]
			-- Document symbols

feature -- Element change

	put_last (a_document_symbol: LS_DOCUMENT_SYMBOL)
			-- Put `a_document_symbol` at the end of the list of document symbols.
		require
			a_document_symbol_not_void: a_document_symbol /= Void
		do
			document_symbols.force_last (a_document_symbol)
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_document_symbol_list (Current)
		end

invariant

	document_symbols_not_void: document_symbols /= Void
	no_void_document_symbol: not document_symbols.has_void

end
