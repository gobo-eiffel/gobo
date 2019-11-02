note

	description: "Parser token codes"
	generator: "geyacc"

deferred class LX_LEX_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_detachable_any_value: detachable ANY
	last_string_32_value: STRING_32
	last_string_value: STRING
	last_integer_value: INTEGER
	last_lx_symbol_class_value: LX_SYMBOL_CLASS

feature -- Access

	token_name (a_token: INTEGER): STRING
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
			when UNICODE_MODE_START then
				Result := "UNICODE_MODE_START"
			when BYTE_MODE_START then
				Result := "BYTE_MODE_START"
			when CCL_BRACKET then
				Result := "CCL_BRACKET"
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
			when CCL_PLUS then
				Result := "CCL_PLUS"
			when CCL_MINUS then
				Result := "CCL_MINUS"
			else
				Result := yy_character_token_name (a_token)
			end
		end

feature -- Token codes

	ENDSECT: INTEGER = 258
	EOF_OP: INTEGER = 259
	PIPED: INTEGER = 260
	EMPTY: INTEGER = 261
	UNICODE_MODE_START: INTEGER = 262
	BYTE_MODE_START: INTEGER = 263
	CCL_BRACKET: INTEGER = 264
	EIF_CODE: INTEGER = 265
	NAME: INTEGER = 266
	CHAR: INTEGER = 267
	NUMBER: INTEGER = 268
	CCL_OP: INTEGER = 269
	CCL_PLUS: INTEGER = 270
	CCL_MINUS: INTEGER = 271

end
