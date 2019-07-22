note

	description: "Parser token codes"
	generator: "geyacc version 19.06.21.1"

deferred class LX_LEX_TOKENS

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
			when EIF_CODE then
				Result := "EIF_CODE"
			when NAME then
				Result := "NAME"
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

	ENDSECT: INTEGER = 258
	EOF_OP: INTEGER = 259
	PIPED: INTEGER = 260
	EMPTY: INTEGER = 261
	UNICODE_MODE_START: INTEGER = 262
	BYTE_MODE_START: INTEGER = 263
	EIF_CODE: INTEGER = 264
	NAME: INTEGER = 265
	CCL_BRACKET: INTEGER = 266
	UCCL_BRACKET: INTEGER = 267
	CHAR: INTEGER = 268
	BCHAR: INTEGER = 269
	UCHAR: INTEGER = 270
	NUMBER: INTEGER = 271
	CCL_OP: INTEGER = 272
	UCCL_OP: INTEGER = 273

end
