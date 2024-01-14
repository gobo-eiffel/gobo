note

	description:

		"Eiffel inline agents with an internal (do or once) procedure as associated feature"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"

deferred class ET_INTERNAL_PROCEDURE_INLINE_AGENT

inherit

	ET_PROCEDURE_INLINE_AGENT
		undefine
			reset, locals
		end

	ET_INTERNAL_ROUTINE_INLINE_AGENT
		rename
			make as make_inline_agent
		end

end
