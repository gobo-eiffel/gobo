note

	description:

		"LSP 'textDocument/declaration' dynamic registration options"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DECLARATION_REGISTRATION_OPTIONS

inherit

	LS_TEXT_DOCUMENT_REGISTRATION_OPTIONS
		rename
			make as make_text_document_registration_options
		end

	LS_DECLARATION_OPTIONS
		rename
			make as make_declaration_options
		redefine
			process
		end

	LS_STATIC_REGISTRATION_OPTIONS
		rename
			make as make_static_registration_options
		end

create

	make

feature {NONE} -- Initialization

	make (a_document_selector: like document_selector; a_work_done_progress: like work_done_progress; a_id: like id)
			-- Create a new server options.
		require
			a_document_selector_not_void: a_document_selector /= Void
		do
			document_selector := a_document_selector
			work_done_progress := a_work_done_progress
			id := a_id
		ensure
			document_selector_set: document_selector = a_document_selector
			work_done_progress_set: work_done_progress = a_work_done_progress
			id_set: id = a_id
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_declaration_registration_options (Current)
		end

end
