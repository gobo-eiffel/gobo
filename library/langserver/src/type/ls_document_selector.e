note

	description:

		"LSP document selectors"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DOCUMENT_SELECTOR

inherit

	LS_OPTIONAL_DOCUMENT_SELECTOR

create

	make,
	make_with_capacity

feature {NONE} -- Initialization

	make (a_filter: LS_DOCUMENT_FILTER)
			-- Create a new document selector.
		require
			a_filter_not_void: a_filter /= Void
		do
			make_with_capacity (a_filter, 1)
		ensure
			count_set: count = 1
			capacity_set: capacity = 1
			document_filter_set: document_filter (1) = a_filter
		end

	make_with_capacity (a_filter: LS_DOCUMENT_FILTER; nb: INTEGER)
			-- Create a new document selector with capacity `nb`.
		require
			a_filter_not_void: a_filter /= Void
			nb_positive: nb >= 1
		do
			create document_filters.make (nb)
			document_filters.put_last (a_filter)
		ensure
			count_set: count = 1
			capacity_set: capacity = nb
			document_filter_set: document_filter (1) = a_filter
		end

feature -- Measurement

	count: INTEGER
			-- Number of values in the current array
		do
			Result := document_filters.count
		ensure
			count_positive: Result >= 1
			definition: Result = document_filters.count
		end

	capacity: INTEGER
			-- Maximum number of values in the current array
		do
			Result := document_filters.capacity
		ensure
			capacity_positive: Result >= 1
			definition: Result = document_filters.capacity
		end

feature -- Access

	document_filter (i: INTEGER): LS_DOCUMENT_FILTER
			-- Document filter at index `i`
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := document_filters.item (i)
		ensure
			document_filter_not_void: Result /= Void
			definition: Result = document_filters.item (i)
		end

	document_filters: DS_ARRAYED_LIST [LS_DOCUMENT_FILTER]
			-- Document filters

feature -- Element change

	put_last (a_filter: LS_DOCUMENT_FILTER)
			-- Put `a_filter` at the end of the document filters.
		require
			a_filter_not_void: a_filter /= Void
		do
			document_filters.force_last (a_filter)
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_document_selector (Current)
		end

invariant

	document_filters_not_void: document_filters /= Void
	no_void_document_filter: not document_filters.has_void
	not_empty: document_filters.count >= 1

end
