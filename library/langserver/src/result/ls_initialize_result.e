note

	description:

		"LSP results for 'initialize' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_INITIALIZE_RESULT

inherit

	LS_RESPONSE_RESULT

create

	make

feature {NONE} -- Initialization

	make (a_capabilities: like capabilities)
			-- Create a new result.
		require
			a_capabilities_not_void: a_capabilities /= Void
		do
			capabilities := a_capabilities
		ensure
			capabilities_set: capabilities = a_capabilities
		end

feature -- Access

	capabilities: LS_SERVER_CAPABILITIES
			-- The capabilities the language server provides.

feature -- Field names

	capabilities_name: STRING_8 = "capabilities"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_initialize_result (Current)
		end

invariant

	capabilities_not_void: capabilities /= Void

end
