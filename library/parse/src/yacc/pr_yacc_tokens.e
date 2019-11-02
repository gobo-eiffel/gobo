note

	description: "Parser token codes"
	generator: "geyacc"

deferred class PR_YACC_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_detachable_any_value: detachable ANY
	last_string_32_value: STRING_32
	last_string_value: STRING
	last_integer_value: INTEGER

feature -- Access

	token_name (a_token: INTEGER): STRING
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
			when T_CHAR then
				Result := "T_CHAR"
			when T_EIFFEL then
				Result := "T_EIFFEL"
			when T_IDENTIFIER then
				Result := "T_IDENTIFIER"
			when T_ACTION then
				Result := "T_ACTION"
			when T_USER_CODE then
				Result := "T_USER_CODE"
			when T_STR then
				Result := "T_STR"
			when T_BOOLEAN then
				Result := "T_BOOLEAN"
			when T_POINTER then
				Result := "T_POINTER"
			when T_TUPLE then
				Result := "T_TUPLE"
			when T_AS then
				Result := "T_AS"
			when T_INTEGER then
				Result := "T_INTEGER"
			when T_INTEGER_8 then
				Result := "T_INTEGER_8"
			when T_INTEGER_16 then
				Result := "T_INTEGER_16"
			when T_INTEGER_32 then
				Result := "T_INTEGER_32"
			when T_INTEGER_64 then
				Result := "T_INTEGER_64"
			when T_NATURAL then
				Result := "T_NATURAL"
			when T_NATURAL_8 then
				Result := "T_NATURAL_8"
			when T_NATURAL_16 then
				Result := "T_NATURAL_16"
			when T_NATURAL_32 then
				Result := "T_NATURAL_32"
			when T_NATURAL_64 then
				Result := "T_NATURAL_64"
			when T_REAL then
				Result := "T_REAL"
			when T_REAL_32 then
				Result := "T_REAL_32"
			when T_REAL_64 then
				Result := "T_REAL_64"
			when T_DOUBLE then
				Result := "T_DOUBLE"
			when T_CHARACTER then
				Result := "T_CHARACTER"
			when T_CHARACTER_8 then
				Result := "T_CHARACTER_8"
			when T_CHARACTER_32 then
				Result := "T_CHARACTER_32"
			when T_LIKE then
				Result := "T_LIKE"
			when T_CURRENT then
				Result := "T_CURRENT"
			when T_EXPANDED then
				Result := "T_EXPANDED"
			when T_REFERENCE then
				Result := "T_REFERENCE"
			when T_SEPARATE then
				Result := "T_SEPARATE"
			when T_ATTACHED then
				Result := "T_ATTACHED"
			when T_DETACHABLE then
				Result := "T_DETACHABLE"
			when T_NUMBER then
				Result := "T_NUMBER"
			when T_ERROR then
				Result := "T_ERROR"
			else
				Result := yy_character_token_name (a_token)
			end
		end

feature -- Token codes

	T_TOKEN: INTEGER = 258
	T_LEFT: INTEGER = 259
	T_RIGHT: INTEGER = 260
	T_NONASSOC: INTEGER = 261
	T_EXPECT: INTEGER = 262
	T_PREC: INTEGER = 263
	T_START: INTEGER = 264
	T_TYPE: INTEGER = 265
	T_2PERCENTS: INTEGER = 266
	T_UNKNOWN: INTEGER = 267
	T_CHAR: INTEGER = 268
	T_EIFFEL: INTEGER = 269
	T_IDENTIFIER: INTEGER = 270
	T_ACTION: INTEGER = 271
	T_USER_CODE: INTEGER = 272
	T_STR: INTEGER = 273
	T_BOOLEAN: INTEGER = 274
	T_POINTER: INTEGER = 275
	T_TUPLE: INTEGER = 276
	T_AS: INTEGER = 277
	T_INTEGER: INTEGER = 278
	T_INTEGER_8: INTEGER = 279
	T_INTEGER_16: INTEGER = 280
	T_INTEGER_32: INTEGER = 281
	T_INTEGER_64: INTEGER = 282
	T_NATURAL: INTEGER = 283
	T_NATURAL_8: INTEGER = 284
	T_NATURAL_16: INTEGER = 285
	T_NATURAL_32: INTEGER = 286
	T_NATURAL_64: INTEGER = 287
	T_REAL: INTEGER = 288
	T_REAL_32: INTEGER = 289
	T_REAL_64: INTEGER = 290
	T_DOUBLE: INTEGER = 291
	T_CHARACTER: INTEGER = 292
	T_CHARACTER_8: INTEGER = 293
	T_CHARACTER_32: INTEGER = 294
	T_LIKE: INTEGER = 295
	T_CURRENT: INTEGER = 296
	T_EXPANDED: INTEGER = 297
	T_REFERENCE: INTEGER = 298
	T_SEPARATE: INTEGER = 299
	T_ATTACHED: INTEGER = 300
	T_DETACHABLE: INTEGER = 301
	T_NUMBER: INTEGER = 302
	T_ERROR: INTEGER = 303

end
