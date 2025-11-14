note

	description:

		"LSP base URIs in relative patterns"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_BASE_URI

inherit

	LS_ANY

feature -- Access

	uri: LS_URI
			-- URI
		deferred
		ensure
			uri_not_void: Result /= Void
		end

end
