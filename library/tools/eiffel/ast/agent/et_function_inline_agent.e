note

	description:

		"Eiffel inline agents with a function as associated feature"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_FUNCTION_INLINE_AGENT

inherit

	ET_QUERY_INLINE_AGENT
		rename
			make as make_inline_agent
		undefine
			formal_arguments,
			preconditions,
			postconditions
		end

	ET_ROUTINE_INLINE_AGENT
		rename
			make as make_inline_agent
		undefine
			type, implicit_result
		end

feature {NONE} -- Initialization

	make (a_formal_args: like formal_arguments; a_type: like declared_type; an_actual_args: like actual_arguments)
			-- Create a new inline agent whose associated feature is a function.
		require
			a_type_not_void: a_type /= Void
		do
			make_inline_agent (an_actual_args)
			formal_arguments := a_formal_args
			declared_type := a_type
			end_keyword := tokens.end_keyword
			create implicit_result.make
		ensure
			formal_arguments_set: formal_arguments = a_formal_args
			declared_type_set: declared_type = a_type
			actual_arguments_set: actual_arguments = an_actual_args
		end

end
