indexing

	description: "Parser token codes"
	generator: "geyacc version 1.6"

class LX_LEX_TOKENS

feature -- Token codes

	ENDSECT: INTEGER is 258
	EOF_OP: INTEGER is 259
	PIPED: INTEGER is 260
	EMPTY: INTEGER is 261
	EIF_CODE: INTEGER is 262
	NAME: INTEGER is 263
	CHAR: INTEGER is 264
	NUMBER: INTEGER is 265
	CCL_OP: INTEGER is 266

end -- class LX_LEX_TOKENS
