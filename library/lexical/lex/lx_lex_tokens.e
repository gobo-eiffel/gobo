indexing

	description: "Parser token codes"
	generator: "geyacc version 1.2"

class LX_LEX_TOKENS

feature -- Token codes

	CHAR: INTEGER is 258
	NUMBER: INTEGER is 259
	ENDSECT: INTEGER is 260
	NAME: INTEGER is 261
	EOF_OP: INTEGER is 262
	CCL_OP: INTEGER is 263
	EIF_CODE: INTEGER is 264
	PIPED: INTEGER is 265
	EMPTY: INTEGER is 266

end -- class LX_LEX_TOKENS
