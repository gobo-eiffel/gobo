note

	description:

		"LSP lists of symbol informations"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SYMBOL_INFORMATION_LIST

inherit

	LS_OPTIONAL_DOCUMENT_SYMBOL_RESULT

create

	make,
	make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new list of symbol informations.
		do
			make_with_capacity (0)
		ensure
			is_empty: count = 0
			capacity_set: capacity = 0
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new list of symbol informations with capacity `nb`.
		require
			nb_positive: nb >= 1
		do
			create symbol_informations.make (nb)
		ensure
			is_empty: count = 0
			capacity_set: capacity = nb
		end

feature -- Measurement

	count: INTEGER
			-- Number of values in the current list
		do
			Result := symbol_informations.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = symbol_informations.count
		end

	capacity: INTEGER
			-- Maximum number of values in the current list
		do
			Result := symbol_informations.capacity
		ensure
			capacity_not_negative: Result >= 0
			definition: Result = symbol_informations.capacity
		end

feature -- Access

	symbol_information (i: INTEGER): LS_SYMBOL_INFORMATION
			-- Symbol information at index `i`
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := symbol_informations.item (i)
		ensure
			symbol_information_not_void: Result /= Void
			definition: Result = symbol_informations.item (i)
		end

	symbol_informations: DS_ARRAYED_LIST [LS_SYMBOL_INFORMATION]
			-- Symbol informations

feature -- Element change

	put_last (a_symbol_information: LS_SYMBOL_INFORMATION)
			-- Put `a_symbol_information` at the end of the list of symbol informations.
		require
			a_symbol_information_not_void: a_symbol_information /= Void
		do
			symbol_informations.force_last (a_symbol_information)
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_symbol_information_list (Current)
		end

invariant

	symbol_informations_not_void: symbol_informations /= Void
	no_void_symbol_information: not symbol_informations.has_void

end
