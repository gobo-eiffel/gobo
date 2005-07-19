indexing

	description:

		"Eiffel feature calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_FEATURE_CALL

inherit

	ET_CALL_COMPONENT
		redefine
			target, arguments
		end

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

feature -- Status report

	is_expression: BOOLEAN is
			-- Is current call an expression?
		do
			-- Result := False
		end

	is_instruction: BOOLEAN is
			-- Is current call an instruction?
		do
			-- Result := False
		end

feature -- Access

	target: ET_EXPRESSION is
			-- Target
		deferred
		end

	arguments: ET_ACTUAL_ARGUMENTS is
			-- Arguments
		deferred
		end

feature -- Conversion

	as_expression: ET_FEATURE_CALL_EXPRESSION is
			-- `Current' viewed as an expression
		require
			is_expression: is_expression
		deferred
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

	as_instruction: ET_FEATURE_CALL_INSTRUCTION is
			-- `Current' viewed as an instruction
		require
			is_instruction: is_instruction
		deferred
		ensure
			definition: ANY_.same_objects (Result, Current)
		end
		
end
