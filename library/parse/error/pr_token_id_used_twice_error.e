indexing

	description:

		"Warning: Token id used twice"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_TOKEN_ID_USED_TWICE_ERROR

inherit

	UT_ERROR

creation

	make

feature {NONE} -- Initialization

	make (filename: STRING; token1, token2: STRING; token_id: INTEGER) is
			-- Create a new error reporting that `token1' and
			-- `token2' have been assigned the same token id.
		require
			filename_not_void: filename /= Void
			token1_not_void: token1 /= Void
			token2_not_void: token2 /= Void
		do
			!! parameters.make (1, 4)
			parameters.put (filename, 1)
			parameters.put (token1, 2)
			parameters.put (token2, 3)
			parameters.put (token_id.out, 4)
		end

feature -- Access

	default_template: STRING is "Warning, %"$1%": tokens $2 and $3 both assigned number $4"
			-- Default template used to built the error message

	code: STRING is "PR0013"
			-- Error code

invariant

	-- dollar0: $0 = program name
	-- dollar1: $1 = filename
	-- dollar2: $2 = token1
	-- dollar3: $3 = token2
	-- dollar4: $4 = token id

end -- class PR_TOKEN_ID_USED_TWICE_ERROR
