%{
note

	description:

		"Scanners for test config parsers"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000-2016, Eric Bezault and others"
	license: "MIT License"

class TS_CONFIG_SCANNER

inherit

	TS_CONFIG_SCANNER_SKELETON
		redefine
			make
		end

create

	make
%}

%x IN_STR
%option nodefault line outfile="ts_config_scanner.e"

%%

----------/** Separators **/----------------------------------------------------

[ \t\r]+			-- Ignore separators
\n+					-- Ignore new-lines


----------/** Comments **/------------------------------------------------------

"--".*				-- Ignore comments
"--".*\n[ \t\r]*	-- Ignire comments


----------/** Symbols **/-------------------------------------------------------

":"					last_token := Colon_code
"("					last_token := Left_parenthesis_code
")"					last_token := Right_parenthesis_code


----------/** Reserved words **/------------------------------------------------

[cC][lL][aA][sS][sS]				last_token := T_CLASS
[cC][lL][uU][sS][tT][eE][rR]		last_token := T_CLUSTER
[cC][oO][mM][pP][iI][lL][eE]		last_token := T_COMPILE
[dD][eE][fF][aA][uU][lL][tT]		last_token := T_DEFAULT
[eE][nN][dD]						last_token := T_END
[eE][xX][eE][cC][uU][tT][eE]		last_token := T_EXECUTE
[fF][eE][aA][tT][uU][rR][eE]		last_token := T_FEATURE
[pP][rR][eE][fF][iI][xX]			last_token := T_PREFIX
[tT][eE][sS][tT]					last_token := T_TEST
[tT][eE][sS][tT][gG][eE][nN]		last_token := T_TESTGEN


----------/** Identifiers **/---------------------------------------------------

[a-zA-Z][a-zA-Z0-9_]*	{
				last_token := T_IDENTIFIER
				last_et_identifier_value := new_identifier (text)
			}


----------/** Strings **/-------------------------------------------------------

\"[^%\n"]*\" {
				last_token := T_STRING
				last_et_identifier_value := new_identifier (text_substring (2, text_count - 1))
			}
\"[^%\n"]*	{
				if text_count > 1 then
					buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			}
<IN_STR>[^%\n"]+	buffer.append_string (text)
<IN_STR>%A			buffer.append_character ('%A')
<IN_STR>%B			buffer.append_character ('%B')
<IN_STR>%C			buffer.append_character ('%C')
<IN_STR>%D			buffer.append_character ('%D')
<IN_STR>%F			buffer.append_character ('%F')
<IN_STR>%H			buffer.append_character ('%H')
<IN_STR>%L			buffer.append_character ('%L')
<IN_STR>%N			buffer.append_character ('%N')
<IN_STR>%Q			buffer.append_character ('%Q')
<IN_STR>%R			buffer.append_character ('%R')
<IN_STR>%S			buffer.append_character ('%S')
<IN_STR>%T			buffer.append_character ('%T')
<IN_STR>%U			buffer.append_character ('%U')
<IN_STR>%V			buffer.append_character ('%V')
<IN_STR>%%			buffer.append_character ('%%')
<IN_STR>%\'			buffer.append_character ('%'')
<IN_STR>%\"			buffer.append_character ('%"')
<IN_STR>%\(			buffer.append_character ('%(')
<IN_STR>%\)			buffer.append_character ('%)')
<IN_STR>%<			buffer.append_character ('%<')
<IN_STR>%>			buffer.append_character ('%>')
<IN_STR>%\/[0-9]+\/	{
			code_ := text_substring (3, text_count - 1).to_integer
			if (code_ > Platform.Maximum_character_code) then
				last_token := T_STRERR
				set_start_condition (INITIAL)
			else
				buffer.append_character (INTEGER_.to_character (code_))
			end
		}
-- The following line should be:
--		<IN_STR>%\n[ \t\r]*%	-- Ignore new-line
-- but some Eiffel classes in Halstenbach libraries
-- have a space after the % character!
<IN_STR>%[ \t\r]*\n[ \t\r]*%	-- Ignore new-line
<IN_STR>[^%\n"]*\"		{
			last_token := T_STRING
			if text_count > 1 then
				buffer.append_string (text_substring (1, text_count - 1))
			end
			create str_.make (buffer.count)
			str_.append_string (buffer)
			buffer.wipe_out
			last_et_identifier_value := new_identifier (str_)
			set_start_condition (INITIAL)
		}
	-- The following line is not correct Eiffel
	-- but is used in Visual Eiffel.
<IN_STR>%.			buffer.append_character (text_item (2))

<IN_STR>.|\n				|
<IN_STR>%[ \t\r]*\n[ \t\r]*	|
<IN_STR>%\/([0-9]+(\/)?)?	|
<IN_STR><<EOF>>			{	-- Catch-all rules (no backing up)
							last_token := T_STRERR
							set_start_condition (INITIAL)
						}


--------------------------------------------------------------------------------

<<EOF>>			terminate
.				last_token := text_item (1).code

--------------------------------------------------------------------------------
%%

feature {NONE} -- Initialization

	make (a_filename: STRING; an_error_handler: like error_handler)
			-- <Precursor>
		do
			str_ := ""
			last_et_identifier_value := new_identifier ("gobo")
			Precursor (a_filename, an_error_handler)
		end
		
feature {NONE} -- Implementation

	code_: INTEGER
	str_: STRING
			-- Used in semantic actions

end
