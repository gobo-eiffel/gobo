note

	description:

		"Eiffel static call instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_STATIC_CALL_INSTRUCTION

inherit

	ET_STATIC_FEATURE_CALL
		redefine
			is_instruction
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

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_static_call_instruction (Current)
		end

end
