note

	description:

		"Invalid use of $n in semantic action"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 1999-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PR_INVALID_DOLLAR_N_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; n: INTEGER)
			-- Create a new error reporting that $`n' has
			-- been used in a semantic action but `n' is
			-- not a valid index for the rhs of the
			-- corresponding rule.
		require
			filename_not_void: filename /= Void
		do
			create parameters.make_filled (empty_string, 1, 3)
			parameters.put (filename, 1)
			parameters.put (line.out, 2)
			parameters.put (n.out, 3)
		end

feature -- Access

	default_template: STRING = "%"$1%", line $2: invalid use of $$$3 in semantic action"
			-- Default template used to built the error message

	code: STRING = "PR0019"
			-- Error code

invariant

--	dollar0: $0 = program name
--	dollar1: $1 = filename
--	dollar2: $2 = line number
--	dollar3: $3 = `n' (as in $n)

end
