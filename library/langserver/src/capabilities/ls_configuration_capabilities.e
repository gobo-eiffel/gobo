note

	description:

		"LSP 'workspace/configuration' capabilities"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_CONFIGURATION_CAPABILITIES

inherit

	LS_CLIENT_CAPABILITIES

feature -- Access
		
	to_boolean: LS_BOOLEAN
			-- Boolean representation
		deferred
		ensure
			to_boolean_not_void: Result /= Void
		end

end
