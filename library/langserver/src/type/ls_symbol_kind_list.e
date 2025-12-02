note

	description:

		"LSP lists of symbol kinds"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SYMBOL_KIND_LIST

inherit

	LS_ANY

create

	make,
	make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new list of symbol kinds.
		do
			make_with_capacity (0)
		ensure
			is_empty: count = 0
			capacity_set: capacity = 0
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new list of symbol kinds with capacity `nb`.
		require
			nb_positive: nb >= 1
		do
			create symbol_kinds.make (nb)
		ensure
			is_empty: count = 0
			capacity_set: capacity = nb
		end

feature -- Measurement

	count: INTEGER
			-- Number of values in the current list
		do
			Result := symbol_kinds.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = symbol_kinds.count
		end

	capacity: INTEGER
			-- Maximum number of values in the current list
		do
			Result := symbol_kinds.capacity
		ensure
			capacity_not_negative: Result >= 0
			definition: Result = symbol_kinds.capacity
		end

feature -- Access

	symbol_kind (i: INTEGER): LS_SYMBOL_KIND
			-- Symbol kind at index `i`
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := symbol_kinds.item (i)
		ensure
			symbol_kind_not_void: Result /= Void
			definition: Result = symbol_kinds.item (i)
		end

	symbol_kinds: DS_ARRAYED_LIST [LS_SYMBOL_KIND]
			-- Symbol kinds

feature -- Element change

	put_last (a_symbol_kind: LS_SYMBOL_KIND)
			-- Put `a_symbol_kind` at the end of the list of symbol kinds.
		require
			a_symbol_kind_not_void: a_symbol_kind /= Void
		do
			symbol_kinds.force_last (a_symbol_kind)
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_symbol_kind_list (Current)
		end

invariant

	symbol_kinds_not_void: symbol_kinds /= Void
	no_void_symbol_kind: not symbol_kinds.has_void

end
