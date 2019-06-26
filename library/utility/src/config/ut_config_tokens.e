note

	description: "Parser token codes"
	generator: "geyacc version 19.06.21.1"

deferred class UT_CONFIG_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_detachable_any_value: detachable ANY
	last_string_value: STRING

feature -- Access

	token_name (a_token: INTEGER): STRING
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

	P_IFDEF: INTEGER = 258
	P_IFNDEF: INTEGER = 259
	P_INCLUDE: INTEGER = 260
	P_DEFINE: INTEGER = 261
	P_UNDEF: INTEGER = 262
	P_ELSE: INTEGER = 263
	P_ENDIF: INTEGER = 264
	P_EOL: INTEGER = 265
	P_COLON: INTEGER = 266
	P_NAME: INTEGER = 267
	P_STRING: INTEGER = 268
	P_VALUE: INTEGER = 269
	P_OR: INTEGER = 270
	P_AND: INTEGER = 271

end
