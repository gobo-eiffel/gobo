note

	description:

		"Error: syntax error in regular expression"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TS_REGEXP_SYNTAX_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make (a_regexp: STRING; filename: STRING; line: INTEGER) is
			-- Create a new error reporting a syntax error
			-- in regular expression `a_regexp'.
		require
			a_regexp_not_void: a_regexp /= Void
			filename_not_void: filename /= Void
		do
			create parameters.make (1, 3)
			parameters.put (a_regexp, 1)
			parameters.put (filename, 2)
			parameters.put (line.out, 3)
		end

feature -- Access

	default_template: STRING is "%"$2%", line $3: syntax error in regular expression %"$1%""
			-- Default template used to built the error message

	code: STRING is "TS0001"
			-- Error code

invariant

--	dollar0: $0 = program name
--	dollar1: $1 = regexp
--	dollar2: $2 = filename
--	dollar3: $3 = line number

end
