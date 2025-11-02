note

	description:

		"LSP dynamic registration capabilities"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_DYNAMIC_REGISTRATION_CAPABILITIES

inherit

	LS_CLIENT_CAPABILITIES

feature {NONE} -- Initialization

	make (a_dynamic_registration: like dynamic_registration)
			-- Crete a new dynamic registration capabilities.
		do
			dynamic_registration := a_dynamic_registration
		ensure
			dynamic_registration_set: dynamic_registration = a_dynamic_registration
		end

feature -- Access

	dynamic_registration: detachable LS_BOOLEAN
			-- Whether dynamic registration is supported.

feature -- Field names

	dynamic_registration_name: STRING_8 = "dynamicRegistration"
			-- Field names

end
