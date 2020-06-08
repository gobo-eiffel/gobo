note

	description:

		"Eiffel closures with components common to internal (do or once) routines"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_INTERNAL_ROUTINE_CLOSURE

inherit

	ET_ROUTINE_CLOSURE
		undefine
			locals
		end

	ET_INTERNAL_FEATURE_CLOSURE
		undefine
			arguments
		end

end
