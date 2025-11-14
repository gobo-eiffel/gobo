note

	description:

		"LSP 'DidChangeWatchedFiles' capabilities"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DID_CHANGE_WATCHED_FILES_CAPABILITIES

inherit

	LS_DYNAMIC_REGISTRATION_CAPABILITIES
		rename
			make as make_dynamic_registration_capabilities
		end

create

	make

feature {NONE} -- Initialization

	make (a_dynamic_registration: like dynamic_registration; a_relative_pattern_support: like relative_pattern_support)
			-- Create a new client capabilities.
		do
			dynamic_registration := a_dynamic_registration
			relative_pattern_support := a_relative_pattern_support
		ensure
			dynamic_registration_set: dynamic_registration = a_dynamic_registration
			relative_pattern_support_set: relative_pattern_support = a_relative_pattern_support
		end

feature -- Access

	relative_pattern_support: detachable LS_BOOLEAN
			-- Whether the client has support for relative patterns or not.

feature -- Field names

	relative_pattern_support_name: STRING_8 = "relativePatternSupport"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_did_change_watched_files_capabilities (Current)
		end

end
