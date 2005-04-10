indexing

	description:

		"Objects that represent a tail call"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_TAIL_CALL


feature -- Status report

	last_tail_call: XM_XSLT_TAIL_CALL
			-- Residue from last call to `process_leaving_tail'
	
feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		require
			context_not_void: a_context /= Void
			no_error: not a_context.transformer.is_error
		deferred
		ensure
			possible_tail_call: last_tail_call = Void or else last_tail_call /= Void
		end
	
end
	
