note

	description:

		"LSP text document 'DidClose' options"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_DID_CLOSE_TEXT_DOCUMENT_OPTIONS

inherit

	LS_SERVER_OPTIONS

feature -- Access

	close: LS_BOOLEAN
			-- Close notifications are sent to the server. If omitted close
			-- notification should not be sent.
		do
			Result := to_boolean
		ensure
			close_not_void: Result /= Void
		end

	to_boolean: LS_BOOLEAN
			-- Boolean representation
		deferred
		ensure
			to_boolean_not_void: Result /= Void
		end

end
