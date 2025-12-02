note

	description:

		"LSP text document 'WillSave' options"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_WILL_SAVE_TEXT_DOCUMENT_OPTIONS

inherit

	LS_SERVER_OPTIONS

feature -- Access

	will_save: LS_BOOLEAN
			-- If present will save notifications are sent to the server. If omitted
			-- the notification should not be sent.
		do
			Result := to_boolean
		ensure
			will_save_not_void: Result /= Void
		end
		
	to_boolean: LS_BOOLEAN
			-- Boolean representation
		deferred
		ensure
			to_boolean_not_void: Result /= Void
		end

end
