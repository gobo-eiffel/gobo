note

	description:

		"LSP 'DidChangeCongigurations' parameters"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

deferred class LS_DID_CHANGE_CONFIGURATION_PARAMS

inherit

	LS_MESSAGE_PARAMS

feature -- Access

	settings: LS_ANY
			-- The actual changed settings

feature -- Field names

	settings_name: STRING_8 = "settings"
			-- Field names

invariant

	settings_not_void: settings /= Void

end
