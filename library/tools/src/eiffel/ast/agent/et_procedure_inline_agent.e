note

	description:

		"Eiffel inline agents with a procedure as associated feature"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007-2014, Eric Bezault and others"
	license: "MIT License"

deferred class ET_PROCEDURE_INLINE_AGENT

inherit

	ET_ROUTINE_INLINE_AGENT
		rename
			make as make_inline_agent
		end

feature {NONE} -- Initialization

	make (a_formal_args: like formal_arguments; an_actual_args: like actual_arguments)
			-- Create a new inline agent whose associated feature is a procedure.
		do
			formal_arguments := a_formal_args
			end_keyword := tokens.end_keyword
			make_inline_agent (an_actual_args)
		ensure
			formal_arguments_set: formal_arguments = a_formal_args
			actual_arguments_set: actual_arguments = an_actual_args
		end

invariant

	procedure: type = Void

end
