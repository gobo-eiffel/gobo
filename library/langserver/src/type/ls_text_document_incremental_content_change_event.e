note

	description:
	
		"LSP events describing an incremental change to a text document"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_TEXT_DOCUMENT_INCREMENTAL_CONTENT_CHANGE_EVENT

inherit

	LS_TEXT_DOCUMENT_CONTENT_CHANGE_EVENT

create

	make

feature {NONE} -- Initialization

	make (a_range: like range; a_range_length: like range_length; a_text: like text)
			-- Create a new text document incremental content change event.
		require
			a_range_not_void: a_range /= Void
			a_text_not_void: a_text /= Void
		do
			range := a_range
			range_length := a_range_length
			text := a_text
		ensure
			range_set: range = a_range
			range_length_set: range_length = a_range_length
			text_set: text = a_text
		end

feature -- Access

	range: LS_RANGE
			-- The range of the document that changed.

	range_length: detachable LS_UINTEGER
			-- The optional length of the range that got replaced.
			-- Deprecated: use range instead.

	text: LS_STRING
			-- The new text for the provided range.

feature -- Field names

	range_name: STRING_8 = "range"
	range_length_name: STRING_8 = "rangeLength"
	text_name: STRING_8 = "text"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_text_document_incremental_content_change_event (Current)
		end

invariant

	range_not_void: range /= Void
	text_not_void: text /= Void

end
