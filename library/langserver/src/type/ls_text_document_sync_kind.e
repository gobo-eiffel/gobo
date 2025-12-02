note

	description:
	"[
		LSP text document sync kinds.

		Define how the client should sync document changes
		to the language server.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_TEXT_DOCUMENT_SYNC_KIND

inherit

	LS_TEXT_DOCUMENT_SYNC_GENERAL_OPTIONS

	LS_DID_CHANGE_TEXT_DOCUMENT_OPTIONS

convert

	value: {INTEGER_32},
	to_integer: {LS_INTEGER}

feature -- Access

	to_sync_kind: LS_TEXT_DOCUMENT_SYNC_KIND
			-- Text document sync kind
		do
			Result := Current
		end

	value: INTEGER_32
			-- Integer value
		do
			Result := to_integer.value
		ensure
			definition: Result = to_integer.value
		end

	to_integer: LS_INTEGER
			-- Integer representation
		deferred
		ensure
			to_integer_not_void: Result /= Void
		end

end
