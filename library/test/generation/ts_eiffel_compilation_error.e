indexing

	description:

		"Error: Eiffel compilation error"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class TS_EIFFEL_COMPILATION_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new error reporting that an Eiffel
			-- compilation error occurred.
		do
			create parameters.make (1, 0)
		end

feature -- Access

	default_template: STRING is "Eiffel compilation error"
			-- Default template used to built the error message

	code: STRING is "TS0002"
			-- Error code

invariant

	-- dollar0: $0 = program name

end
