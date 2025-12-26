note

	description:

		"Eiffel inline agents with an external routine as associated feature"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007-2025, Eric Bezault and others"
	license: "MIT License"

deferred class ET_EXTERNAL_ROUTINE_INLINE_AGENT

inherit

	ET_ROUTINE_INLINE_AGENT

	ET_EXTERNAL_ROUTINE_CLOSURE
		rename
			arguments as formal_arguments
		undefine
			set_preconditions,
			set_postconditions
		end

end
