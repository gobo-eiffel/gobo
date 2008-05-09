indexing

	description: "Parser token codes"
	generator: "geyacc version 3.8"

class PR_YACC_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_any_value: ANY
	last_string_value: STRING
	last_integer_value: INTEGER

feature -- Access

	token_name (a_token: INTEGER): STRING is
			-- Name of token `a_token'
		do
			inspect a_token
			when 0 then
				Result := "EOF token"
			when -1 then
				Result := "Error token"
			when T_TOKEN then
				Result := "T_TOKEN"
			when T_LEFT then
				Result := "T_LEFT"
			when T_RIGHT then
				Result := "T_RIGHT"
			when T_NONASSOC then
				Result := "T_NONASSOC"
			when T_EXPECT then
				Result := "T_EXPECT"
			when T_PREC then
				Result := "T_PREC"
			when T_START then
				Result := "T_START"
			when T_TYPE then
				Result := "T_TYPE"
			when T_2PERCENTS then
				Result := "T_2PERCENTS"
			when T_UNKNOWN then
				Result := "T_UNKNOWN"
			when T_EIFFEL then
				Result := "T_EIFFEL"
			when T_IDENTIFIER then
				Result := "T_IDENTIFIER"
			when T_ACTION then
				Result := "T_ACTION"
			when T_USER_CODE then
				Result := "T_USER_CODE"
			when T_CHAR then
				Result := "T_CHAR"
			when T_STR then
				Result := "T_STR"
			when T_INTEGER then
				Result := "T_INTEGER"
			when T_BOOLEAN then
				Result := "T_BOOLEAN"
			when T_CHARACTER then
				Result := "T_CHARACTER"
			when T_REAL then
				Result := "T_REAL"
			when T_DOUBLE then
				Result := "T_DOUBLE"
			when T_POINTER then
				Result := "T_POINTER"
			when T_LIKE then
				Result := "T_LIKE"
			when T_NUMBER then
				Result := "T_NUMBER"
			when T_ERROR then
				Result := "T_ERROR"
			else
				Result := yy_character_token_name (a_token)
			end
		end

feature -- Token codes

	T_TOKEN: INTEGER is 258
	T_LEFT: INTEGER is 259
	T_RIGHT: INTEGER is 260
	T_NONASSOC: INTEGER is 261
	T_EXPECT: INTEGER is 262
	T_PREC: INTEGER is 263
	T_START: INTEGER is 264
	T_TYPE: INTEGER is 265
	T_2PERCENTS: INTEGER is 266
	T_UNKNOWN: INTEGER is 267
	T_EIFFEL: INTEGER is 268
	T_IDENTIFIER: INTEGER is 269
	T_ACTION: INTEGER is 270
	T_USER_CODE: INTEGER is 271
	T_CHAR: INTEGER is 272
	T_STR: INTEGER is 273
	T_INTEGER: INTEGER is 274
	T_BOOLEAN: INTEGER is 275
	T_CHARACTER: INTEGER is 276
	T_REAL: INTEGER is 277
	T_DOUBLE: INTEGER is 278
	T_POINTER: INTEGER is 279
	T_LIKE: INTEGER is 280
	T_NUMBER: INTEGER is 281
	T_ERROR: INTEGER is 282

end
