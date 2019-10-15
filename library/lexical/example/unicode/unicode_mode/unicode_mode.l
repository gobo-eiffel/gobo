%{
class UNICODE_MODE

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_scanner_skeleton
		redefine
			report_invalid_unicode_character_error
		end

	KL_SHARED_ARGUMENTS
		export {NONE} all end

create

	make
	
%}

HORIZONTAL_BREAK	[ \t\x0B\f\r\u{00A0}\u{1680}\u{2000}-\u{200A}\u{202F}\u{205F}\u{3000}]
BREAK			{HORIZONTAL_BREAK}{+}[\n]

%option nodefault outfile="unicode_mode.e"

%%

{BREAK}+		{
			last_token := T_break
			last_utf8_value := utf8_text
			last_unicode_value := unicode_text
		}
[-+∀∃]+		{
			last_token := T_symbol
			last_utf8_value := utf8_text
			last_unicode_value := unicode_text
		}
([^-+∀∃]{-}{BREAK})+	{
			last_token := T_word
			last_utf8_value := utf8_text
			last_unicode_value := unicode_text
		}

%%

feature {NONE} -- Initialization

	make
			-- Read file specified as first command-line argument and 
			-- print result to file specified as second command-line argument.
		local
			l_input_file: KL_TEXT_INPUT_FILE
			l_output_file: KL_TEXT_OUTPUT_FILE
		do
			make_scanner_skeleton
			last_utf8_value := ""
			last_unicode_value := ""
			create l_input_file.make (Arguments.argument (1))
			l_input_file.open_read
			set_input_buffer (new_unicode_file_buffer (l_input_file))
			create l_output_file.make (Arguments.argument (2))
			l_output_file.recursive_open_write
			l_output_file.put_string ({UC_UTF8_ROUTINES}.utf8_bom)
			from
				read_token
			until
				last_token <= 0
			loop
				l_output_file.put_line ("Token code: " + last_token.out)
				l_output_file.put_line ("Token value: " + last_utf8_value)
				read_token
			end
			l_output_file.close
			l_input_file.close
		end

feature -- Access

	last_utf8_value: STRING_8
		-- Value of last token, using UTF-8 encoding

	last_unicode_value: STRING_32
		-- Value of last token

feature -- Token codes

	T_break: INTEGER = 260
	T_symbol: INTEGER = 261
	T_word: INTEGER = 262
			-- Token codes

feature {NONE} -- Error handling

	report_invalid_unicode_character_error (a_code: NATURAL_32)
			-- Report that the surrogate or invalid Unicode character
			-- with code `a_code' has been read from the input
			-- buffer and caused the scanner to fail.
			--
			-- Note that invalid UTF-8 sequences in the input file
			-- are replaced by the maximum CHARACTER_32 value, which
			-- is an invalid Unicode character.
		do
			std.error.put_line ("Surrogate or invalid Unicode character '\u{" + a_code.to_hex_string + "}'")
		end
			
end
