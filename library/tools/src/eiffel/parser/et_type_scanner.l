%{
note

	description:

		"Scanners for Eiffel type parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_TYPE_SCANNER

inherit

	ET_TYPE_SCANNER_SKELETON

create

	make
%}

HORIZONTAL_BREAK	[ \t\x0B\f\r\u{00A0}\u{1680}\u{2000}-\u{200A}\u{202F}\u{205F}\u{3000}]
BREAK				{HORIZONTAL_BREAK}{+}[\n]

%option nodefault line outfile="et_type_scanner.e"

%%

----------/** Eiffel symbols **/------------------------------------------------

[.;,:!?{}[\]]	{
				process_one_char_symbol (unicode_text_item (1))
			}


----------/** Eiffel identifiers **/--------------------------------------------

[a-zA-Z][a-zA-Z0-9_]*	{
				process_identifier (text_count)
			}


----------/** Separators **/----------------------------------------------------

{BREAK}+	{
				last_literal_start := 1
				last_literal_end := 0
				last_text_count := 0
			}

({BREAK}|"--".*)+	{
				last_literal_start := 1
				last_literal_end := 0
				last_text_count := 0
			}


--------------------------------------------------------------------------------

<<EOF>>			terminate
.			{
				last_token := E_UNKNOWN
				last_detachable_et_position_value := current_position
			}

--------------------------------------------------------------------------------
%%

end
