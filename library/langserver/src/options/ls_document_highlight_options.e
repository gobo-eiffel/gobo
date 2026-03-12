note

	description:

		"LSP 'textDocument/documentHighlight' options"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class LS_DOCUMENT_HIGHLIGHT_OPTIONS

inherit

	LS_OPTIONAL_DOCUMENT_HIGHLIGHT_OPTIONS

	LS_WORK_DONE_PROGRESS_OPTIONS

create

	make

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_document_highlight_options (Current)
		end

end
