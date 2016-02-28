note

	description:

		"Error: Unrecognized %%option"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_UNRECOGNIZED_OPTION_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; option: STRING)
			-- Create a new error reporting
			-- unrecoginzed %option `option'.
		require
			filename_not_void: filename /= Void
			option_not_void: option /= Void
		do
			create parameters.make_filled (empty_string, 1, 3)
			parameters.put (filename, 1)
			parameters.put (line.out, 2)
			parameters.put (option, 3)
		end

feature -- Access

	default_template: STRING = "%"$1%", line $2: unrecognized %%option: $3"
			-- Default template used to built the error message

	code: STRING = "LX0024"
			-- Error code

invariant

--	dollar0: $0 = program name
--	dollar1: $1 = filename
--	dollar2: $2 = line number
--	dollar3: $3 = option

end
