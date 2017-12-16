note

	description: "Parser token codes"
	generator: "geyacc version 4.2"

deferred class LX_REGEXP_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_detachable_any_value: detachable ANY
	last_integer_value: INTEGER
	last_lx_symbol_class_value: LX_SYMBOL_CLASS
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

	CHAR: INTEGER = 258
	NUMBER: INTEGER = 259
	CCL_OP: INTEGER = 260

end
