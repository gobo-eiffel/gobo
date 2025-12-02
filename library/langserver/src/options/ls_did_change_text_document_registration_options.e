note

	description:

		"LSP text document 'DidChange' dynamic registration options"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DID_CHANGE_TEXT_DOCUMENT_REGISTRATION_OPTIONS

inherit

	LS_TEXT_DOCUMENT_REGISTRATION_OPTIONS
		rename
			make as make_text_document_registration_options
		end

create

	make

feature {NONE} -- Initialization

	make (a_sync_kind: like sync_kind; a_document_selector: like document_selector)
			-- Create a new server options.
		require
			a_sync_kind_not_void: a_sync_kind /= Void
			a_document_selector_not_void: a_document_selector /= Void
		do
			sync_kind := a_sync_kind
			document_selector := a_document_selector
		ensure
			sync_kind_set: sync_kind = a_sync_kind
			document_selector_set: document_selector = a_document_selector
		end

feature -- Access

	sync_kind: LS_TEXT_DOCUMENT_SYNC_KIND
			-- How documents are synced to the server. See LS_TEXT_DOCUMENT_SYNC_KINDS.Full
			-- and LS_TEXT_DOCUMENT_SYNC_KINDS.Incremental.

feature -- Field names

	sync_kind_name: STRING_8 = "syncKind"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_did_change_text_document_registration_options (Current)
		end

invariant

	sync_kind_not_void: sync_kind /= Void

end
