note

	description:

		"LSP lists of file events"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_FILE_EVENT_LIST

inherit

	LS_ANY

create

	make,
	make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new list of file events.
		do
			make_with_capacity (0)
		ensure
			is_empty: count = 0
			capacity_set: capacity = 0
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new list of file events with capacity `nb`.
		require
			nb_positive: nb >= 1
		do
			create file_events.make (nb)
		ensure
			is_empty: count = 0
			capacity_set: capacity = nb
		end

feature -- Measurement

	count: INTEGER
			-- Number of values in the current list
		do
			Result := file_events.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = file_events.count
		end

	capacity: INTEGER
			-- Maximum number of values in the current list
		do
			Result := file_events.capacity
		ensure
			capacity_not_negative: Result >= 0
			definition: Result = file_events.capacity
		end

feature -- Access

	file_event (i: INTEGER): LS_FILE_EVENT
			-- File event at index `i`
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := file_events.item (i)
		ensure
			file_event_not_void: Result /= Void
			definition: Result = file_events.item (i)
		end

	file_events: DS_ARRAYED_LIST [LS_FILE_EVENT]
			-- File events

feature -- Element change

	put_last (a_file_event: LS_FILE_EVENT)
			-- Put `a_file_event` at the end of the list of file events.
		require
			a_file_event_not_void: a_file_event /= Void
		do
			file_events.force_last (a_file_event)
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_file_event_list (Current)
		end

invariant

	file_events_not_void: file_events /= Void
	no_void_file_event: not file_events.has_void

end
