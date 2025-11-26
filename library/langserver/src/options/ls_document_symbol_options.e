note

	description:

		"LSP 'textDocument/documentSymbol' options"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DOCUMENT_SYMBOL_OPTIONS

inherit

	LS_OPTIONAL_DOCUMENT_SYMBOL_OPTIONS

	LS_WORK_DONE_PROGRESS_OPTIONS
		rename
			make as make_work_done_progress_options
		end

create

	make

feature {NONE} -- Initialization

	make (a_label: like label; a_work_done_progress: like work_done_progress)
			-- Create a new server options.
		do
			label := a_label
			work_done_progress := a_work_done_progress
		ensure
			label_set: label = a_label
			work_done_progress_set: work_done_progress = a_work_done_progress
		end

feature -- Access

	label: detachable LS_STRING
			-- A human-readable string that is shown when multiple outlines trees
			-- are shown for the same document.

feature -- Field names

	label_name: STRING_8 = "label"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_document_symbol_options (Current)
		end

end
