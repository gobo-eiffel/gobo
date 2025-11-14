note

	description:

		"LSP events describing a file changes"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_FILE_EVENT

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_uri: like uri; a_type: like type)
			-- Create a new file event.
		require
			a_uri_not_void: a_uri /= Void
			a_type_not_void: a_type /= Void
		do
			uri := a_uri
			type := a_type
		ensure
			uri_set: uri = a_uri
			type_set: type = a_type
		end

feature -- Access

	uri: LS_DOCUMENT_URI
			-- The file's URI.

	type: LS_FILE_CHANGE_TYPE
			-- The change type.

feature -- Field names

	uri_name: STRING_8 = "uri"
	type_name: STRING = "type"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_file_event (Current)
		end

invariant

	uri_not_void: uri /= Void
	type_not_void: type /= Void

end
