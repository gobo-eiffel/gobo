indexing

	description:

		"Scanners for regular expressions";

	library:    "Gobo Eiffel Lexical Library";
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

class LX_REGEXP_SCANNER

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton
		end

	LX_DESCRIPTION
		rename
			make as make_description,
			make_from_description as make_description_from_description,
			reset as reset_description
		end
		
	LX_REGEXP_TOKENS
		export
			{NONE} all
		end

	UT_CHARACTER_CODES
		export
			{NONE} all
		end

creation

	make, make_from_description

feature {NONE} -- Implementation

	yy_build_tables is
			-- Build scanner tables.
		do
			yy_nxt := yy_nxt_
			yy_chk := yy_chk_
			yy_base := yy_base_
			yy_def := yy_def_
			yy_ec := yy_ec_
			yy_meta := yy_meta_
			yy_accept := yy_accept_
		end

	yy_do_action (yy_act: INTEGER) is
			-- Execute semantic action.
		do
			inspect yy_act
when 1 then
--|#line 59

					last_token := Caret_code
					set_start_condition (REGEXP)
				
when 2 then
--|#line 63

					less (0)
					set_start_condition (REGEXP)
				
when 3 then
--|#line 70

					last_token := Double_quote_code
					set_start_condition (QUOTE)
				
when 4 then
	yy_position := yy_position - 1
--|#line 74
last_token := Dollar_code
when 5 then
--|#line 75

					last_token := Left_brace_code
					set_start_condition (NUM)
				
when 6 then
--|#line 79

					last_string := text
					if character_classes.has (last_string) then
						last_token := CCL_OP
						last_value := character_classes.item (last_string)
					else
						last_token := Left_bracket_code
						last_value := last_string
						less (1)
						set_start_condition (FIRSTCCL)
					end
					last_string := Void
				
when 7 then
--|#line 92
last_token := text_item (1).code
when 8 then
--|#line 93

					last_token := CHAR
					process_character (text_item (1).code)
				
when 9 then
--|#line 100
-- Separator.
when 10 then
--|#line 101

					last_token := NUMBER
					check is_integer: text.is_integer end
					last_value := text.to_integer
				
when 11 then
--|#line 106
last_token := Comma_code
when 12 then
--|#line 107

					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 13 then
--|#line 111

					error_handler.bad_character_in_brackets (filename, line_nb)
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 14 then
--|#line 116

					error_handler.missing_bracket (filename, line_nb)
					line_nb := line_nb + 1
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 15 then
--|#line 125

					process_character (text_item (1).code)
					last_token := CHAR
				
when 16 then
--|#line 129

					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
when 17 then
--|#line 133

					error_handler.missing_quote (filename, line_nb)
					line_nb := line_nb + 1
					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
when 18 then
--|#line 141

					last_token := CHAR
					process_escaped_character
					if start_condition = FIRSTCCL then
						set_start_condition (CCL)
					end
				
when 19 then
	yy_position := yy_position - 1
--|#line 150

					set_start_condition (CCL)
					last_token := Caret_code
				
when 20 then
	yy_position := yy_position - 1
--|#line 154
last_token := Caret_code
when 21 then
--|#line 155

					last_token := CHAR
					process_character (text_item (1).code)
					set_start_condition (CCL)
				
when 22 then
--|#line 160

					error_handler.bad_character_class (filename, line_nb)
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 23 then
	yy_position := yy_position - 1
--|#line 169
last_token := Minus_code
when 24 then
--|#line 170

					last_token := CHAR
					process_character (text_item (1).code)
				
when 25 then
--|#line 174

					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 26 then
--|#line 178

					error_handler.bad_character_class (filename, line_nb)
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 27 then
--|#line 186

					if text_item (1) = '%N' then
						error_handler.bad_character ("%%N", filename, line_nb)
						line_nb := line_nb + 1
					else
						error_handler.bad_character (text, filename, line_nb)
					end
				
