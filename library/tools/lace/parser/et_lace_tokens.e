indexing

	description: "Parser token codes"
	generator: "geyacc version 3.9"

class ET_LACE_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_any_value: ANY
	last_et_identifier_value: ET_IDENTIFIER

feature -- Access

	token_name (a_token: INTEGER): STRING is
			-- Name of token `a_token'
		do
			inspect a_token
			when 0 then
				Result := "EOF token"
			when -1 then
				Result := "Error token"
			when L_IDENTIFIER then
				Result := "L_IDENTIFIER"
			when L_STRING then
				Result := "L_STRING"
			when L_ALL then
				Result := "L_ALL"
			when L_SYSTEM then
				Result := "L_SYSTEM"
			when L_ROOT then
				Result := "L_ROOT"
			when L_END then
				Result := "L_END"
			when L_CLUSTER then
				Result := "L_CLUSTER"
			when L_DEFAULT then
				Result := "L_DEFAULT"
			when L_EXTERNAL then
				Result := "L_EXTERNAL"
			when L_GENERATE then
				Result := "L_GENERATE"
			when L_OPTION then
				Result := "L_OPTION"
			when L_ABSTRACT then
				Result := "L_ABSTRACT"
			when L_EXCLUDE then
				Result := "L_EXCLUDE"
			when L_VISIBLE then
				Result := "L_VISIBLE"
			when L_LIBRARY then
				Result := "L_LIBRARY"
			when L_ASSEMBLY then
				Result := "L_ASSEMBLY"
			when L_PREFIX then
				Result := "L_PREFIX"
			when L_STRERR then
				Result := "L_STRERR"
			else
				Result := yy_character_token_name (a_token)
			end
		end

feature -- Token codes

	L_IDENTIFIER: INTEGER is 258
	L_STRING: INTEGER is 259
	L_ALL: INTEGER is 260
	L_SYSTEM: INTEGER is 261
	L_ROOT: INTEGER is 262
	L_END: INTEGER is 263
	L_CLUSTER: INTEGER is 264
	L_DEFAULT: INTEGER is 265
	L_EXTERNAL: INTEGER is 266
	L_GENERATE: INTEGER is 267
	L_OPTION: INTEGER is 268
	L_ABSTRACT: INTEGER is 269
	L_EXCLUDE: INTEGER is 270
	L_VISIBLE: INTEGER is 271
	L_LIBRARY: INTEGER is 272
	L_ASSEMBLY: INTEGER is 273
	L_PREFIX: INTEGER is 274
	L_STRERR: INTEGER is 275

end
