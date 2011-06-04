note

	description:

		"Eiffel inline agents with a once routine as associated feature"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ONCE_ROUTINE_INLINE_AGENT

inherit

	ET_INTERNAL_ROUTINE_INLINE_AGENT

	ET_ONCE_ROUTINE_CLOSURE
		rename
			arguments as formal_arguments
		end

end
