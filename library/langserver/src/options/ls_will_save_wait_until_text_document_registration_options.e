note

	description:

		"LSP 'textDocument/willSaveWaitUntil' dynamic registration options"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REGISTRATION_OPTIONS

inherit

	LS_TEXT_DOCUMENT_REGISTRATION_OPTIONS

create

	make

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_will_save_wait_until_text_document_registration_options (Current)
		end

end
