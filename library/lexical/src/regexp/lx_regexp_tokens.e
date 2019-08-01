note

	description: "Parser token codes"
	generator: "geyacc version 19.06.21.1"

deferred class LX_REGEXP_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_detachable_any_value: detachable ANY
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
			when UNICODE_MODE_START then
				Result := "UNICODE_MODE_START"
			when BYTE_MODE_START then
				Result := "BYTE_MODE_START"
			when CCL_BRACKET then
				Result := "CCL_BRACKET"
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

	UNICODE_MODE_START: INTEGER = 258
	BYTE_MODE_START: INTEGER = 259
	CCL_BRACKET: INTEGER = 260
	CHAR: INTEGER = 261
	NUMBER: INTEGER = 262
	CCL_OP: INTEGER = 263
	CCL_PLUS: INTEGER = 264
	CCL_MINUS: INTEGER = 265

end
