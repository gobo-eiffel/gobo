indexing

	description:

		"Objects that represent XML processing instruction nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_PROCESSING_INSTRUCTION

inherit

	XM_NODE

creation

	make

feature {NONE} -- Initialisation

	make (a_target, a_data: STRING) is
			-- Set target and data.
		require
			a_target_not_void: a_target /= Void
			a_data_not_void: a_data /= Void
		do
			target := a_target
			data := a_data
		end

feature {ANY} -- Access

	target: STRING
			-- target of this processing instruction. XML defines this as being the
			-- first token following the markup that begins the processing instruction.

	data: STRING
			-- content of this processing instruction. This is from the first non
			-- white space character after the target to the character immediately
			-- preceding the ?>.

feature {ANY} -- Basic routines

	process (x: XM_NODE_PROCESSOR) is
		do
			x.process_processing_instruction (Current)
		end

invariant

	target_not_void: target /= Void
	data_not_void: data /= Void

end
