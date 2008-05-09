indexing

	description: "Parser token codes"
	generator: "geyacc version 3.8"

class LX_LEX_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_any_value: ANY
	last_string_value: STRING
	last_integer_value: INTEGER
	last_lx_symbol_class_value: LX_SYMBOL_CLASS

feature -- Access

	token_name (a_token: INTEGER): STRING is
			-- Name of token `a_token'
		do
			inspect a_token
			when 0 then
				Result := "EOF token"
			when -1 then
				Result := "Error token"
			when ENDSECT then
				Result := "ENDSECT"
			when EOF_OP then
				Result := "EOF_OP"
			when PIPED then
				Result := "PIPED"
			when EMPTY then
				Result := "EMPTY"
			when EIF_CODE then
				Result := "EIF_CODE"
			when NAME then
				Result := "NAME"
			when CHAR then
				Result := "CHAR"
			when NUMBER then
				Result := "NUMBER"
			when CCL_OP then
				Result := "CCL_OP"
			else
				Result := yy_character_token_name (a_token)
			end
		end

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

end
