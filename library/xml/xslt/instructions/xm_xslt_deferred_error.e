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

	make (an_executable: XM_XSLT_EXECUTABLE; an_error_message, an_instruction_name: STRING) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			error_message_not_void: an_error_message /= Void
			instruction_name_not_void: an_instruction_name /= Void
		do
			executable := an_executable
			error_message := an_error_message
			instruction_name := an_instruction_name
			create children.make (0)
		ensure
			executable_set: executable = an_executable
			error_message_set: error_message = an_error_message
			name_set: instruction_name = an_instruction_name
		end

feature -- Access

	instruction_name: STRING
			-- Name of instruction, for diagnostics
	
feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			a_context.transformer.report_fatal_error (error_message, Current)
		end

feature {NONE} -- Implementation

	error_message: STRING
			-- Error to report

invariant

	error_message_not_void: error_message /= Void

end
	
