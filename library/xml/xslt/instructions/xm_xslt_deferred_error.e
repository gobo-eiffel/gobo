indexing

	description:

		"Objects that represent a deferred error, to be raised if executed"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_DEFERRED_ERROR

inherit

	XM_XSLT_INSTRUCTION

creation

	make

feature {NONE} -- Initialization

	make (an_error_message, an_instruction_name: STRING) is
			-- Establish invariant.
		require
			error_message_not_void: an_error_message /= Void
			instruction_name_not_void: an_instruction_name /= Void
		do
			error_message := an_error_message
			instruction_name := an_instruction_name
		ensure
			error_message_set: error_message = an_error_message
			name_set: instruction_name = an_instruction_name
		end

feature -- Access

	instruction_name: STRING
			-- Name of instruction, for diagnostics
	
feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			todo ("process_leaving_tail", False)
		end

feature {NONE} -- Implementation

	error_message: STRING
			-- Error to report

invariant

	error_message_not_void: error_message /= Void

end
	
