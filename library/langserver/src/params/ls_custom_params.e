note

	description:

		"LSP custom parameters"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

deferred class LS_CUSTOM_PARAMS

inherit

	LS_MESSAGE_PARAMS

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_custom_params (Current)
		end

feature {LS_PROCESSOR} -- Processing

	process_custom_fields (a_processor: LS_PROCESSOR)
			-- Process all custom fields.
		require
			a_processor_not_void: a_processor /= Void
		deferred
		end

end
