indexing

	description:

		"Warning: Rule declared twice"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_RULE_DECLARED_TWICE_ERROR

inherit

	UT_ERROR

creation

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; a_rule: STRING) is
			-- Create a new error reporting that `a_rule'
			-- has been declared twice.
		require
			filename_not_void: filename /= Void
			a_rule_not_void: a_rule /= Void
		do
			!! parameters.make (1, 3)
			parameters.put (filename, 1)
			parameters.put (line.out, 2)
			parameters.put (a_rule, 3)
		end

feature -- Access

	default_template: STRING is "Warning, %"$1%", line $2: rule $3 declared twice"
			-- Default template used to built the error message

	code: STRING is "PR0012"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = filename
	-- dollar2: $2 = line number
	-- dollar3: $3 = rule name

end -- class PR_RULE_DECLARED_TWICE_ERROR
