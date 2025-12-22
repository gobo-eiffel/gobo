note

	description:

		"LSP lists of text document content change events"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_TEXT_DOCUMENT_CONTENT_CHANGE_EVENT_LIST

inherit

	LS_LIST [LS_TEXT_DOCUMENT_CONTENT_CHANGE_EVENT]

create

	make,
	make_with_capacity

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_text_document_content_change_event_list (Current)
		end

end
