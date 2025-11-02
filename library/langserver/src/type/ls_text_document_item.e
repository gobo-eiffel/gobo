note

	description:
	"[
		LSP text document items.

		Items to transfer a text document from the client to the server.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_TEXT_DOCUMENT_ITEM

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_uri: like uri; a_language_id: like language_id; a_version: like version; a_text: like text)
			-- Create a new text document item.
		require
			a_uri_not_void: a_uri /= Void
			a_language_id_not_void: a_language_id /= Void
			a_version_not_void: a_version /= Void
			a_text_not_void: a_text /= Void
		do
			uri := a_uri
			language_id := a_language_id
			version := a_version
			text := a_text
		ensure
			uri_set: uri = a_uri
			language_id_set: language_id = a_language_id
			version_set: version = a_version
			text_set: text = a_text
		end

feature -- Access

	uri: LS_DOCUMENT_URI
			-- The text document's URI

	language_id: LS_STRING
			-- The text document's language identifier

	version: LS_INTEGER
			-- The version number of this document (it will increase after each
			-- change, including undo/redo).

	text: LS_STRING
			-- The content of the opened text document

feature -- Field names

	uri_name: STRING_8 = "uri"
	language_id_name: STRING = "languageId"
	version_name: STRING_8 = "version"
	text_name: STRING_8 = "text"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_text_document_item (Current)
		end

invariant

	uri_not_void: uri /= Void
	language_id_not_void: language_id /= Void
	version_not_void: version /= Void
	text_not_void: text /= Void

end
