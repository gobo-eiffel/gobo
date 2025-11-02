note

	description:

		"LSP any values"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_ANY

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		require
			a_processor_not_void: a_processor /= Void
		deferred
		end

end
