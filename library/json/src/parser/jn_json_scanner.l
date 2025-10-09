%{
note

	description:

		"Scanners for JSON parsers"

	library: "Gobo Eiffel JSON Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class JN_JSON_SCANNER

inherit

	JN_JSON_SCANNER_SKELETON

create

	make,
	make_with_error_handler
%}

%option nodefault line outfile="jn_json_scanner.e"

%%

----------/** Separators **/----------------------------------------------------

[ \t\r\n]	-- Ignored

----------/** JSON symbols **/--------------------------------------------------

[:,{}[\]]	{
				last_token := text_item (1).code
			}

----------/** Keywords **/------------------------------------------------------

true		{
				last_token := T_TRUE
				create last_detachable_jn_boolean_value.make_true
			}

false		{
				last_token := T_FALSE
				create last_detachable_jn_boolean_value.make_false
			}

null		{
				last_token := T_NULL
				create last_detachable_jn_null_value.make
			}

----------/** Numbers **/-------------------------------------------------------

\-?(0|[1-9][0-9]*)(\.[0-9]+)?([eE][-+]?[0-9]+)?	{
				last_token := T_NUMBER
				create last_detachable_jn_number_value.make (utf8_text)
			}

----------/** Strings **/-------------------------------------------------------

\"([\u{0020}-\u{1680}]{-}[\\\"]|\\([\"\\/bfnrt]|u[0-9a-fA-F]{4}))*\"	{
				last_token := T_STRING
				create last_detachable_jn_string_value.make_from_escaped (utf8_text_substring (2, text_count - 1))
			}

--------------------------------------------------------------------------------

<<EOF>>			terminate
.			{
				last_token := T_UNKNOWN
			}

--------------------------------------------------------------------------------
%%

end
