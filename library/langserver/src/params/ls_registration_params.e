note

	description:

		"LSP 'Registration' parameters"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_REGISTRATION_PARAMS

inherit

	LS_MESSAGE_PARAMS

feature -- Access

	registrations: LS_REGISTRATION_LIST
			-- Options to be dynamically registered

feature -- Field names

	registrations_name: STRING_8 = "registrations"
			-- Field names

invariant

	registrations_not_void: registrations /= Void

end
