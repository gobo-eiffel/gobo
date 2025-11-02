note

	description:
	"[
		LSP optional versioned text document identifiers.

		Identifiers which optionally denotes a specific version of a text document.
		This information usually flows from the server to the client.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_OPTIONAL_VERSIONED_TEXT_DOCUMENT_IDENTIFIER

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
			-- Create a new optional versioned text document identifier.
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

	version: LS_OPTIONAL_VERSION
			-- The version number of this document. If an optional versioned text document
			-- identifier is sent from the server to the client and the file is not
			-- open in the editor (the server has not received an open notification
			-- before) the server can send `null` to indicate that the version is
			-- known and the content on disk is the master (as specified with document
			-- content ownership).
			--
			-- The version number of a document will increase after each change,
			-- including undo/redo. The number doesn't need to be consecutive.

feature -- Field names

	version_name: STRING_8 = "version"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_optional_versioned_text_document_identifier (Current)
		end

invariant

	version_not_void: version /= Void

end
