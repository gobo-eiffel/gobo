%{
indexing

	description:

		"Scanners for Eiffel parsers"

	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class EIFFEL_SCANNER

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton
		end

	EIFFEL_TOKENS
		export
			{NONE} all
		end

	ARGUMENTS
		export
			{NONE} all
		end

	UT_CHARACTER_CODES
		export
			{NONE} all
		end

	KL_SHARED_INTEGER_ROUTINES

	KL_SHARED_INPUT_STREAM_ROUTINES

	KL_SHARED_STRING_ROUTINES

	KL_SHARED_PLATFORM

	KL_SHARED_EXCEPTIONS

creation

	make, execute, benchmark
%}

%x IN_STR
%option nodefault outfile="eiffel_scanner.e"

%%

		--/** Separators **/

\n+					eif_lineno := eif_lineno + text_count
[ \t\r]+			;



		--/** Eiffel comments **/

"--".*\n[ \t\r]*	eif_lineno := eif_lineno + 1
"--".*				;



		--/**	Eiffel symbols **/

"+"			last_token := Plus_code
"-"			last_token := Minus_code
"*"			last_token := Star_code
"/"			last_token := Slash_code
"^"			last_token := Caret_code
"//"		last_token := E_DIV
"\\\\"		last_token := E_MOD
"="			last_token := Equal_code
"/="		last_token := E_NE
">"			last_token := Greater_than_code
">="		last_token := E_GE
"<"			last_token := Less_than_code
"<="		last_token := E_LE
"."			last_token := Dot_code
";"			last_token := Semicolon_code
","			last_token := Comma_code
":"			last_token := Colon_code
"!"			last_token := Exclamation_code
"!!"		last_token := E_BANGBANG
"->"		last_token := E_ARROW
".."		last_token := E_DOTDOT
"("			last_token := Left_parenthesis_code
")"			last_token := Right_parenthesis_code
"["			last_token := Left_bracket_code
"]"			last_token := Right_bracket_code
"{"			last_token := Left_brace_code
"}"			last_token := Right_brace_code
"<<"		last_token := E_LARRAY
">>"		last_token := E_RARRAY
":="		last_token := E_ASSIGN
"?="		last_token := E_REVERSE
"$"			last_token := Dollar_code



		--/** Reserved words **/

