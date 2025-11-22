note

	description:

		"LSP 'textDocument/didSave' options"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DID_SAVE_TEXT_DOCUMENT_OPTIONS

inherit

	LS_OPTIONAL_DID_SAVE_TEXT_DOCUMENT_OPTIONS

create

	make

feature {NONE} -- Initialization

	make (a_include_text: like include_text)
			-- Create a new server options.
		do
			include_text := a_include_text
		ensure
			include_text_set: include_text = a_include_text
		end

feature -- Access

	include_text: detachable LS_BOOLEAN
			-- The client is supposed to include the content on save.

feature -- Field names

	include_text_name: STRING_8 = "includeText"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_did_save_text_document_options (Current)
		end

end
