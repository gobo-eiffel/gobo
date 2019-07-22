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
	last_lx_unicode_character_class_value: LX_UNICODE_CHARACTER_CLASS

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
			when UCCL_BRACKET then
				Result := "UCCL_BRACKET"
			when CHAR then
				Result := "CHAR"
			when BCHAR then
				Result := "BCHAR"
			when UCHAR then
				Result := "UCHAR"
			when NUMBER then
				Result := "NUMBER"
			when CCL_OP then
				Result := "CCL_OP"
			when UCCL_OP then
				Result := "UCCL_OP"
			else
				Result := yy_character_token_name (a_token)
			end
		end

feature -- Token codes

	UNICODE_MODE_START: INTEGER = 258
	BYTE_MODE_START: INTEGER = 259
	CCL_BRACKET: INTEGER = 260
	UCCL_BRACKET: INTEGER = 261
	CHAR: INTEGER = 262
	BCHAR: INTEGER = 263
	UCHAR: INTEGER = 264
	NUMBER: INTEGER = 265
	CCL_OP: INTEGER = 266
	UCCL_OP: INTEGER = 267

end
