note

	description:

		"LSP file event types"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_FILE_CHANGE_TYPE

inherit

	LS_ANY

feature -- Access

	value: INTEGER_32
			-- Integer value
		deferred
		end

end
