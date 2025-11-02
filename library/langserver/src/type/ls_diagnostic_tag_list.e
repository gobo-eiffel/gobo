note

	description:

		"LSP lists of diagnostic tags"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DIAGNOSTIC_TAG_LIST

inherit

	LS_ANY

create

	make,
	make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new list of diagnostic tags.
		do
			make_with_capacity (0)
		ensure
			is_empty: count = 0
			capacity_set: capacity = 0
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new list of diagnostic tags with capacity `nb`.
		require
			nb_positive: nb >= 1
		do
			create diagnostic_tags.make (nb)
		ensure
			is_empty: count = 0
			capacity_set: capacity = nb
		end

feature -- Measurement

	count: INTEGER
			-- Number of values in the current list
		do
			Result := diagnostic_tags.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = diagnostic_tags.count
		end

	capacity: INTEGER
			-- Maximum number of values in the current list
		do
			Result := diagnostic_tags.capacity
		ensure
			capacity_not_negative: Result >= 0
			definition: Result = diagnostic_tags.capacity
		end

feature -- Access

	diagnostic_tag (i: INTEGER): LS_DIAGNOSTIC_TAG
			-- Diagnostic tag at index `i`
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := diagnostic_tags.item (i)
		ensure
			diagnostic_tag_not_void: Result /= Void
			definition: Result = diagnostic_tags.item (i)
		end

	diagnostic_tags: DS_ARRAYED_LIST [LS_DIAGNOSTIC_TAG]
			-- Diagnostic tags

feature -- Element change

	put_last (a_diagnostic_tag: LS_DIAGNOSTIC_TAG)
			-- Put `a_diagnostic_tag` at the end of the list of diagnostic tags.
		require
			a_diagnostic_tag_not_void: a_diagnostic_tag /= Void
		do
			diagnostic_tags.force_last (a_diagnostic_tag)
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_diagnostic_tag_list (Current)
		end

invariant

	diagnostic_tags_not_void: diagnostic_tags /= Void
	no_void_diagnostic_tag: not diagnostic_tags.has_void

end
