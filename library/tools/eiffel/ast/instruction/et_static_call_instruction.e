note

	description:

		"Eiffel static call instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_STATIC_CALL_INSTRUCTION

inherit

	ET_STATIC_FEATURE_CALL
		redefine
			is_instruction,
			parenthesis_call
		end

	ET_INSTRUCTION
		undefine
			reset
		end

create

	make

feature -- Status report

	is_instruction: BOOLEAN = True
			-- Is current call an instruction?

feature -- Access

	parenthesis_call: detachable ET_CALL_INSTRUCTION
			-- <Precursor>

feature -- Conversion

	as_expression: ET_STATIC_CALL_EXPRESSION
			-- `Current' viewed as an expression
		do
			check not_expression: False end
		end

	as_instruction: ET_STATIC_CALL_INSTRUCTION
			-- `Current' viewed as an instruction
		do
			Result := Current
		end

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
			a_processor.process_static_call_instruction (Current)
		end

end
