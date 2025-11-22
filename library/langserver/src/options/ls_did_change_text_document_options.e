note

	description:

		"LSP text document 'DidChange' options"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_DID_CHANGE_TEXT_DOCUMENT_OPTIONS

inherit

	LS_SERVER_OPTIONS

feature -- Access

	change: LS_TEXT_DOCUMENT_SYNC_KIND
			-- Change notifications are sent to the server. See
			-- LS_TEXT_DOCUMENT_SYNC_KINDS.None, LS_TEXT_DOCUMENT_SYNC_KINDS.Full and
			-- LS_TEXT_DOCUMENT_SYNC_KINDS.Incremental. If omitted it defaults to
			-- LS_TEXT_DOCUMENT_SYNC_KINDS.None.
		do
			Result := to_sync_kind
		ensure
			change_not_void: Result /= Void
		end

	to_sync_kind: LS_TEXT_DOCUMENT_SYNC_KIND
			-- Text document sync kind
		deferred
		ensure
			to_sync_kind_not_void: Result /= Void
		end

end
