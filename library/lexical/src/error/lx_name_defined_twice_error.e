note

	description:

		"Error: Name defined twice"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2011, Eric Bezault and others"
	license: "MIT License"

class LX_NAME_DEFINED_TWICE_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; name: STRING)
			-- Create a new error reporting that
			-- `name' has been defined twice.
		require
			filename_not_void: filename /= Void
			name_not_void: name /= Void
		do
			create parameters.make_filled (empty_string, 1, 3)
			parameters.put (filename, 1)
			parameters.put (line.out, 2)
			parameters.put (name, 3)
		end

feature -- Access

	default_template: STRING = "%"$1%", line $2: name '$3' defined twice"
			-- Default template used to built the error message

	code: STRING = "LX0015"
			-- Error code

invariant

--	dollar0: $0 = program name
--	dollar1: $1 = filename
--	dollar2: $2 = line number
--	dollar3: $3 = name

end
