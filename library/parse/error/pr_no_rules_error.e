indexing

	description:

		"Error: No rules in input grammar"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_NO_RULES_ERROR

inherit

	UT_ERROR

creation

	make

feature {NONE} -- Initialization

	make (filename: STRING) is
			-- Create a new error reporting that no rules
			-- has been specified in the input grammar.
		require
			filename_not_void: filename /= Void
		do
			!! parameters.make (1, 1)
			parameters.put (filename, 1)
		end

feature -- Access

	default_template: STRING is "%"$1%": no rules in input grammar"
			-- Default template used to built the error message

	code: STRING is "PR0009"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = filename

end -- class PR_NO_RULES_ERROR
