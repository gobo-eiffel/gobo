note

	description: "Parser token codes"
	generator: "geyacc version 19.06.21.1"

deferred class LX_WILDCARD_TOKENS

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
			when STAR_STAR_SLASH then
				Result := "STAR_STAR_SLASH"
			when STAR_PAREN then
				Result := "STAR_PAREN"
			when dummy then
				Result := "dummy"
			when CCL_BRACKET then
				Result := "CCL_BRACKET"
			when CHAR then
				Result := "CHAR"
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

	STAR_STAR_SLASH: INTEGER = 258
	STAR_PAREN: INTEGER = 259
	dummy: INTEGER = 260
	CCL_BRACKET: INTEGER = 261
	CHAR: INTEGER = 262
	CCL_OP: INTEGER = 263
	CCL_PLUS: INTEGER = 264
	CCL_MINUS: INTEGER = 265

end
