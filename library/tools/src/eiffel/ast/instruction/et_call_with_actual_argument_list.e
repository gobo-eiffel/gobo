note

	description:

		"Eiffel calls with actual argument list"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2016, Eric Bezault and others"
	license: "MIT License"

deferred class ET_CALL_WITH_ACTUAL_ARGUMENT_LIST

inherit

	ET_CALL_WITH_ACTUAL_ARGUMENTS

feature -- Initialization

	reset_arguments
			-- Reset arguments as they were just after they were last parsed.
		do
			if attached {ET_UNFOLDED_TUPLE_ACTUAL_ARGUMENT_LIST} arguments as l_unfolded_tuple then
				arguments := l_unfolded_tuple.actual_arguments
			end
			if attached arguments as l_arguments then
				l_arguments.reset
			end
		end

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
