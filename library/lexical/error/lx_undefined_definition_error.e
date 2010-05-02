note

	description:

		"Error: Undefined definition"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_UNDEFINED_DEFINITION_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; def: STRING)
			-- Create a new error reporting an undefined definition.
		require
			filename_not_void: filename /= Void
			def_not_void: def /= Void
		do
			create parameters.make (1, 3)
			parameters.put (filename, 1)
			parameters.put (line.out, 2)
			parameters.put (def, 3)
		end

feature -- Access

	default_template: STRING = "%"$1%", line $2: undefined definition $3"
			-- Default template used to built the error message

	code: STRING = "LX0022"
			-- Error code

invariant

--	dollar0: $0 = program name
--	dollar1: $1 = filename
--	dollar2: $2 = line number
--	dollar3: $3 = definition name

end
