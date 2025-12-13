note

	description:

		"LSP lists of locations"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_LOCATION_LIST

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
			-- Create a new list of locations.
		do
			make_with_capacity (0)
		ensure
			is_empty: count = 0
			capacity_set: capacity = 0
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new list of locations with capacity `nb`.
		require
			nb_positive: nb >= 1
		do
			create locations.make (nb)
		ensure
			is_empty: count = 0
			capacity_set: capacity = nb
		end

feature -- Measurement

	count: INTEGER
			-- Number of values in the current list
		do
			Result := locations.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = locations.count
		end

	capacity: INTEGER
			-- Maximum number of values in the current list
		do
			Result := locations.capacity
		ensure
			capacity_not_negative: Result >= 0
			definition: Result = locations.capacity
		end

feature -- Access

	location (i: INTEGER): LS_LOCATION
			-- Location at index `i`
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := locations.item (i)
		ensure
			location_not_void: Result /= Void
			definition: Result = locations.item (i)
		end

	locations: DS_ARRAYED_LIST [LS_LOCATION]
			-- Locations

feature -- Element change

	put_last (a_location: LS_LOCATION)
			-- Put `a_location` at the end of the list of locations.
		require
			a_location_not_void: a_location /= Void
		do
			locations.force_last (a_location)
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_location_list (Current)
		end

invariant

	locations_not_void: locations /= Void
	no_void_location: not locations.has_void

end
