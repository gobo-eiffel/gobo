note

	description:

		"LSP 'SetTrace' parameters"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_SET_TRACE_PARAMS

inherit

	LS_MESSAGE_PARAMS

feature -- Access

	value: LS_TRACE_VALUE
			-- The new value that should be assigned to the trace setting.

feature -- Field names

	value_name: STRING_8 = "value"
			-- Field names

invariant

	value_not_void: value /= Void

end
