indexing

	description:

		"Objects that represent a tail call"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_TAIL_CALL

inherit

	ANY

feature -- Status report

	last_tail_call: XM_XPATH_TAIL_CALL
			-- Residue from last call to `process_leaving_tail'

feature -- Evaluation

	process_leaving_tail (a_context: XM_XPATH_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		require
			context_not_void: a_context /= Void
			no_error: not a_context.is_process_error
		deferred
		ensure
			possible_tail_call: last_tail_call = Void or else last_tail_call /= Void
		end
	
end
	
