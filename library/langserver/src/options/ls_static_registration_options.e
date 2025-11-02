note

	description:

		"LSP static registration options to be returned in the initialize request"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_STATIC_REGISTRATION_OPTIONS

inherit

	LS_SERVER_OPTIONS

feature {NONE} -- Initialization

	make (a_id: like id)
			-- Create a new server options.
		require
			a_id_not_void: a_id /= Void
		do
			id := a_id
		ensure
			id_set: id = a_id
		end

feature -- Access

	id: detachable LS_STRING
			-- The id used to register the request. The id can be used to deregister
			-- the request again. See also Registration#id.

feature -- Field names

	id_name: STRING_8 = "id"
			-- Field names

end
