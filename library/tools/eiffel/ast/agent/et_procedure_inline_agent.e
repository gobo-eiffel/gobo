indexing

	description:

		"Eiffel inline agents with a procedure as associated feature"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_PROCEDURE_INLINE_AGENT

inherit

	ET_ROUTINE_INLINE_AGENT
		rename
			make as make_inline_agent
		end

feature {NONE} -- Initialization

	make (a_formal_args: like formal_arguments; an_actual_args: like actual_arguments) is
			-- Create a new inline agent whose associated feature is a procedure.
		do
			make_inline_agent (an_actual_args)
			formal_arguments := a_formal_args
			end_keyword := tokens.end_keyword
		ensure
			formal_arguments_set: formal_arguments = a_formal_args
			actual_arguments_set: actual_arguments = an_actual_args
		end

invariant

	procedure: type = Void

end
