note

	description:

		"LSP lists of symbol tags"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SYMBOL_TAG_LIST

inherit

	LS_ANY

create

	make,
	make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new list of symbol tags.
		do
			make_with_capacity (0)
		ensure
			is_empty: count = 0
			capacity_set: capacity = 0
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new list of symbol tags with capacity `nb`.
		require
			nb_positive: nb >= 1
		do
			create symbol_tags.make (nb)
		ensure
			is_empty: count = 0
			capacity_set: capacity = nb
		end

feature -- Measurement

	count: INTEGER
			-- Number of values in the current list
		do
			Result := symbol_tags.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = symbol_tags.count
		end

	capacity: INTEGER
			-- Maximum number of values in the current list
		do
			Result := symbol_tags.capacity
		ensure
			capacity_not_negative: Result >= 0
			definition: Result = symbol_tags.capacity
		end

feature -- Access

	symbol_tag (i: INTEGER): LS_SYMBOL_TAG
			-- Symbol tag at index `i`
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := symbol_tags.item (i)
		ensure
			symbol_tag_not_void: Result /= Void
			definition: Result = symbol_tags.item (i)
		end

	symbol_tags: DS_ARRAYED_LIST [LS_SYMBOL_TAG]
			-- Symbol tags

feature -- Element change

	put_last (a_symbol_tag: LS_SYMBOL_TAG)
			-- Put `a_symbol_tag` at the end of the list of symbol tags.
		require
			a_symbol_tag_not_void: a_symbol_tag /= Void
		do
			symbol_tags.force_last (a_symbol_tag)
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_symbol_tag_list (Current)
		end

invariant

	symbol_tags_not_void: symbol_tags /= Void
	no_void_symbol_tag: not symbol_tags.has_void

end
