note

	description:

		"LSP handlers for '$/setTrace' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SET_TRACE_NOTIFICATION_HANDLER

inherit

	LS_NOTIFICATION_HANDLER
		redefine
			make
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new '$/setTrace' notification handler.
		do
			trace_value := {LS_TRACE_VALUES}.off
			precursor
		end

feature -- Status report

	trace_value: LS_TRACE_VALUE
			-- Trace level

feature -- Status setting

	set_trace_value (a_value: like trace_value)
			-- Set `trace_value` to `a_value`.
		require
			a_value_not_void: a_value /= Void
		do
			trace_value := a_value
		ensure
			trace_value_set: trace_value = a_value
		end

feature {NONE} -- Implementation

	notification: LS_SET_TRACE_NOTIFICATION
			-- Type of notification to be handled by current handler
		do
			check False then end
		end

invariant

	trace_value_not_void: trace_value /= Void

end
