note

	description:
	"[
		LSP versioned text document identifiers.

		Identifiers to denote a specific version of a text document.
		This information usually flows from the client to the server.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_VERSIONED_TEXT_DOCUMENT_IDENTIFIER

inherit

	LS_TEXT_DOCUMENT_IDENTIFIER
		rename
			make as make_text_document_identifier
		redefine
			process
		end

create

	make

feature {NONE} -- Initialization

	make (a_uri: like uri; a_version: like version)
			-- Create a new versioned text document identifier.
		require
			a_uri_not_void: a_uri /= Void
			a_version_not_void: a_version /= Void
		do
			uri := a_uri
			version := a_version
		ensure
			uri_set: uri = a_uri
			version_set: version = a_version
		end

feature -- Access

	version: LS_INTEGER
			-- The version number of this document.
			--
			-- The version number of a document will increase after each change,

feature -- Field names

	version_name: STRING_8 = "version"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_versioned_text_document_identifier (Current)
		end

invariant

	version_not_void: version /= Void

end
