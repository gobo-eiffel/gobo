note

	description: "Parser token codes"
	generator: "geyacc version 19.10.03.1"

deferred class TS_CONFIG_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_detachable_any_value: detachable ANY
	last_et_identifier_value: ET_IDENTIFIER

feature -- Access

	token_name (a_token: INTEGER): STRING
			-- Name of token `a_token'
		do
			inspect a_token
			when 0 then
				Result := "EOF token"
			when -1 then
				Result := "Error token"
			when T_CLASS then
				Result := "T_CLASS"
			when T_CLUSTER then
				Result := "T_CLUSTER"
			when T_COMPILE then
				Result := "T_COMPILE"
			when T_DEFAULT then
				Result := "T_DEFAULT"
			when T_END then
				Result := "T_END"
			when T_EXECUTE then
				Result := "T_EXECUTE"
			when T_FEATURE then
				Result := "T_FEATURE"
			when T_PREFIX then
				Result := "T_PREFIX"
			when T_TEST then
				Result := "T_TEST"
			when T_TESTGEN then
				Result := "T_TESTGEN"
			when T_STRERR then
				Result := "T_STRERR"
			when T_IDENTIFIER then
				Result := "T_IDENTIFIER"
			when T_STRING then
				Result := "T_STRING"
			else
				Result := yy_character_token_name (a_token)
			end
		end

feature -- Token codes

	T_CLASS: INTEGER = 258
	T_CLUSTER: INTEGER = 259
	T_COMPILE: INTEGER = 260
	T_DEFAULT: INTEGER = 261
	T_END: INTEGER = 262
	T_EXECUTE: INTEGER = 263
	T_FEATURE: INTEGER = 264
	T_PREFIX: INTEGER = 265
	T_TEST: INTEGER = 266
	T_TESTGEN: INTEGER = 267
	T_STRERR: INTEGER = 268
	T_IDENTIFIER: INTEGER = 269
	T_STRING: INTEGER = 270

end
