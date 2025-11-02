note

	description:
	"[
		LSP diagnostic related informations.

		Represent a related message and source code location for a diagnostic.
		This should be used to point to code locations that cause or are related to
		a diagnostics, e.g when duplicating a symbol in a scope.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DIAGNOSTIC_RELATED_INFORMATION

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_location: like location; a_message: like message)
			-- Create a new diagnostic related information.
		require
			a_location_not_void: a_location /= Void
			a_message_not_void: a_message /= Void
		do
			location := a_location
			message := a_message
		ensure
			location_set: location = a_location
			message_set: message = a_message
		end

feature -- Access

	location: LS_LOCATION
			-- The location of this related diagnostic information.

	message: LS_STRING
			-- The message of this related diagnostic information.

feature -- Field names

	location_name: STRING_8 = "location"
	message_name: STRING = "message"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_diagnostic_related_information (Current)
		end

invariant

	location_not_void: location /= Void
	message_not_void: message /= Void

end
