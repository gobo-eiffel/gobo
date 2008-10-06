indexing

	description:

		"Invalid use of %%error(n) in rule"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PR_INVALID_ERROR_N_ERROR

inherit

	UT_ERROR

create

	make

feature {NONE} -- Initialization

	make (filename: STRING; line: INTEGER; n: INTEGER) is
			-- Create a new error reporting that %error(`n') has
			-- been used in a rule but `n' is not a valid index
			-- for the rhs of the corresponding rule.
		require
			filename_not_void: filename /= Void
		do
			create parameters.make (1, 3)
			parameters.put (filename, 1)
			parameters.put (line.out, 2)
			parameters.put (n.out, 3)
		end

feature -- Access

	default_template: STRING is "%"$1%", line $2: invalid use of %%error($3) in rule"
			-- Default template used to built the error message

	code: STRING is "PR0025"
			-- Error code

invariant

--	dollar0: $0 = program name
--	dollar1: $1 = filename
--	dollar2: $2 = line number
--	dollar3: $3 = `n' (as in %error(n))

end
