note

	description:

		"Error: The use of reject is incompatible with full tables"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2011, Eric Bezault and others"
	license: "MIT License"

class LX_FULL_AND_REJECT_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new error reporting that the use
			-- of reject is incompatible with full tables.
		do
			create parameters.make_filled (empty_string, 1, 0)
		end

feature -- Access

	default_template: STRING = "$0: `reject' cannot be used with -f"
			-- Default template used to built the error message

	code: STRING = "LX0028"
			-- Error code

invariant

--	dollar0: $0 = program name

end
