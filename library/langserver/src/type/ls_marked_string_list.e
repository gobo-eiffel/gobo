note

	description:

		"LSP lists of marked strings"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_MARKED_STRING_LIST

inherit

	LS_STRING_CONTENT

create

	make,
	make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new list of marked strings.
		do
			make_with_capacity (0)
		ensure
			is_empty: count = 0
			capacity_set: capacity = 0
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new list of marked strings with capacity `nb`.
		require
			nb_positive: nb >= 1
		do
			create marked_strings.make (nb)
		ensure
			is_empty: count = 0
			capacity_set: capacity = nb
		end

feature -- Measurement

	count: INTEGER
			-- Number of values in the current list
		do
			Result := marked_strings.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = marked_strings.count
		end

	capacity: INTEGER
			-- Maximum number of values in the current list
		do
			Result := marked_strings.capacity
		ensure
			capacity_not_negative: Result >= 0
			definition: Result = marked_strings.capacity
		end

feature -- Access

	marked_string (i: INTEGER): LS_MARKED_STRING
			-- Markedstring at index `i`
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := marked_strings.item (i)
		ensure
			marked_string_not_void: Result /= Void
			definition: Result = marked_strings.item (i)
		end

	marked_strings: DS_ARRAYED_LIST [LS_MARKED_STRING]
			-- Markedstrings

feature -- Element change

	put_last (a_marked_string: LS_MARKED_STRING)
			-- Put `a_marked_string` at the end of the list of marked strings.
		require
			a_marked_string_not_void: a_marked_string /= Void
		do
			marked_strings.force_last (a_marked_string)
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_marked_string_list (Current)
		end

invariant

	marked_strings_not_void: marked_strings /= Void
	no_void_marked_string: not marked_strings.has_void

end
