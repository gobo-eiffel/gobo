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

	--	commented out 2006/11/10 in favour of DS_CELL argument last_tail_call: XM_XPATH_TAIL_CALL
			-- Residue from last call to `generate_tail_call'

feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [XM_XPATH_TAIL_CALL]; a_context: XM_XPATH_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		require
			a_tail_not_void: a_tail /= Void
			no_tail_call: a_tail.item = Void
			context_not_void: a_context /= Void
			no_error: not a_context.is_process_error
		deferred
		ensure
			possible_tail_call: a_tail.item /= Void xor a_tail.item = Void
		end
	
end
	