when 28 then
--|#line 195
fatal_error ("scanner jammed")
			else
				fatal_error ("fatal scanner internal error: no action found")
			end
		end

	yy_do_eof_action (yy_sc: INTEGER) is
			-- Execute EOF semantic action.
		do
			inspect yy_sc
			else
				terminate
			end
		end

feature {NONE} -- Tables

	yy_nxt_: ARRAY [INTEGER] is
		once
			!YY_ARRAY [INTEGER]! Result.make_from_array (<<
			    0,   66,   66,   15,   15,   51,   51,   45,   55,   44,
			   44,   46,   46,   49,   47,   47,   16,   16,   18,   19,
			   49,   46,   45,   20,   47,   21,   21,   46,   44,   44,
			   47,   56,   57,   54,   22,   18,   19,   43,   58,   53,
			   20,   59,   21,   21,   60,   56,   57,   61,   56,   57,
			   43,   22,   24,   25,   56,   57,   56,   57,   66,   66,
			   66,   66,   66,   26,   24,   25,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   26,   28,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   29,   66,   30,
			   28,   66,   66,   66,   66,   66,   66,   66,   66,   66,

			   66,   29,   66,   30,   32,   66,   66,   66,   66,   33,
			   66,   66,   66,   66,   66,   34,   35,   32,   66,   66,
			   66,   66,   33,   66,   66,   66,   66,   66,   34,   35,
			   15,   37,   38,   39,   66,   66,   66,   66,   66,   66,
			   40,   41,   66,   66,   42,   15,   37,   38,   39,   66,
			   66,   66,   66,   66,   66,   40,   41,   66,   66,   42,
			   62,   66,   66,   66,   66,   56,   57,   63,   63,   63,
			   66,   66,   56,   57,   64,   66,   66,   66,   66,   56,
			   57,   65,   65,   65,   14,   14,   14,   14,   17,   17,
			   17,   17,   23,   23,   23,   23,   27,   27,   27,   27,

			   31,   31,   31,   31,   36,   36,   36,   36,   45,   66,
			   45,   45,   48,   48,   48,   48,   50,   50,   50,   52,
			   66,   52,   52,   13,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66>>, 0)
		end

	yy_chk_: ARRAY [INTEGER] is
		once
			!YY_ARRAY [INTEGER]! Result.make_from_array (<<
			    0,    0,    0,    1,    2,   38,   38,   78,   77,   21,
			   21,   26,   29,   30,   26,   29,    1,    2,    3,    3,
			   30,   34,   54,    3,   34,    3,    3,   41,   44,   44,
			   41,   52,   52,   46,    3,    4,    4,   43,   53,   40,
			    4,   53,    4,    4,   56,   62,   62,   56,   63,   63,
			   18,    4,    5,    5,   64,   64,   65,   65,   13,    0,
			    0,    0,    0,    5,    6,    6,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    6,    7,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    7,    0,    7,
			    8,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    8,    0,    8,    9,    0,    0,    0,    0,    9,
			    0,    0,    0,    0,    0,    9,    9,   10,    0,    0,
			    0,    0,   10,    0,    0,    0,    0,    0,   10,   10,
			   11,   11,   11,   11,    0,    0,    0,    0,    0,    0,
			   11,   11,    0,    0,   11,   12,   12,   12,   12,    0,
			    0,    0,    0,    0,    0,   12,   12,    0,    0,   12,
			   58,    0,    0,    0,    0,   58,   58,   59,   59,   59,
			    0,    0,   59,   59,   60,    0,    0,    0,    0,   60,
			   60,   61,   61,   61,   67,   67,   67,   67,   68,   68,
			   68,   68,   69,   69,   69,   69,   70,   70,   70,   70,

			   71,   71,   71,   71,   72,   72,   72,   72,   73,    0,
			   73,   73,   74,   74,   74,   74,   75,   75,   75,   76,
			    0,   76,   76,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66>>, 0)
		end

	yy_base_: ARRAY [INTEGER] is
		once
			!YY_ARRAY [INTEGER]! Result.make_from_array (<<
			    0,    0,    1,   16,   33,   49,   61,   73,   87,  101,
			  114,  127,  142,   58,  223,  223,  223,  223,   48,  223,
			  223,    0,  223,  223,  223,  223,    2,  223,  223,    3,
			    5,  223,  223,    0,   12,  223,  223,  223,    3,  223,
			   25,   18,  223,   35,   19,  223,   24,    0,  223,  223,
			  223,  223,   17,   29,   13,    0,   35,  223,  151,  158,
			  165,  172,   31,   34,   40,   42,  223,  183,  187,  191,
			  195,  199,  203,  207,  211,  215,  218,    5,    4>>, 0)
		end

	yy_def_: ARRAY [INTEGER] is
		once
			!YY_ARRAY [INTEGER]! Result.make_from_array (<<
			    0,   67,   67,   68,   68,   69,   69,   70,   70,   71,
			   71,   72,   72,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   73,   66,   66,   73,
			   74,   66,   66,   75,   73,   66,   66,   66,   66,   66,
			   76,   73,   66,   66,   66,   66,   66,   77,   66,   66,
			   66,   66,   76,   76,   66,   78,   76,   66,   76,   76,
			   76,   59,   76,   76,   76,   76,    0,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66>>, 0)
		end

	yy_ec_: ARRAY [INTEGER] is
		once
			!YY_ARRAY [INTEGER]! Result.make_from_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    1,    4,    1,    5,    1,    1,    1,
			    6,    6,    6,    6,    7,    8,    6,    6,    9,    9,
			    9,    9,    9,    9,    9,    9,   10,   10,    1,    1,
			    1,    1,    1,    6,    1,   11,   11,   11,   11,   11,
			   11,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,   12,    1,
			    1,   13,   14,   15,   16,    1,    1,   11,   11,   11,

			   11,   11,   11,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			   12,    1,    1,   17,    6,   18,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1>>, 0)
		end

	yy_meta_: ARRAY [INTEGER] is
		once
			!YY_ARRAY [INTEGER]! Result.make_from_array (<<
			    0,    1,    1,    2,    1,    1,    1,    1,    1,    3,
			    3,    3,    1,    1,    1,    4,    1,    1,    1>>, 0)
		end

	yy_accept_: ARRAY [INTEGER] is
		once
			!YY_ARRAY [INTEGER]! Result.make_from_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   29,    2,   27,    1,   13,    9,   14,
			   11,   10,   12,   15,   17,   16,   15,   21,   22,   21,
			   21,   24,   26,   24,   24,   25,    8,    3,    8,    7,
			    8,    8,    5,    9,   10,   18,   18,   18,   19,   20,
			   23,    4,    0,    0,   18,   18,    0,    6,    0,    0,
			    0,    0,    0,    0,    0,    0,    0>>, 0)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 223
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 66
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 67
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER is 1
			-- Equivalence code for NULL character

	yyReject_used: BOOLEAN is false
			-- Is `reject' called?

	yyVariable_trail_context: BOOLEAN is false
			-- Is there a regular expression with
			-- both leading and trailing parts having
			-- variable length?

	yyReject_or_variable_trail_context: BOOLEAN is false
			-- Is `reject' called or is there a
			-- regular expression with both leading
			-- and trailing parts having variable length?

	yyEnd_of_buffer: INTEGER is 29
			-- End of buffer rule code

	INITIAL: INTEGER is 0
	NUM: INTEGER is 1
	QUOTE: INTEGER is 2
	FIRSTCCL: INTEGER is 3
	CCL: INTEGER is 4
	REGEXP: INTEGER is 5
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Initialization

	make (handler: like error_handler) is
			-- Create a new regular expression scanner.
		require
			handler_not_void: handler /= Void
		do
			make_description
			make_compressed_scanner_skeleton
			error_handler := handler
			!! character_classes.make (Initial_max_character_classes)
			line_nb := 1
		ensure
			error_handler_set: error_handler = handler
		end

	make_from_description
		(a_description: LX_DESCRIPTION; handler: like error_handler) is
			-- Create a new regular expression scanner and
			-- initialize it with `a_description'.
		require
			a_description_not_void: a_description /= Void
			handler_not_void: handler /= Void
		do
			from_description (a_description)
			make_compressed_scanner_skeleton
			error_handler := handler
			!! character_classes.make (Initial_max_character_classes)
			line_nb := 1
		ensure
			error_handler_set: error_handler = handler
		end

feature -- Initialization

	reset is
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			reset_description
			character_classes.wipe_out
			line_nb := 1
		end

feature -- Access

	error_handler: LX_LEX_ERROR_HANDLER
			-- Error handler

	line_nb: INTEGER
			-- Current line number

	filename: STRING is
			-- Name of file being parsed
		local
			file_buffer: YY_FILE_BUFFER
		do
			file_buffer ?= input_buffer
			if file_buffer /= Void then
				Result := file_buffer.file.name
			else
				Result := "string"
			end
		ensure
			filename_not_void: Result /= Void
		end

	last_value: ANY
			-- Semantic value to be passed to the parser

	rule: LX_RULE
			-- Rule being analyzed

	character_classes: DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING]
			-- Character classes declared so far

feature -- Setting

	set_error_handler (handler: like error_handler) is
			-- Set `error_handler' to `handler'.
		require
			handler_not_void: handler /= Void
		do
			error_handler := handler
		ensure
			error_handler_set: error_handler = handler
		end

