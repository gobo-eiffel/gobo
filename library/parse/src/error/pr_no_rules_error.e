note

	description:

		"Error: No rules in input grammar"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 1999-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PR_NO_RULES_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make (filename: STRING)
			-- Create a new error reporting that no rules
			-- has been specified in the input grammar.
		require
			filename_not_void: filename /= Void
		do
			create parameters.make_filled (empty_string, 1, 1)
			parameters.put (filename, 1)
		end

feature -- Access

	default_template: STRING = "%"$1%": no rules in input grammar"
			-- Default template used to built the error message

	code: STRING = "PR0009"
			-- Error code

invariant

--	dollar0: $0 = program name
--	dollar1: $1 = filename

end
