%{
indexing

	description:

		"Scanners for Lace parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_LACE_SCANNER

inherit

	ET_LACE_SCANNER_SKELETON

create

	make
%}

%x IN_STR
%option nodefault outfile="et_lace_scanner.e"

%%

----------/** Separators **/----------------------------------------------------

[ \t\r]+			-- Ignore separators
\n+					eif_lineno := eif_lineno + text_count


----------/** Lace comments **/-----------------------------------------------

"--".*				-- Ignore comments
"--".*\n[ \t\r]*	eif_lineno := eif_lineno + 1


----------/** Lace symbols **/------------------------------------------------

";"					last_token := Semicolon_code
":"					last_token := Colon_code
","					last_token := Comma_code
"("					last_token := Left_parenthesis_code
")"					last_token := Right_parenthesis_code


----------/** Reserved words **/------------------------------------------------

[aA][bB][sS][tT][rR][aA][cC][tT]	last_token := L_ABSTRACT
[aA][lL][lL]						{
										last_token := L_ALL
										last_et_identifier_value := new_identifier (text)
									}
[cC][lL][uU][sS][tT][eE][rR]		last_token := L_CLUSTER
[dD][eE][fF][aA][uU][lL][tT]		last_token := L_DEFAULT
[eE][nN][dD]						last_token := L_END
[eE][xX][cC][lL][uU][dD][eE]		last_token := L_EXCLUDE
[eE][xX][tT][eE][rR][nN][aA][lL]	last_token := L_EXTERNAL
[gG][eE][nN][eE][rR][aA][tT][eE]	last_token := L_GENERATE
[lL][iI][bB][rR][aA][rR][yY]		last_token := L_LIBRARY
[oO][pP][tT][iI][oO][nN]			last_token := L_OPTION
[rR][oO][oO][tT]					last_token := L_ROOT
[sS][yY][sS][tT][eE][mM]			last_token := L_SYSTEM
[vV][iI][sS][iI][bB][lL][eE]		last_token := L_VISIBLE


----------/** Lace identifiers **/--------------------------------------------

[a-zA-Z][a-zA-Z0-9_]*	{
				last_token := L_IDENTIFIER
				last_et_identifier_value := new_identifier (text)
			}


----------/** Lace strings **/------------------------------------------------

\"\" {
				last_token := L_STRERR
			}
\"[^%\n"]+\" {
				last_token := L_STRING
				last_et_identifier_value := new_identifier (text_substring (2, text_count - 1))
			}
\"[^%\n"]*	{
				if text_count > 1 then
					eif_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			}
<IN_STR>[^%\n"]+	eif_buffer.append_string (text)
<IN_STR>%A			eif_buffer.append_character ('%A')
<IN_STR>%B			eif_buffer.append_character ('%B')
<IN_STR>%C			eif_buffer.append_character ('%C')
<IN_STR>%D			eif_buffer.append_character ('%D')
<IN_STR>%F			eif_buffer.append_character ('%F')
<IN_STR>%H			eif_buffer.append_character ('%H')
<IN_STR>%L			eif_buffer.append_character ('%L')
<IN_STR>%N			eif_buffer.append_character ('%N')
<IN_STR>%Q			eif_buffer.append_character ('%Q')
<IN_STR>%R			eif_buffer.append_character ('%R')
<IN_STR>%S			eif_buffer.append_character ('%S')
<IN_STR>%T			eif_buffer.append_character ('%T')
<IN_STR>%U			eif_buffer.append_character ('%U')
<IN_STR>%V			eif_buffer.append_character ('%V')
<IN_STR>%%			eif_buffer.append_character ('%%')
<IN_STR>%\'			eif_buffer.append_character ('%'')
<IN_STR>%\"			eif_buffer.append_character ('%"')
<IN_STR>%\(			eif_buffer.append_character ('%(')
<IN_STR>%\)			eif_buffer.append_character ('%)')
<IN_STR>%<			eif_buffer.append_character ('%<')
<IN_STR>%>			eif_buffer.append_character ('%>')
<IN_STR>%\/[0-9]+\/	{
			code_ := text_substring (3, text_count - 1).to_integer
			if (code_ > Platform.Maximum_character_code) then
				last_token := L_STRERR
				set_start_condition (INITIAL)
			else
				eif_buffer.append_character (INTEGER_.to_character (code_))
			end
		}
-- The following line should be:
--		<IN_STR>%\n[ \t\r]*%	eif_lineno := eif_lineno + 1
-- but some Eiffel classes in Halstenbach libraries
-- have a space after the % character!
<IN_STR>%[ \t\r]*\n[ \t\r]*%	eif_lineno := eif_lineno + 1
<IN_STR>[^%\n"]*\"		{
			if text_count > 1 then
				eif_buffer.append_string (text_substring (1, text_count - 1))
			end
			if eif_buffer.count > 0 then
				last_token := L_STRING
				create str_.make (eif_buffer.count)
				str_.append_string (eif_buffer)
				eif_buffer.wipe_out
				last_et_identifier_value := new_identifier (str_)
			else
				last_token := L_STRERR
			end
			set_start_condition (INITIAL)
		}
	-- The following line is not correct Eiffel
	-- but is used in Visual Eiffel.
<IN_STR>%.			eif_buffer.append_character (text_item (2))

<IN_STR>.|\n				|
<IN_STR>%[ \t\r]*\n[ \t\r]*	|
<IN_STR>%\/([0-9]+(\/)?)?	|
<IN_STR><<EOF>>			{	-- Catch-all rules (no backing up)
							last_token := L_STRERR
							set_start_condition (INITIAL)
						}


--------------------------------------------------------------------------------

<<EOF>>			terminate
.				last_token := text_item (1).code

--------------------------------------------------------------------------------
%%

end
