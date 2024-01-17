note

	description:

		"Error: The use of meta equivalence classes %
		%does not make sense with full tables"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2011, Eric Bezault and others"
	license: "MIT License"

class LX_FULL_AND_META_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new error reporting that the use
			-- of meta equivalence classes does not make
			-- sense with full tables.
		do
			create parameters.make_filled (empty_string, 1, 0)
		end

feature -- Access

	default_template: STRING = "$0: -f and -m don't make sense together"
			-- Default template used to built the error message

	code: STRING = "LX0027"
			-- Error code

invariant

--	dollar0: $0 = program name

end
