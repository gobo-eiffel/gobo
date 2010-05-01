note

	description:

		"Eiffel inline agents with a do-function as associated feature"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DO_FUNCTION_INLINE_AGENT

inherit

	ET_INTERNAL_FUNCTION_INLINE_AGENT

create

	make

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_do_function_inline_agent (Current)
		end

end
