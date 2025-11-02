note

	description:

		"LSP 'Unregistration' parameters"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_UNREGISTRATION_PARAMS

inherit

	LS_MESSAGE_PARAMS

feature -- Access

	unregistrations: LS_UNREGISTRATION_LIST
			-- Options to be dynamically unregistered

feature -- Field names

	unregistrations_name: STRING_8 = "unregisterations"
			-- Field names
			-- (This should correctly be named 'unregistrations'. However changing this
			-- is a breaking change and needs to wait until we deliver a 4.x version
			-- of the specification.)

invariant

	unregistrations_not_void: unregistrations /= Void

end
