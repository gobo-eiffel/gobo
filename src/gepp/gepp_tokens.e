indexing

	description: "Parser token codes"
	generator:   "geyacc version 1.0"

class GEPP_TOKENS

feature -- Token codes

	P_IFDEF: INTEGER is 258
	P_IFNDEF: INTEGER is 259
	P_INCLUDE: INTEGER is 260
	P_DEFINE: INTEGER is 261
	P_UNDEF: INTEGER is 262
	P_NAME: INTEGER is 263
	P_DEF_VALUE: INTEGER is 264
	P_ELSE: INTEGER is 265
	P_ENDIF: INTEGER is 266
	P_EOL: INTEGER is 267
	P_OR: INTEGER is 268
	P_AND: INTEGER is 269

end -- class GEPP_TOKENS