[aA][lL][iI][aA][sS]					last_token := E_ALIAS
[aA][lL][lL]							last_token := E_ALL
[aA][nN][dD]							last_token := E_AND
[aA][sS]								last_token := E_AS
[cC][hH][eE][cC][kK]					last_token := E_CHECK
[cC][lL][aA][sS][sS]					last_token := E_CLASS
[cC][rR][eE][aA][tT][iI][oO][nN]		last_token := E_CREATION
[dD][eE][bB][uU][gG]					last_token := E_DEBUG
[dD][eE][fF][eE][rR][rR][eE][dD]		last_token := E_DEFERRED
[dD][oO]								last_token := E_DO
[eE][lL][sS][eE]						last_token := E_ELSE
[eE][lL][sS][eE][iI][fF]				last_token := E_ELSEIF
[eE][nN][dD]							last_token := E_END
[eE][nN][sS][uU][rR][eE]				last_token := E_ENSURE
[eE][xX][pP][aA][nN][dD][eE][dD]		last_token := E_EXPANDED
[eE][xX][pP][oO][rR][tT]				last_token := E_EXPORT
[eE][xX][tT][eE][rR][nN][aA][lL]		last_token := E_EXTERNAL
[fF][aA][lL][sS][eE]					last_token := E_FALSE
[fF][eE][aA][tT][uU][rR][eE]			last_token := E_FEATURE
[fF][rR][oO][mM]						last_token := E_FROM
[fF][rR][oO][zZ][eE][nN]				last_token := E_FROZEN
[iI][fF]								last_token := E_IF
[iI][mM][pP][lL][iI][eE][sS]			last_token := E_IMPLIES
[iI][nN][dD][eE][xX][iI][nN][gG]		last_token := E_INDEXING
[iI][nN][fF][iI][xX]					last_token := E_INFIX
[iI][nN][hH][eE][rR][iI][tT]			last_token := E_INHERIT
[iI][nN][sS][pP][eE][cC][tT]			last_token := E_INSPECT
[iI][nN][vV][aA][rR][iI][aA][nN][tT]	last_token := E_INVARIANT
[iI][sS]								last_token := E_IS
[lL][iI][kK][eE]						last_token := E_LIKE
[lL][oO][cC][aA][lL]					last_token := E_LOCAL
[lL][oO][oO][pP]						last_token := E_LOOP
[nN][oO][tT]							last_token := E_NOT
[oO][bB][sS][oO][lL][eE][tT][eE]		last_token := E_OBSOLETE
[oO][lL][dD]							last_token := E_OLD
[oO][nN][cC][eE]						last_token := E_ONCE
[oO][rR]								last_token := E_OR
[pP][rR][eE][fF][iI][xX]				last_token := E_PREFIX
[rR][eE][dD][eE][fF][iI][nN][eE]		last_token := E_REDEFINE
[rR][eE][nN][aA][mM][eE]				last_token := E_RENAME
[rR][eE][qQ][uU][iI][rR][eE]			last_token := E_REQUIRE
[rR][eE][sS][cC][uU][eE]				last_token := E_RESCUE
[rR][eE][tT][rR][yY]					last_token := E_RETRY
[sS][eE][lL][eE][cC][tT]				last_token := E_SELECT
[sS][eE][pP][aA][rR][aA][tT][eE]		last_token := E_SEPARATE
[sS][tT][rR][iI][pP]					last_token := E_STRIP
[tT][hH][eE][nN]						last_token := E_THEN
[tT][rR][uU][eE]						last_token := E_TRUE
[uU][nN][dD][eE][fF][iI][nN][eE]		last_token := E_UNDEFINE
[uU][nN][iI][qQ][uU][eE]				last_token := E_UNIQUE
[uU][nN][tT][iI][lL]					last_token := E_UNTIL
[vV][aA][rR][iI][aA][nN][tT]			last_token := E_VARIANT
[wW][hH][eE][nN]						last_token := E_WHEN
[xX][oO][rR]							last_token := E_XOR
[cC][uU][rR][rR][eE][nN][tT]			last_token := E_CURRENT
[rR][eE][sS][uU][lL][tT]				last_token := E_RESULT



		--/** Eiffel identifiers **/

[a-zA-Z][a-zA-Z0-9_]*	{
							last_token := E_IDENTIFIER
							last_value := text
						}


		--/** Eiffel free operators **/

[@#|&][^%"\0-\32\127-\255]*		{
							last_token := E_FREEOP
							last_value := text
						}


		--/** Eiffel characters **/

\'[^%\n']\'			last_token := E_CHARACTER; last_value := text_item (2)
\'%A\'				last_token := E_CHARACTER; last_value := '%A'
\'%B\'				last_token := E_CHARACTER; last_value := '%B'
\'%C\'				last_token := E_CHARACTER; last_value := '%C'
\'%D\'				last_token := E_CHARACTER; last_value := '%D'
\'%F\'				last_token := E_CHARACTER; last_value := '%F'
\'%H\'				last_token := E_CHARACTER; last_value := '%H'
\'%L\'				last_token := E_CHARACTER; last_value := '%L'
\'%N\'				last_token := E_CHARACTER; last_value := '%N'
\'%Q\'				last_token := E_CHARACTER; last_value := '%Q'
\'%R\'				last_token := E_CHARACTER; last_value := '%R'
\'%S\'				last_token := E_CHARACTER; last_value := '%S'
\'%T\'				last_token := E_CHARACTER; last_value := '%T'
\'%U\'				last_token := E_CHARACTER; last_value := '%U'
\'%V\'				last_token := E_CHARACTER; last_value := '%V'
\'%%\'				last_token := E_CHARACTER; last_value := '%%'
\'%\'\'				last_token := E_CHARACTER; last_value := '%''
\'%\"\'				last_token := E_CHARACTER; last_value := '%"'
\'%\(\'				last_token := E_CHARACTER; last_value := '%('
\'%\)\'				last_token := E_CHARACTER; last_value := '%)'
\'%<\'				last_token := E_CHARACTER; last_value := '%<'
\'%>\'				last_token := E_CHARACTER; last_value := '%>'
\'%\/[0-9]+\/\'		{
						code_ := text_substring (4, text_count - 2).to_integer
						if code_ > platform_.Maximum_character_code then
							last_token := E_CHARERR
						else
							last_token := E_CHARACTER
							last_value := integer_.to_character (code_)
						end
					}
