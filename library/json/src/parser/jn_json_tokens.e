note

	description: "Parser token codes"
	generator: "geyacc"

deferred class JN_JSON_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_detachable_any_value: detachable ANY
	last_detachable_jn_boolean_value: detachable JN_BOOLEAN
	last_detachable_jn_null_value: detachable JN_NULL
	last_detachable_jn_number_value: detachable JN_NUMBER
	last_detachable_jn_string_value: detachable JN_STRING

feature -- Access

	token_name (a_token: INTEGER): STRING
			-- Name of token `a_token'
		do
			inspect a_token
			when 0 then
				Result := "EOF token"
			when -1 then
				Result := "Error token"
			when T_TRUE then
				Result := "T_TRUE"
			when T_FALSE then
				Result := "T_FALSE"
			when T_NULL then
				Result := "T_NULL"
			when T_NUMBER then
				Result := "T_NUMBER"
			when T_STRING then
				Result := "T_STRING"
			when T_UNKNOWN then
				Result := "T_UNKNOWN"
			else
				Result := yy_character_token_name (a_token)
			end
		end

feature -- Token codes

	T_TRUE: INTEGER = 258
	T_FALSE: INTEGER = 259
	T_NULL: INTEGER = 260
	T_NUMBER: INTEGER = 261
	T_STRING: INTEGER = 262
	T_UNKNOWN: INTEGER = 263

end
