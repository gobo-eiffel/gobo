note

	description:
	
		"LSP error data for 'initialize' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_INITIALIZE_ERROR

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_retry: like retry_)
			-- Create a new error data.
		require
			a_retry_not_void: a_retry /= Void
		do
			retry_ := a_retry
		ensure
			retry_set: retry_ = a_retry
		end

feature -- Access

	retry_: LS_BOOLEAN
			-- Indicates whether the client execute the following retry logic:
			-- (1) show the message provided by the ResponseError to the user
			-- (2) user selects retry or cancel
			-- (3) if user selected retry the initialize method is sent again.

feature -- Field names

	retry_name: STRING_8 = "retry"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_initialize_error (Current)
		end

invariant

	retry_not_void: retry_ /= Void

end
