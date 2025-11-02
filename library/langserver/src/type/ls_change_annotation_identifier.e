note

	description:

		"LSP identifiers referring to a change annotation managed by a workspace edit"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_CHANGE_ANNOTATION_IDENTIFIER

inherit

	LS_ANY

feature -- Access

	to_string: LS_STRING
			-- String representation
		deferred
		ensure
			to_string_not_void: Result /= Void
		end

end
