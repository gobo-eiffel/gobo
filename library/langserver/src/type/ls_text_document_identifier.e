note

	description:
	
		"LSP text document identifiers"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_TEXT_DOCUMENT_IDENTIFIER

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_uri: like uri)
			-- Create a new text document identifier.
		require
			a_uri_not_void: a_uri /= Void
		do
			uri := a_uri
		ensure
			uri_set: uri = a_uri
		end

feature -- Access

	uri: LS_DOCUMENT_URI
			-- The text document's URI

feature -- Field names

	uri_name: STRING_8 = "uri"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_text_document_identifier (Current)
		end

invariant

	uri_not_void: uri /= Void

end
