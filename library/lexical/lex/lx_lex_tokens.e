indexing

	description:

		"Parser tokens for lexical analyzer generators such as 'gelex'";

	library:    "Gobo Eiffel Lexical Library";
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

class LX_LEX_TOKENS

feature -- Token codes

	CHAR: INTEGER is 257
	NUMBER: INTEGER is 258
	ENDSECT: INTEGER is 259
	NAME: INTEGER is 260
	EOF_OP: INTEGER is 261
	CCL_OP: INTEGER is 262
	EIF_CODE: INTEGER is 263
	PIPED: INTEGER is 264
	EMPTY: INTEGER is 265

end -- class LX_LEX_TOKENS
