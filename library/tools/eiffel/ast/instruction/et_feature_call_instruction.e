indexing

	description:

		"Eiffel feature call instructions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_FEATURE_CALL_INSTRUCTION

inherit

	ET_FEATURE_CALL
		redefine
			is_instruction
		end

	ET_INSTRUCTION

feature -- Status report

	is_instruction: BOOLEAN is True
			-- Is current call an instruction?

feature -- Conversion

	as_expression: ET_FEATURE_CALL_EXPRESSION is
			-- `Current' viewed as an expression
		do
			check not_expression: False end
		end

	as_instruction: ET_FEATURE_CALL_INSTRUCTION is
			-- `Current' viewed as an instruction
		do
			Result := Current
		end

end
