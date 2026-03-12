note

	description:

		"LSP lists of document highlights"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class LS_DOCUMENT_HIGHLIGHT_LIST

inherit

	LS_LIST [LS_DOCUMENT_HIGHLIGHT]

	LS_DOCUMENT_HIGHLIGHT_RESULT

create

	make,
	make_with_capacity

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_document_highlight_list (Current)
		end

end
