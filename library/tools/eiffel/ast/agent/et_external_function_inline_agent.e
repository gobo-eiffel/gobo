note

	description:

		"Eiffel inline agents with an external function as associated feature"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_EXTERNAL_FUNCTION_INLINE_AGENT

inherit

	ET_FUNCTION_INLINE_AGENT
		rename
			make as make_function
		end

	ET_EXTERNAL_ROUTINE_INLINE_AGENT
		rename
			make as make_inline_agent
		undefine
			type, implicit_result
		end

create

	make

feature {NONE} -- Initialization

	make (a_formal_args: like formal_arguments; a_type: like declared_type; a_language: like language; an_actual_args: like actual_arguments)
			-- Create a new inline agent whose associated feature is an external function.
		require
			a_type_not_void: a_type /= Void
			a_language_not_void: a_language /= Void
		do
			language := a_language
			make_function (a_formal_args, a_type, an_actual_args)
		ensure
			formal_arguments_set: formal_arguments = a_formal_args
			declared_type_set: declared_type = a_type
			language_set: language = a_language
			actual_arguments_set: actual_arguments = an_actual_args
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_external_function_inline_agent (Current)
		end

end
