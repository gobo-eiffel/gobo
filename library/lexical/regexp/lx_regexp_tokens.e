indexing

	description:

		"Parser tokens for regular expression compilers"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_REGEXP_TOKENS

feature -- Token codes

	CHAR: INTEGER is 257
	NUMBER: INTEGER is 258
	CCL_OP: INTEGER is 259

end -- class LX_REGEXP_TOKENS
