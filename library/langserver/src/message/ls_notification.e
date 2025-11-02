note

	description:

		"LSP notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_NOTIFICATION

inherit

	LS_MESSAGE

feature -- Access

	method: LS_STRING
			-- Method to be invoked
		deferred
		ensure
			method_not_void: Result /= Void
		end

feature -- Field names

	method_name: STRING_8 = "method"
	params_name: STRING_8 = "params"
			-- Field names

end
