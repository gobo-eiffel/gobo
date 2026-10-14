note

	description:

		"Eiffel inline agents with a query (function or attribute) as associated feature"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007-2026, Eric Bezault and others"
	license: "MIT License"

deferred class ET_QUERY_INLINE_AGENT

inherit

	ET_INLINE_AGENT
		undefine
			type
		redefine
			implicit_result
		end

	ET_QUERY_CLOSURE
		rename
			arguments as formal_arguments
		end

feature -- Access

	implicit_result: ET_RESULT
			-- Fictitious node corresponding to the result of the
			-- associated feature when it's a query

invariant

	implicit_result_not_void: implicit_result /= Void

end
