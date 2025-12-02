note

	description:

		"LSP lists of text document content change events"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_TEXT_DOCUMENT_CONTENT_CHANGE_EVENT_LIST

inherit

	LS_ANY

create

	make,
	make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new list of text document content change events.
		do
			make_with_capacity (0)
		ensure
			is_empty: count = 0
			capacity_set: capacity = 0
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new list of text document content change events with capacity `nb`.
		require
			nb_positive: nb >= 1
		do
			create text_document_content_change_events.make (nb)
		ensure
			is_empty: count = 0
			capacity_set: capacity = nb
		end

feature -- Measurement

	count: INTEGER
			-- Number of values in the current list
		do
			Result := text_document_content_change_events.count
		ensure
			count_not_negative: Result >= 0
			definition: Result = text_document_content_change_events.count
		end

	capacity: INTEGER
			-- Maximum number of values in the current list
		do
			Result := text_document_content_change_events.capacity
		ensure
			capacity_not_negative: Result >= 0
			definition: Result = text_document_content_change_events.capacity
		end

feature -- Access

	text_document_content_change_event (i: INTEGER): LS_TEXT_DOCUMENT_CONTENT_CHANGE_EVENT
			-- Text document content change events at index `i`
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := text_document_content_change_events.item (i)
		ensure
			text_document_content_change_event_not_void: Result /= Void
			definition: Result = text_document_content_change_events.item (i)
		end

	text_document_content_change_events: DS_ARRAYED_LIST [LS_TEXT_DOCUMENT_CONTENT_CHANGE_EVENT]
			-- Text document content change events

feature -- Element change

	put_last (a_text_document_content_change_event: LS_TEXT_DOCUMENT_CONTENT_CHANGE_EVENT)
			-- Put `a_text_document_content_change_events` at the end of the list of text document content change events.
		require
			a_text_document_content_change_event_not_void: a_text_document_content_change_event /= Void
		do
			text_document_content_change_events.force_last (a_text_document_content_change_event)
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_text_document_content_change_event_list (Current)
		end

invariant

	text_document_content_change_events_not_void: text_document_content_change_events /= Void
	no_void_text_document_content_change_event: not text_document_content_change_events.has_void

end
