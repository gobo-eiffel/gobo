note

	description:

		"Eiffel closures with components common to routines"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ROUTINE_CLOSURE

inherit

	ET_FEATURE_CLOSURE
		redefine
			arguments
		end

feature -- Access

	arguments: ET_FORMAL_ARGUMENT_LIST
			-- Formal arguments

end