feature {NONE} -- Implementation

	last_string: STRING
			-- Last string which has been read

	process_character (a_code: INTEGER) is
			-- Check whether `a_code' is a valid code for character
			-- whose printable representation is held in `text'.
			-- Set `last_value' accordingly.
		do
			if a_code < characters_count then
				last_value := a_code
			else
				error_handler.character_out_of_range (text, filename, line_nb)
				last_value := 0
			end
		end

	process_escaped_character is
			-- Process escaped character whose printable representation
			-- is held in `text'. Check whether the corresponding 
			-- character is not out of range. Set `last_value' accordingly.
		require
			-- valid_text: `text' recognized by \\(.|[0-7]{1,3}|x[0-9a-f]{1,2})
		local
			c: CHARACTER
			a_code: INTEGER
			i, nb: INTEGER
		do
			c := text_item (2)
			inspect c
			when 'b' then
				a_code := Back_space_code
			when 'f' then
				a_code := Form_feed_code
			when 'n' then
				a_code := New_line_code
			when 'r' then
				a_code := Carriage_return_code
			when 't' then
				a_code := Tabulation_code
			when 'a' then
				a_code := 7
			when 'v' then
				a_code := 13
			when '0'..'7' then
					-- Octal.
				nb := text_count
				a_code := 0
				from i := 2 until i > nb loop
					a_code := a_code * 8 + text_item (i).code - Zero_code
					i := i + 1
				end
			when 'x', 'X' then
				nb := text_count
				if nb = 2 then
					a_code := c.code
				else
						-- Hexadecimal.
					a_code := 0
					from i := 3 until i > nb loop
					a_code := a_code * 16
						c := text_item (i)
						inspect c
						when '0'..'9' then
							a_code := a_code + c.code - Zero_code
						when 'a'..'z' then
							a_code := a_code + c.code - Lower_a_code + 10
						when 'A'..'Z' then
							a_code := a_code + c.code - Upper_a_code + 10
						end
						i := i + 1
					end
				end
			else
				a_code := c.code
			end
			process_character (a_code)
		end

feature {NONE} -- Constants

	Initial_max_character_classes: INTEGER is 101
			-- Maximum number of character classes

invariant

	error_handler_not_void: error_handler /= Void
	character_classes_not_void: character_classes /= Void
	no_void_character_class: not character_classes.has_item (Void)

end -- class LX_REGEXP_SCANNER
