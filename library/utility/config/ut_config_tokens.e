indexing

	description: "Parser token codes"
	generator: "geyacc version 3.8"

class UT_CONFIG_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_any_value: ANY
	last_string_value: STRING

feature -- Access

	token_name (a_token: INTEGER): STRING is
			-- Name of token `a_token'
		do
			inspect a_token
			when 0 then
				Result := "EOF token"
			when -1 then
				Result := "Error token"
			when P_IFDEF then
				Result := "P_IFDEF"
			when P_IFNDEF then
				Result := "P_IFNDEF"
			when P_INCLUDE then
				Result := "P_INCLUDE"
			when P_DEFINE then
				Result := "P_DEFINE"
			when P_UNDEF then
				Result := "P_UNDEF"
			when P_ELSE then
				Result := "P_ELSE"
			when P_ENDIF then
				Result := "P_ENDIF"
			when P_EOL then
				Result := "P_EOL"
			when P_COLON then
				Result := "P_COLON"
			when P_NAME then
				Result := "P_NAME"
			when P_STRING then
				Result := "P_STRING"
			when P_VALUE then
				Result := "P_VALUE"
			when P_OR then
				Result := "P_OR"
			when P_AND then
				Result := "P_AND"
			else
				Result := yy_character_token_name (a_token)
			end
		end

feature -- Token codes

	P_IFDEF: INTEGER is 258
	P_IFNDEF: INTEGER is 259
	P_INCLUDE: INTEGER is 260
	P_DEFINE: INTEGER is 261
	P_UNDEF: INTEGER is 262
	P_ELSE: INTEGER is 263
	P_ENDIF: INTEGER is 264
	P_EOL: INTEGER is 265
	P_COLON: INTEGER is 266
	P_NAME: INTEGER is 267
	P_STRING: INTEGER is 268
	P_VALUE: INTEGER is 269
	P_OR: INTEGER is 270
	P_AND: INTEGER is 271

end
