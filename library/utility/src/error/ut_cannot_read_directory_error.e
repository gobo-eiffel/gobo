note

	description:

		"Error: Cannot read directory"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UT_CANNOT_READ_DIRECTORY_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make (a_dirname: STRING)
			-- Create a new error reporting that directory
			-- `a_dirname' cannot be opened in read mode.
		require
			a_dirname_not_void: a_dirname /= Void
		do
			create parameters.make_filled (empty_string, 1, 1)
			parameters.put (a_dirname, 1)
		end

feature -- Access

	default_template: STRING = "$0: cannot read directory '$1'"
			-- Default template used to built the error message

	code: STRING = "UT0012"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = dirname

end