\'.{1,2}			|
\'%\/[0-9]+(\/)?	last_token := E_CHARERR	-- Catch-all rules (no backing up)



		--/** Eiffel strings **/

\"\+\"								last_token := process_operator (E_STRPLUS)
\"-\"								last_token := process_operator (E_STRMINUS)
\"\*\"								last_token := process_operator (E_STRSTAR)
\"\/\"								last_token := process_operator (E_STRSLASH)
\"\/\/\"							last_token := process_operator (E_STRDIV)
\"\\\\\"							last_token := process_operator (E_STRMOD)
\"^\"								last_token := process_operator (E_STRPOWER)
\"<\"								last_token := process_operator (E_STRLT)
\"<=\"								last_token := process_operator (E_STRLE)
\">\"								last_token := process_operator (E_STRGT)
\">=\"								last_token := process_operator (E_STRGE)
\"[nN][oO][tT]\"					last_token := process_operator (E_STRNOT)
\"[aA][nN][dD]\"					last_token := process_operator (E_STRAND)
\"[oO][rR]\"						last_token := process_operator (E_STROR)
\"[xX][oO][rR]\"					last_token := process_operator (E_STRXOR)
\"[aA][nN][dD]\ [tT][hH][eE][nN]\"	last_token := process_operator (E_STRANDTHEN)
\"[oO][rR]\ [eE][lL][sS][eE]\"		last_token := process_operator (E_STRORELSE)
\"[iI][mM][pP][lL][iI][eE][sS]\"	last_token := process_operator (E_STRIMPLIES)
\"[@#|&][^%"\0-\32\127-\255]*\"		{
			if is_operator then
				last_token := E_STRFREEOP
			else
				last_token := E_STRING
			end
			last_value := text_substring (2, text_count - 1)
		}
\"[^%\n"]*\" {
				last_token := E_STRING
				last_value := text_substring (2, text_count - 1)
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
			if (code_ > platform_.Maximum_character_code) then
				last_token := E_STRERR
				set_start_condition (INITIAL)
			else
				eif_buffer.append_character (integer_.to_character (code_))
			end
		}
<IN_STR>%\n[ \t\r]*%	eif_lineno := eif_lineno + 1
<IN_STR>[^%\n"]*\"		{
			last_token := E_STRING
			if text_count > 1 then
				eif_buffer.append_string (text_substring (1, text_count - 1))
			end
			str_ := string_.make (eif_buffer.count)
			str_.append_string (eif_buffer)
			eif_buffer.wipe_out
			last_value := str_
			set_start_condition (INITIAL)
		}
<IN_STR>.					|
<IN_STR>%\n[ \t\r]*			|
<IN_STR>%\/([0-9]+(\/)?)?	|
<IN_STR><<EOF>>			{	-- Catch-all rules (no backing up)
							last_token := E_STRERR
							set_start_condition (INITIAL)
						}



		--/** Eiffel bits **/

[0-1]+[bB]					last_token := E_BIT; last_value := text
[bB][iI][tT][ \t]+[0-9]+	last_token := E_BITTYPE; last_value := text
[bB][iI][tT][ \t]+			{
								last_token := E_IDENTIFIER
								last_value := text_substring (1, 3)
							}



		--/** Eiffel integers **/

[0-9]+				{
						last_token := E_INTEGER
						last_value := text.to_integer
					}
[0-9]{1,3}(_[0-9]{3})+	{
						last_token := E_INTEGER
						str_ := text
						nb_ := text_count
						from i_ := 1 until i_ > nb_ loop
							char_ := str_.item (i_)
							if char_ /= '_' then
								eif_buffer.append_character (char_)
							end 
							i_ := i_ + 1
						end
						last_value := eif_buffer.to_integer
						eif_buffer.wipe_out
					}
[0-9_]+				last_token := E_INTERR	-- Catch-all rule (no backing up)



		--/** Eiffel reals **/

[0-9]+\./[^.0-9]					|
[0-9]+\.[0-9]*[eE][+-]?[0-9]+		|
[0-9]*\.[0-9]+([eE][+-]?[0-9]+)?	{
						last_token := E_REAL
						last_value := text.to_double
					}
