note

	description:
	"[
		LSP trace values.

		Represents the level of verbosity with which the server systematically
		reports its execution trace using '$/logTrace' notifications. The initial
		trace value is set by the client at initialization and can be modified
		later using the '$/setTrace' notification.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_TRACE_VALUE

inherit

	LS_ANY

end
