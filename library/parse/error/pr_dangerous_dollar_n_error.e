indexing

	description:

		"Warning: Dangerous use of $n in semantic action"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1999, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_DANGEROUS_DOLLAR_N_ERROR

inherit

	UT_ERROR

creation

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; n: INTEGER) is
			-- Create a new error reporting that $`n' has
			-- been used in a semantic action but `n' is not
			-- a valid index for the rhs of the corresponding
			-- rule and therefore its use is dangerous.
		require
			filename_not_void: filename /= Void
		do
			!! parameters.make (1, 3)
			parameters.put (filename, 1)
			parameters.put (line.out, 2)
			parameters.put (n.out, 3)
		end

feature -- Access

	default_template: STRING is "Warning, %"$1%", line $2: dangerous use of $$$3 in semantic action"
			-- Default template used to built the error message

	code: STRING is "PR0014"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = filename
	-- dollar2: $2 = line number
	-- dollar3: $3 = `n' (as in $n)

end -- class PR_DANGEROUS_DOLLAR_N_ERROR
