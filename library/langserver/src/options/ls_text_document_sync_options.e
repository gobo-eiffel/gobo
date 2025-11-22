note

	description:

		"LSP text document sync options"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_TEXT_DOCUMENT_SYNC_OPTIONS

inherit

	LS_TEXT_DOCUMENT_SYNC_GENERAL_OPTIONS

create

	make

feature {NONE} -- Initialization

	make (a_open_close: like open_close; a_change: like change; a_will_save: like will_save; a_will_save_wait_until: like will_save_wait_until; a_save: like save)
			-- Create a new server options.
		do
			open_close := a_open_close
			change := a_change
			will_save := a_will_save
			will_save_wait_until := a_will_save_wait_until
			save := a_save
		ensure
			open_close_set: open_close = a_open_close
			change_set: change = a_change
			will_save: will_save = a_will_save
			will_save_wait_until_set: will_save_wait_until = a_will_save_wait_until
			save_set: save = a_save
		end

feature -- Access

	open_close: detachable LS_BOOLEAN
			-- Open and close notifications are sent to the server. If omitted open
			-- close notifications should not be sent.

	change: detachable LS_TEXT_DOCUMENT_SYNC_KIND
			-- Change notifications are sent to the server. See
			-- LS_TEXT_DOCUMENT_SYNC_KINDS.None, LS_TEXT_DOCUMENT_SYNC_KINDS.Full and
			-- LS_TEXT_DOCUMENT_SYNC_KINDS.Incremental. If omitted it defaults to
			-- LS_TEXT_DOCUMENT_SYNC_KINDS.None.

	will_save: detachable LS_BOOLEAN
			-- If present will save notifications are sent to the server. If omitted
			-- the notification should not be sent.

	will_save_wait_until: detachable LS_BOOLEAN
			-- If present will save wait until requests are sent to the server. If
			-- omitted the request should not be sent.

	save: detachable LS_OPTIONAL_DID_SAVE_TEXT_DOCUMENT_OPTIONS
			-- If present save notifications are sent to the server. If omitted the
			-- notification should not be sent.

feature -- Field names

	open_close_name: STRING_8 = "openClose"
	change_name: STRING_8 = "change"
	will_save_name: STRING_8 = "willSave"
	will_save_wait_until_name: STRING_8 = "willSaveWaitUntil"
	save_name: STRING_8 = "save"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_text_document_sync_options (Current)
		end

end
