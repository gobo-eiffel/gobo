indexing

	description:

		"XML processing instruction nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_PROCESSING_INSTRUCTION

inherit

	XM_NODE

creation

	make

feature {NONE} -- Initialization

	make (a_target: like target; a_data: like data) is
			-- Create a new processing instruction node.
		require
			a_target_not_void: a_target /= Void
			a_data_not_void: a_data /= Void
		do
			target := a_target
			data := a_data
		ensure
			target_set: target = a_target
			data_set: data = a_data
		end

feature -- Access

	target: STRING
			-- Target of current processing instruction;
			-- XML defines this as being the first token following
			-- the markup that begins the processing instruction.

	data: STRING
			-- Content of current processing instruction;
			-- This is from the first non white space character after
			-- the target to the character immediately preceding the ?>.

feature -- Processing

	process (a_processor: XM_NODE_PROCESSOR) is
			-- Process current node with `a_processor'.
		do
			a_processor.process_processing_instruction (Current)
		end

invariant

	target_not_void: target /= Void
	data_not_void: data /= Void

end
