note

	description:

		"LSP lists of markup kinds"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_MARKUP_KIND_LIST

inherit

	LS_ANY

create

	make,
	make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new list of markup kinds.
		do
			make_with_capacity (0)
		ensure
			is_empty: count = 0
			capacity_set: capacity = 0
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new list of markup kinds with capacity `nb`.
		require
			nb_positive: nb >= 1
		do
			create markup_kinds.make (nb)
		ensure
			is_empty: count = 0
			capacity_set: capacity = nb
		end

feature -- Measurement

	count: INTEGER
			-- Number of values in the current list
		do
			Result := markup_kinds.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = markup_kinds.count
		end

	capacity: INTEGER
			-- Maximum number of values in the current list
		do
			Result := markup_kinds.capacity
		ensure
			capacity_not_negative: Result >= 0
			definition: Result = markup_kinds.capacity
		end

feature -- Access

	markup_kind (i: INTEGER): LS_MARKUP_KIND
			-- Markup kind at index `i`
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := markup_kinds.item (i)
		ensure
			markup_kind_not_void: Result /= Void
			definition: Result = markup_kinds.item (i)
		end

	markup_kinds: DS_ARRAYED_LIST [LS_MARKUP_KIND]
			-- Markup kinds

feature -- Element change

	put_last (a_markup_kind: LS_MARKUP_KIND)
			-- Put `a_markup_kind` at the end of the list of markup kinds.
		require
			a_markup_kind_not_void: a_markup_kind /= Void
		do
			markup_kinds.force_last (a_markup_kind)
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_markup_kind_list (Current)
		end

invariant

	markup_kinds_not_void: markup_kinds /= Void
	no_void_markup_kind: not markup_kinds.has_void

end
