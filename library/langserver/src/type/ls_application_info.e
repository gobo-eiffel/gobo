note

	description:

		"LSP application information"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_APPLICATION_INFO

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_version: like version)
			-- Create a new application info.
		require
			a_name_not_void: a_name /= Void
		do
			name := a_name
			version := a_version
		ensure
			name_set: name = a_name
			version_set: version = a_version
		end

feature -- Access

	name: LS_STRING
			-- Name of the application

	version: detachable LS_STRING
			-- Version of the application

feature -- Field names

	name_name: STRING_8 = "name"
	version_name: STRING_8 = "version"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_application_info (Current)
		end

invariant

	name_not_void: name /= Void

end
