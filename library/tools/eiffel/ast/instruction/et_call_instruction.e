indexing

	description:

		"Eiffel call instructions"

	library: "Gobo Eiffel Tools Library"
	copyright:  "Copyright (c) 1999-2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CALL_INSTRUCTION

inherit

	ET_REGULAR_FEATURE_CALL

	ET_FEATURE_CALL_INSTRUCTION
		undefine
			reset
		end

create

	make

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_call_instruction (Current)
		end

end
