note

	description:

		"LSP document selectors"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DOCUMENT_SELECTOR

inherit

	LS_LIST [LS_DOCUMENT_FILTER]
		rename
			make as make_list,
			make_with_capacity as make_list_with_capacity
		end

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
			document_filter_set: value (1) = a_filter
		end

	make_with_capacity (a_filter: LS_DOCUMENT_FILTER; nb: INTEGER)
			-- Create a new document selector with capacity `nb`.
		require
			a_filter_not_void: a_filter /= Void
			nb_positive: nb >= 1
		do
			create values.make (nb)
			values.put_last (a_filter)
		ensure
			count_set: count = 1
			capacity_set: capacity = nb
			document_filter_set: value (1) = a_filter
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_document_selector (Current)
		end

invariant

	not_empty: values.count >= 1

end
