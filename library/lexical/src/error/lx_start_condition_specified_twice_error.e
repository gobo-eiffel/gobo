note

	description:

		"Error: Start condition specified twice"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_START_CONDITION_SPECIFIED_TWICE_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; sc: STRING)
			-- Create a new error reporting that
			-- `sc' has been specified twice.
		require
			filename_not_void: filename /= Void
			sc_not_void: sc /= Void
		do
			create parameters.make_filled (empty_string, 1, 3)
			parameters.put (filename, 1)
			parameters.put (line.out, 2)
			parameters.put (sc, 3)
		end

feature -- Access

	default_template: STRING = "Warning, %"$1%", line $2: <$3> specified twice"
			-- Default template used to built the error message

	code: STRING = "LX0019"
			-- Error code

invariant

--	dollar0: $0 = program name
--	dollar1: $1 = filename
--	dollar2: $2 = line number
--	dollar3: $3 = start condition

end
