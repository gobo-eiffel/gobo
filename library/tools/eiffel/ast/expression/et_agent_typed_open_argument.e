indexing

	description:

		"Eiffel agent open arguments for the form '{TYPE}'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_AGENT_TYPED_OPEN_ARGUMENT

inherit

	ET_AGENT_ARGUMENT_OPERAND
		undefine
			reset
		end

	ET_BRACED_TYPE
		redefine
			process
		end

creation

	make

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_agent_typed_open_argument (Current)
		end

end
