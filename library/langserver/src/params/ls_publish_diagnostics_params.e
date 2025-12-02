note

	description:

		"LSP 'textDocument/publishDiagnostics' parameters"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_PUBLISH_DIAGNOSTICS_PARAMS

inherit

	LS_ANY

feature -- Access

	uri: LS_DOCUMENT_URI
			-- The URI for which diagnostic information is reported.

	version: detachable LS_INTEGER
			-- Optional the version number of the document the diagnostics
			-- are published for.

	diagnostics: LS_DIAGNOSTIC_LIST
			-- An array of diagnostic information items.

feature -- Field names

	uri_name: STRING_8 = "uri"
	version_name: STRING_8 = "version"
	diagnostics_name: STRING_8 = "diagnostics"
			-- Field names

invariant

	uri_not_void: uri /= Void
	diagnostics_not_void: diagnostics /= Void

end
