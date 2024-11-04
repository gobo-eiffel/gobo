note

	description:

		"Eiffel agent open targets for the form '{TYPE}'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2024, Eric Bezault and others"
	license: "MIT License"

class ET_AGENT_OPEN_TARGET

inherit

	ET_AGENT_TARGET
		redefine
			reset,
			is_open_operand
		end

	ET_BRACED_TYPE
		redefine
			reset,
			process
		end

create

	make

feature -- Initialization

	reset
			-- Reset operand as it was when it was last parsed.
		do
			precursor {ET_AGENT_TARGET}
			precursor {ET_BRACED_TYPE}
		end

feature -- Status report

	is_open_operand: BOOLEAN = True
			-- Is current operand open?

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_agent_open_target (Current)
		end

end