[0-9]{1,3}(_[0-9]{3})+\./[^.0-9]									|
[0-9]{1,3}(_[0-9]{3})*\.([0-9]{1,3}(_[0-9]{3})*)?[eE][+-]?[0-9]{1,3}(_[0-9]{3})*	|
([0-9]{1,3}(_[0-9]{3})*)?\.[0-9]{1,3}(_[0-9]{3})*([eE][+-]?[0-9]{1,3}(_[0-9]{3})*)?	{
						last_token := E_REAL
						str_ := text
						nb_ := text_count
						from i_ := 1 until i_ > nb_ loop
							char_ := str_.item (i_)
							if char_ /= '_' then
								eif_buffer.append_character (char_)
							end
							i_ := i_ + 1
						end
						last_value := eif_buffer.to_double
						eif_buffer.wipe_out
					}
[0-9_]+/\.								|
[0-9_]+\.[0-9_]*[eE][+-]?[0-9_]*		|
[0-9_]*\.[0-9_]+([eE][+-]?[0-9_]*)?	{	-- Catch-all rules (no backing up)
						last_token := E_REALERR
					}



<<EOF>>			terminate
.				last_token := E_UNKNOWN

%%

feature {NONE} -- Local variables

	i_, nb_: INTEGER
	char_: CHARACTER
	str_: STRING
	code_: INTEGER

feature {NONE} -- Initialization

	make is
			-- Create a new Eiffel scanner.
		do
			make_compressed_scanner_skeleton
			eif_buffer := string_.make (Init_buffer_size)
			eif_lineno := 1
		end

	execute is
			-- Analyze Eiffel files `arguments (1..argument_count)'.
		local
			j, n: INTEGER
			a_filename: STRING
			a_file: like INPUT_STREAM_TYPE
		do
			make
			n := argument_count
			if n = 0 then
				std.error.put_string ("usage: eiffel_scanner filename ...%N")
				exceptions_.die (1)
			else
				from j := 1 until j > n loop
					a_filename := argument (j)
					a_file := input_stream_.make_file_open_read (a_filename)
					if input_stream_.is_open_read (a_file) then
						set_input_buffer (new_file_buffer (a_file))
						scan
						input_stream_.close (a_file)
					else
						std.error.put_string ("eiffel_scanner: cannot read %'")
						std.error.put_string (a_filename)
						std.error.put_string ("%'%N")
					end
					j := j + 1
				end
			end
		end

	benchmark is
			-- Analyze Eiffel file `argument (2)' `argument (1)' times.
		local
			j, n: INTEGER
			a_filename: STRING
			a_file: like INPUT_STREAM_TYPE
		do
			make
			if
				argument_count < 2 or else
				not string_.is_integer (argument (1))
			then
				std.error.put_string ("usage: eiffel_scanner nb filename%N")
				exceptions_.die (1)
			else
				n := argument (1).to_integer
				a_filename := argument (2)
				from j := 1 until j > n loop
					a_file := input_stream_.make_file_open_read (a_filename)
					if input_stream_.is_open_read (a_file) then
						set_input_buffer (new_file_buffer (a_file))
						scan
						input_stream_.close (a_file)
					else
						std.error.put_string ("eiffel_scanner: cannot read %'")
						std.error.put_string (a_filename)
						std.error.put_string ("%'%N")
						exceptions_.die (1)
					end
					j := j + 1
				end
			end
		end

feature -- Initialization

	reset is
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			eif_lineno := 1
			eif_buffer.wipe_out
		end

feature -- Access

	last_value: ANY
			-- Semantic value to be passed to the parser

	eif_buffer: STRING
			-- Buffer for lexial tokens

	eif_lineno: INTEGER
			-- Current line number

	is_operator: BOOLEAN
			-- Parsing an operator declaration?

feature {NONE} -- Processing

	process_operator (op: INTEGER): INTEGER is
			-- Process current token as operator `op' or as
			-- an Eiffel string depending on the context
		require
			text_count_large_enough: text_count > 2
		do
			if is_operator then
				Result := op
			else
				Result := E_STRING
				last_value := text_substring (2, text_count - 1)
			end
		end

feature {NONE} -- Constants

	Init_buffer_size: INTEGER is 256
				-- Initial size for `eif_buffer'

invariant

	eif_buffer_not_void: eif_buffer /= Void

end -- class EIFFEL_SCANNER
