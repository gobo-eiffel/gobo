note

	description:

		"LSP 'textDocument/definition' dynamic registration options"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DEFINITION_REGISTRATION_OPTIONS

inherit

	LS_TEXT_DOCUMENT_REGISTRATION_OPTIONS
		rename
			make as make_text_document_registration_options
		end

	LS_DEFINITION_OPTIONS
		rename
			make as make_definition_options
		redefine
			process
		end

create

	make

feature {NONE} -- Initialization

	make (a_document_selector: like document_selector; a_work_done_progress: like work_done_progress)
			-- Create a new server options.
		require
			a_document_selector_not_void: a_document_selector /= Void
		do
			document_selector := a_document_selector
			work_done_progress := a_work_done_progress
		ensure
			document_selector_set: document_selector = a_document_selector
			work_done_progress_set: work_done_progress = a_work_done_progress
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_definition_registration_options (Current)
		end

end
