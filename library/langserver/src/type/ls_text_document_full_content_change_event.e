note

	description:
	
		"LSP events describing a full content of a text document"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_TEXT_DOCUMENT_FULL_CONTENT_CHANGE_EVENT

inherit

	LS_TEXT_DOCUMENT_CONTENT_CHANGE_EVENT

create

	make

feature {NONE} -- Initialization

	make (a_text: like text)
			-- Create a new text document full content change event.
		require
			a_text_not_void: a_text /= Void
		do
			text := a_text
		ensure
			text_set: text = a_text
		end

feature -- Access

	text: LS_STRING
			-- The new text of the whole document

feature -- Field names

	text_name: STRING_8 = "text"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_text_document_full_content_change_event (Current)
		end

invariant

	text_not_void: text /= Void

end
