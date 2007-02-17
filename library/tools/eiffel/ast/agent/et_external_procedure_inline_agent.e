indexing

	description:

		"Eiffel inline agents with an external procedure as associated feature"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_EXTERNAL_PROCEDURE_INLINE_AGENT

inherit

	ET_PROCEDURE_INLINE_AGENT
		rename
			make as make_procedure
		end

	ET_EXTERNAL_ROUTINE_INLINE_AGENT
		rename
			make as make_inline_agent
		end

create

	make

feature {NONE} -- Initialization

	make (a_formal_args: like formal_arguments; a_language: like language; an_actual_args: like actual_arguments) is
			-- Create a new inline agent whose associated feature is an external procedure.
		require
			a_language_not_void: a_language /= Void
		do
			make_procedure (a_formal_args, an_actual_args)
			language := a_language
		ensure
			formal_arguments_set: formal_arguments = a_formal_args
			language_set: language = a_language
			actual_arguments_set: actual_arguments = an_actual_args
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_external_procedure_inline_agent (Current)
		end

end
