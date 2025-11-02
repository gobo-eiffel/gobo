note

	description:
	
		"LSP workspace folders"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_WORKSPACE_FOLDER

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_uri: like uri; a_name: like name)
			-- Create a new workspace folder.
		require
			a_uri_not_void: a_uri /= Void
			a_name_not_void: a_name /= Void
		do
			uri := a_uri
			name := a_name
		ensure
			uri_set: uri = a_uri
			name_set: name = a_name
		end

feature -- Access

	uri: LS_URI
			-- The associated URI for this workspace folder.

	name: LS_STRING
			-- The name of the workspace folder. Used to refer to this
			-- workspace folder in the user interface.

feature -- Field names

	uri_name: STRING_8 = "uri"
	name_name: STRING_8 = "name"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_workspace_folder (Current)
		end

invariant

	uri_not_void: uri /= Void
	name_not_void: name /= Void

end
