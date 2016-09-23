note

	description:

		"Eiffel calls with actual argument list"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CALL_WITH_ACTUAL_ARGUMENT_LIST

inherit

	ET_CALL_WITH_ACTUAL_ARGUMENTS

feature -- Access

	arguments: detachable ET_ACTUAL_ARGUMENT_LIST
			-- Arguments

feature -- Setting

	set_arguments (a_arguments: like arguments)
			-- Set `arguments' to `a_arguments'.
		do
			arguments := a_arguments
		ensure
			arguments_set: arguments = a_arguments
		end

end
