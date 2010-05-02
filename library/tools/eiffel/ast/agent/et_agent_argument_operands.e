note

	description:

		"Eiffel agent actual arguments"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_AGENT_ARGUMENT_OPERANDS

inherit

	ET_ARGUMENT_OPERANDS
		redefine
			actual_argument
		end

feature -- Access

	actual_argument (i: INTEGER): ET_AGENT_ARGUMENT_OPERAND
			-- Actual argument at index `i'
		deferred
		end

end
