indexing

	description:

		"Eiffel static call expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_STATIC_CALL_EXPRESSION

inherit

	ET_STATIC_FEATURE_CALL
		redefine
			is_expression
		end

	ET_CHOICE_CONSTANT
		undefine
			reset
		end

create

	make

feature -- Status report

	is_expression: BOOLEAN is True
			-- Is current call an expression?

feature -- Conversion

	as_expression: ET_STATIC_CALL_EXPRESSION is
			-- `Current' viewed as an expression
		do
			Result := Current
		end

	as_instruction: ET_STATIC_CALL_INSTRUCTION is
			-- `Current' viewed as an instruction
		do
			check not_instruction: False end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_static_call_expression (Current)
		end

end
