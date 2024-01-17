note

	description:

		"Error: Undefined environment variable"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2000-2011, Eric Bezault and others"
	license: "MIT License"

class UT_UNDEFINED_ENVIRONMENT_VARIABLE_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make (a_variable: STRING)
			-- Create a new error reporting that the environment
			-- variable `a_variable' is not defined.
		require
			a_variable_not_void: a_variable /= Void
		do
			create parameters.make_filled (empty_string, 1, 1)
			parameters.put (a_variable, 1)
		end

feature -- Access

	default_template: STRING = "$0: environment variable '$1' not defined"
			-- Default template used to built the error message

	code: STRING = "UT0009"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = environment variable

end
