indexing

	description:

		"Parser tokens for lexical analyzer generators such as 'gelex'";

	library:    "Gobo Eiffel Lexical Library";
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1996, Eric Bezault";
	date:       "26 November 1996";
	revision:   "LX 0.2"

class LX_REGEXP_TOKENS

inherit

	ELKS_ANY

feature -- Token codes

	CHAR: INTEGER is 257
	NUMBER: INTEGER is 258
	EOF_OP: INTEGER is 259
	CCL_OP: INTEGER is 260

end -- class LX_REGEXP_TOKENS
