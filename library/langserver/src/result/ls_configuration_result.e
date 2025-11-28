note

	description:

		"LSP optinal results for 'workspace/configuration' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_CONFIGURATION_RESULT

inherit

	LS_RESPONSE_RESULT

feature -- Access

	to_array: LS_ARRAY
			-- Array representation
		deferred
		ensure
			to_array_not_void: Result /= Void
		end

end
