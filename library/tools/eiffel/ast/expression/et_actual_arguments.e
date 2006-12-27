indexing

	description:

		"Eiffel actual arguments"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ACTUAL_ARGUMENTS

inherit

	ET_ARGUMENT_OPERANDS
		redefine
			actual_argument
		end

	ET_EXPRESSIONS
		rename
			expression as actual_argument
		redefine
			actual_argument
		end

feature -- Access

	actual_argument (i: INTEGER): ET_EXPRESSION is
			-- Actual argument at index `i'
		deferred
		end

end
