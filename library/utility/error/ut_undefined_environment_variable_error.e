indexing

	description:

		"Error: Undefined environment variable"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class UT_UNDEFINED_ENVIRONMENT_VARIABLE_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make (a_variable: STRING) is
			-- Create a new error reporting that the environment
			-- variable `a_variable' is not defined.
		require
			a_variable_not_void: a_variable /= Void
		do
			create parameters.make (1, 1)
			parameters.put (a_variable, 1)
		end

feature -- Access

	default_template: STRING is "$0: environment variable '$1' not defined"
			-- Default template used to built the error message

	code: STRING is "UT0009"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = environment variable

end
