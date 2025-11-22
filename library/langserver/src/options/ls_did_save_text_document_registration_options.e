note

	description:

		"LSP text document 'DidSave' dynamic registration options"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DID_SAVE_TEXT_DOCUMENT_REGISTRATION_OPTIONS

inherit

	LS_TEXT_DOCUMENT_REGISTRATION_OPTIONS
		rename
			make as make_text_document_registration_options
		end

	LS_DID_SAVE_TEXT_DOCUMENT_OPTIONS
		rename
			make as make_did_save_text_document_options
		redefine
			process
		end

create

	make

feature {NONE} -- Initialization

	make (a_include_text: like include_text; a_document_selector: like document_selector)
			-- Create a new server options.
		require
			a_document_selector_not_void: a_document_selector /= Void
		do
			include_text := a_include_text
			document_selector := a_document_selector
		ensure
			include_text_set: include_text = a_include_text
			document_selector_set: document_selector = a_document_selector
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_did_save_text_document_registration_options (Current)
		end

end
