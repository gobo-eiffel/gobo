note

	description:

		"Eiffel precursor instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2014, Eric Bezault and others"
	license: "MIT License"

class ET_PRECURSOR_INSTRUCTION

inherit

	ET_PRECURSOR_CALL
		redefine
			parenthesis_call
		end

	ET_INSTRUCTION
		undefine
			reset
		end

create

	make

feature -- Access

	parenthesis_call: detachable ET_PARENTHESIS_INSTRUCTION
			-- <Precursor>

feature -- Setting

	set_parenthesis_call (a_target: ET_EXPRESSION; a_name: ET_PARENTHESIS_SYMBOL; a_arguments: ET_ACTUAL_ARGUMENT_LIST)
			-- <Precursor>
		do
			create parenthesis_call.make (a_target, a_name, a_arguments)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_precursor_instruction (Current)
		end

end
