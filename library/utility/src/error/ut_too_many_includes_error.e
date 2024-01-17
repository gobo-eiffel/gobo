note

	description:

		"Error: Too many nested include files"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2007-2011, Eric Bezault and others"
	license: "MIT License"

class UT_TOO_MANY_INCLUDES_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make (max: INTEGER)
			-- Create a new error.
		do
			create parameters.make_filled (empty_string, 1, 1)
			parameters.put (max.out, 1)
		end

feature -- Access

	default_template: STRING = "$0: too many (i.e. $1) nested include files"
			-- Default template used to built the error message

	code: STRING = "UT0010"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = max number of nested include files

end
