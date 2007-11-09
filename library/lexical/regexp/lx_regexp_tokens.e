indexing

	description: "Parser token codes"
	generator: "geyacc version 3.7"

class LX_REGEXP_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_any_value: ANY
	last_integer_value: INTEGER
	last_lx_symbol_class_value: LX_SYMBOL_CLASS
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

	CHAR: INTEGER is 258
	NUMBER: INTEGER is 259
	CCL_OP: INTEGER is 260

end
