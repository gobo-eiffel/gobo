note

	description:

		"Error: Unrecognized rule"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2011, Eric Bezault and others"
	license: "MIT License"

class LX_UNRECOGNIZED_RULE_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER)
			-- Create a new error reporting an unrecoginzed rule.
		require
			filename_not_void: filename /= Void
		do
			create parameters.make_filled (empty_string, 1, 2)
			parameters.put (filename, 1)
			parameters.put (line.out, 2)
		end

feature -- Access

	default_template: STRING = "%"$1%", line $2: unrecognized rule"
			-- Default template used to built the error message

	code: STRING = "LX0025"
			-- Error code

invariant

--	dollar0: $0 = program name
--	dollar1: $1 = filename
--	dollar2: $2 = line number

end
