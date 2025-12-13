note

	description:

		"LSP lists of location links"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_LOCATION_LINK_LIST

inherit

	LS_OPTIONAL_DEFINITION_RESULT

	LS_OPTIONAL_TYPE_DEFINITION_RESULT

	LS_OPTIONAL_DECLARATION_RESULT

	LS_OPTIONAL_IMPLEMENTATION_RESULT

create

	make,
	make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new list of location links.
		do
			make_with_capacity (0)
		ensure
			is_empty: count = 0
			capacity_set: capacity = 0
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new list of location links with capacity `nb`.
		require
			nb_positive: nb >= 1
		do
			create location_links.make (nb)
		ensure
			is_empty: count = 0
			capacity_set: capacity = nb
		end

feature -- Measurement

	count: INTEGER
			-- Number of values in the current list
		do
			Result := location_links.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = location_links.count
		end

	capacity: INTEGER
			-- Maximum number of values in the current list
		do
			Result := location_links.capacity
		ensure
			capacity_not_negative: Result >= 0
			definition: Result = location_links.capacity
		end

feature -- Access

	location_link (i: INTEGER): LS_LOCATION_LINK
			-- Location link at index `i`
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := location_links.item (i)
		ensure
			location_link_not_void: Result /= Void
			definition: Result = location_links.item (i)
		end

	location_links: DS_ARRAYED_LIST [LS_LOCATION_LINK]
			-- Location links

feature -- Element change

	put_last (a_location_link: LS_LOCATION_LINK)
			-- Put `a_location_link` at the end of the list of location links.
		require
			a_location_link_not_void: a_location_link /= Void
		do
			location_links.force_last (a_location_link)
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_location_link_list (Current)
		end

invariant

	location_links_not_void: location_links /= Void
	no_void_location_link: not location_links.has_void

end
