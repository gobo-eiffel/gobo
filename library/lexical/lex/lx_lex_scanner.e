indexing

	description:

		"Scanners for lexical analyzer generators such as 'gelex'"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_LEX_SCANNER

inherit

	LX_LEX_SCANNER_SKELETON
		
	LX_LEX_TOKENS
		export
			{NONE} all
		end

creation

	make, make_from_description

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN is
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= EIFFEL_BLOCK2)
		end

feature {NONE} -- Implementation

	yy_build_tables is
			-- Build scanner tables.
		do
			yy_nxt ?= yy_nxt_template
			yy_chk ?= yy_chk_template
			yy_base ?= yy_base_template
			yy_def ?= yy_def_template
			yy_ec ?= yy_ec_template
			yy_meta ?= yy_meta_template
			yy_accept ?= yy_accept_template
		end

	yy_execute_action (yy_act: INTEGER) is
			-- Execute semantic action.
		do
if yy_act <= 54 then
if yy_act <= 27 then
if yy_act <= 14 then
if yy_act <= 7 then
if yy_act <= 4 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 52
-- Separator or comment.
else
--|#line 53
line_nb := line_nb + 1
end
else
if yy_act = 3 then
--|#line 54

					line_nb := line_nb + 1
					set_start_condition (EIFFEL_BLOCK)
				
else
--|#line 58
set_start_condition (SCNAME)
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 59
set_start_condition (XSCNAME)
else
--|#line 60
set_start_condition (OPTION)
end
else
--|#line 61

						-- Keep track of the definition name.
					last_string := text
					set_start_condition (DEFINITION)
				
end
end
else
if yy_act <= 11 then
if yy_act <= 9 then
if yy_act = 8 then
--|#line 66

					last_token := ENDSECT
					set_start_condition (SECT2)
				
else
--|#line 70

					report_unrecognized_directive_error
					set_start_condition (RECOVER1)
				
end
else
if yy_act = 10 then
--|#line 74

					report_directive_expected_error
					set_start_condition (RECOVER1)
				
else
--|#line 81
more
end
end
else
if yy_act <= 13 then
if yy_act = 12 then
--|#line 82
more
else
--|#line 83
more
end
else
--|#line 84
more
end
end
end
else
if yy_act <= 21 then
if yy_act <= 18 then
if yy_act <= 16 then
if yy_act = 15 then
--|#line 85
more
else
--|#line 86

					last_string := text_substring (1, text_count - 2)
					line_nb := line_nb + last_string.occurrences ('%N')
					eiffel_header.force_last (last_string)
					set_start_condition (INITIAL)
				
end
else
if yy_act = 17 then
--|#line 95
-- Separator or comment.
else
--|#line 96
add_new_start_condition (text, start_condition = XSCNAME)
end
end
else
if yy_act <= 20 then
if yy_act = 19 then
--|#line 97

					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
else
--|#line 101

					report_start_condition_expected_error
					set_start_condition (RECOVER1)
				
end
else
--|#line 108
-- Separator or comment.
end
end
else
if yy_act <= 24 then
if yy_act <= 23 then
if yy_act = 22 then
--|#line 109
backing_up_report := True
else
--|#line 110
backing_up_report := False
end
else
--|#line 111

					case_insensitive := False
				
end
else
if yy_act <= 26 then
if yy_act = 25 then
--|#line 114

					case_insensitive := True
				
else
--|#line 117
debug_mode := True
end
else
--|#line 118
debug_mode := False
end
end
end
end
else
if yy_act <= 41 then
if yy_act <= 34 then
if yy_act <= 31 then
if yy_act <= 29 then
if yy_act = 28 then
--|#line 119
no_default_rule := False
else
--|#line 120
no_default_rule := True
end
else
if yy_act = 30 then
--|#line 121
equiv_classes_used := True
else
--|#line 122
equiv_classes_used := False
end
end
else
if yy_act <= 33 then
if yy_act = 32 then
--|#line 123
full_table := True
else
--|#line 124
full_table := False
end
else
--|#line 125
meta_equiv_classes_used := True
end
end
else
if yy_act <= 38 then
if yy_act <= 36 then
if yy_act = 35 then
--|#line 126
meta_equiv_classes_used := False
else
--|#line 127
reject_used := True
end
else
if yy_act = 37 then
--|#line 128
reject_used := False
else
--|#line 129
user_action_used := True
end
end
else
if yy_act <= 40 then
if yy_act = 39 then
--|#line 130
user_action_used := False
else
--|#line 131

					no_warning := False
				
end
else
--|#line 134

					no_warning := True
				
end
end
end
else
if yy_act <= 48 then
if yy_act <= 45 then
if yy_act <= 43 then
if yy_act = 42 then
--|#line 138
set_start_condition (OUTFILE)
else
--|#line 148

					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
end
else
if yy_act = 44 then
--|#line 152

					report_unrecognized_option_error (text)
					set_start_condition (RECOVER1)
			
else
--|#line 159

					output_filename := text_substring (2, text_count - 1)
					set_start_condition (OPTION)
				
end
end
else
if yy_act <= 47 then
if yy_act = 46 then
--|#line 163

					output_filename := Void
					report_missing_quote_error
					set_start_condition (RECOVER1)
				
else
--|#line 171
-- Separates name and definition.
end
else
--|#line 172

					check last_string_not_void: last_string /= Void end
					process_name_definition (last_string, text)
					set_start_condition (INITIAL)
				
end
end
else
if yy_act <= 51 then
if yy_act <= 50 then
if yy_act = 49 then
--|#line 177

					line_nb := line_nb + 1
					report_incomplete_name_definition_error
					set_start_condition (INITIAL)
				
else
--|#line 185

						-- Eat characters to end of line.
					set_start_condition (INITIAL)
				
end
else
--|#line 189

						-- Eat characters to end of line.
					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
end
else
if yy_act <= 53 then
if yy_act = 52 then
--|#line 202
-- Separator or comment.
else
--|#line 203
line_nb := line_nb + 1
end
else
--|#line 204

					last_token := ENDSECT
					set_start_condition (SECT3)
				
end
end
end
end
end
else
if yy_act <= 81 then
if yy_act <= 68 then
if yy_act <= 61 then
if yy_act <= 58 then
if yy_act <= 56 then
if yy_act = 55 then
--|#line 208

					last_token := Caret_code
						-- The line number is set when creating the rule,
						-- but it often gets the wrong number because
						-- it is done after the corresponding action has
						-- be scanned.
					rule_line_nb := line_nb
					set_start_condition (REGEXP)
				
else
--|#line 217
last_token := Left_brace_code
end
else
if yy_act = 57 then
--|#line 218
last_token := Right_brace_code
else
--|#line 219

					last_token := Less_than_code
					set_start_condition (SCOND)
				
end
end
else
if yy_act <= 60 then
if yy_act = 59 then
--|#line 223

					less (0)
						-- The line number is set when creating the rule,
						-- but it often gets the wrong number because
						-- it is done after the corresponding action has
						-- be scanned.
					rule_line_nb := line_nb
					set_start_condition (REGEXP)
				
else
--|#line 235

					last_token := Double_quote_code
					set_start_condition (QUOTE)
				
end
else
	yy_position := yy_position - 1
--|#line 239
last_token := Dollar_code
end
end
else
if yy_act <= 65 then
if yy_act <= 63 then
if yy_act = 62 then
--|#line 240

					last_string := STRING_.to_lower (text)
					if name_definitions.has (last_string) then
						put_back_string (name_definitions.item (last_string))
					else
						report_undefined_definition_error (text)
					end
				
else
--|#line 248

					last_token := Left_brace_code
					set_start_condition (NUM)
				
end
else
if yy_act = 64 then
--|#line 252

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
				
else
--|#line 264
last_token := EOF_OP
end
end
else
if yy_act <= 67 then
if yy_act = 66 then
--|#line 265
last_token := text_item (1).code
else
--|#line 266

					set_start_condition (ACTION_TEXT)
				
end
else
--|#line 269

					line_nb := line_nb + 1
					last_token := EMPTY
					set_start_condition (SECT2)
				
end
end
end
else
if yy_act <= 75 then
if yy_act <= 72 then
if yy_act <= 70 then
if yy_act = 69 then
--|#line 274

					last_token := CHAR
					process_character (text_item (1).code)
				
else
--|#line 281
-- Separator or comment.
end
else
if yy_act = 71 then
--|#line 282
line_nb := line_nb + 1
else
--|#line 283
last_token := Comma_code
end
end
else
if yy_act <= 74 then
if yy_act = 73 then
--|#line 284
last_token := Star_code
else
--|#line 285

					last_token := Greater_than_code
					set_start_condition (SECT2)
				
end
else
--|#line 289

					last_token := NAME
					last_value := text
				
end
end
else
if yy_act <= 78 then
if yy_act <= 77 then
if yy_act = 76 then
--|#line 293

					report_bad_start_condition_error (text)
				
else
--|#line 299
-- Separator.
end
else
--|#line 300

					last_token := NUMBER
					check is_integer: STRING_.is_integer (text) end
					last_value := text.to_integer
				
end
else
if yy_act <= 80 then
if yy_act = 79 then
--|#line 305
last_token := Comma_code
else
--|#line 306

					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
end
else
--|#line 310

					report_bad_character_in_brackets_error
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
end
end
end
end
else
if yy_act <= 95 then
if yy_act <= 88 then
if yy_act <= 85 then
if yy_act <= 83 then
if yy_act = 82 then
--|#line 315

					report_missing_bracket_error
					line_nb := line_nb + 1
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
else
--|#line 324

					process_character (text_item (1).code)
					last_token := CHAR
				
end
else
if yy_act = 84 then
--|#line 328

					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
else
--|#line 332

					report_missing_quote_error
					line_nb := line_nb + 1
					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
end
end
else
if yy_act <= 87 then
if yy_act = 86 then
--|#line 340

					last_token := CHAR
					process_escaped_character
					if start_condition = FIRSTCCL then
						set_start_condition (CCL)
					end
				
else
	yy_position := yy_position - 1
--|#line 349

					set_start_condition (CCL)
					last_token := Caret_code
				
end
else
	yy_position := yy_position - 1
--|#line 353
last_token := Caret_code
end
end
else
if yy_act <= 92 then
if yy_act <= 90 then
if yy_act = 89 then
--|#line 354

					last_token := CHAR
					process_character (text_item (1).code)
					set_start_condition (CCL)
				
else
--|#line 359

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
end
else
if yy_act = 91 then
	yy_position := yy_position - 1
--|#line 368
last_token := Minus_code
else
--|#line 369

					last_token := CHAR
					process_character (text_item (1).code)
				
end
end
else
if yy_act <= 94 then
if yy_act = 93 then
--|#line 373

					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
else
--|#line 377

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
end
else
--|#line 386

					last_token := PIPED
					set_start_condition (SECT2)
				
end
end
end
else
if yy_act <= 102 then
if yy_act <= 99 then
if yy_act <= 97 then
if yy_act = 96 then
--|#line 390

					last_token := EMPTY
					line_nb := line_nb + 1
					set_start_condition (SECT2)
				
else
--|#line 395
set_start_condition (EIFFEL_BLOCK2)
end
else
if yy_act = 98 then
--|#line 396

					last_token := EIF_CODE
					last_value := text
					set_start_condition (SECT2)
				
else
--|#line 404
more
end
end
else
if yy_act <= 101 then
if yy_act = 100 then
--|#line 405
more
else
--|#line 406
more
end
else
--|#line 407
more
end
end
else
if yy_act <= 105 then
if yy_act <= 104 then
if yy_act = 103 then
--|#line 408
more
else
--|#line 409

					nb_open_brackets := nb_open_brackets + 1
					more
				
end
else
--|#line 413

					if nb_open_brackets = 0 then
						last_token := EIF_CODE
						last_string := text_substring (1, text_count - 1)
						line_nb := line_nb + last_string.occurrences ('%N')
						last_value := last_string
						set_start_condition (SECT2)
					else
						nb_open_brackets := nb_open_brackets - 1
						more
					end
				
end
else
if yy_act <= 107 then
if yy_act = 106 then
--|#line 431

					last_token := EIF_CODE
					last_value := text
				
else
--|#line 436

					if text_item (1) = '%N' then
						report_bad_character_error ("%%N")
						line_nb := line_nb + 1
					else
						report_bad_character_error (text)
					end
				
end
else
--|#line 0
last_token := yyError_token
fatal_error ("scanner jammed")
end
end
end
end
end
end
			yy_set_beginning_of_line
		end

	yy_execute_eof_action (yy_sc: INTEGER) is
			-- Execute EOF semantic action.
		do
			inspect yy_sc
			else
				terminate
			end
		end

feature {NONE} -- Table templates

	yy_nxt_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,  394,   39,   40,   39,  119,  119,  120,  120,  137,
			  394,  137,   41,   38,   39,   40,   39,   38,   38,   42,
			   38,   38,   38,   38,   41,   38,   38,   38,   38,   38,
			   38,   43,   43,   43,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   38,   38,   38,   38,   38,   38,
			   38,   38,   45,   46,   45,  146,   55,  146,   56,   57,
			  180,  180,   47,   58,  102,   55,   48,   59,   57,   84,
			   85,   84,   58,  110,   84,   85,   84,   90,   86,   91,
			  102,   87,   87,   86,  182,  182,   87,   87,   90,  154,

			   91,  155,  160,  214,  160,   49,  110,   50,  309,   51,
			   45,   46,   45,  215,  176,   52,  176,  310,  103,  104,
			   47,  183,  183,  111,   48,  112,   88,   92,  179,  221,
			  179,   88,  156,  222,  103,  104,  385,  217,   92,  106,
			  107,  106,  106,  107,  106,  184,  111,  184,  112,  108,
			  180,  180,  108,   49,  190,   50,  190,   51,   60,   61,
			   62,   61,   60,   60,   60,   60,   60,   60,   60,   63,
			   60,   64,   64,   60,   60,   60,   64,   65,   66,   67,
			   68,   69,   64,   64,   64,   64,   64,   64,   70,   71,
			   72,   64,   73,   64,   64,   74,   64,   75,   64,   60,

			   60,   60,   60,   60,   60,   60,   60,   78,   79,   80,
			   79,   78,   78,   78,   78,   78,   78,   78,   81,   78,
			   78,   78,   78,   78,   78,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   78,   78,
			   78,   78,   78,   78,   78,   78,   93,   94,   95,   94,
			   93,   93,   93,   93,   93,   96,   97,   98,   93,   93,
			   93,   93,   93,   99,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,   93,   93,   93,

			   93,   93,   93,   93,   93,  114,  193,  114,  182,  197,
			  182,  197,  393,  205,  115,  206,  115,  132,  394,  137,
			  133,  137,  132,  391,  134,  133,  198,  198,  198,  134,
			  392,  394,  394,  243,  244,  183,  139,  183,  193,  146,
			  394,  146,  154,  391,  155,  116,  117,  116,  117,  122,
			  123,  122,  124,  125,  256,  256,  126,  126,  394,  135,
			  126,  136,  141,  127,  135,  142,  136,  210,  257,  257,
			  143,  394,  394,  144,  211,  144,  144,  149,  149,  160,
			  394,  160,  150,  212,  150,  176,  179,  176,  179,  128,
			  129,  184,  213,  184,  130,  126,  122,  123,  122,  124,

			  125,  245,  278,  126,  126,  248,  190,  126,  190,  149,
			  127,  197,  148,  197,  205,  249,  206,  207,  283,  283,
			  284,  284,  251,  153,  256,  256,  243,  244,  246,  279,
			  156,  257,  257,  390,  293,  389,  128,  129,  294,  243,
			  244,  130,  126,  218,  218,  388,  218,  218,  218,  218,
			  218,  218,  218,  218,  161,  218,  161,  161,  218,  218,
			  218,  161,  161,  161,  161,  161,  161,  161,  161,  161,
			  161,  161,  161,  161,  161,  161,  161,  161,  161,  161,
			  161,  161,  161,  161,  218,  218,  218,  218,  218,  218,
			  218,  218,  226,  227,  228,  229,  230,  202,  202,  394,

			  394,  243,  244,  231,  280,  394,  305,  232,  243,  244,
			  233,  387,  234,  204,  283,  283,  207,  284,  284,  285,
			  394,  240,  240,  240,  181,  181,  181,  394,  345,  202,
			  252,  307,  247,  243,  244,  243,  244,  346,  386,  394,
			  394,  281,  281,  385,  384,  394,  281,  281,  281,  281,
			  281,  281,  326,  149,  149,  149,  149,  149,  149,  149,
			  394,  383,  382,  381,  380,  379,  378,  394,  377,  376,
			  243,  244,  306,  306,  375,  374,  373,  306,  306,  306,
			  306,  306,  306,   38,   38,   38,   38,   38,   38,   38,
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   38,

			   38,   38,   38,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,

			   83,   83,   83,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  113,  113,  113,  113,  113,  113,  113,
			  113,  113,  113,  113,  113,  113,  113,  113,  113,  113,

			  113,  113,  113,  118,  118,  118,  118,  118,  118,  118,
			  118,  118,  118,  118,  118,  118,  118,  118,  118,  118,
			  118,  118,  118,  121,  121,  121,  121,  121,  121,  121,
			  121,  121,  121,  121,  121,  121,  121,  121,  121,  121,
			  121,  121,  121,  131,  131,  131,  131,  131,  131,  131,
			  131,  131,  131,  131,  131,  131,  131,  131,  131,  131,
			  131,  131,  131,  140,  372,  371,  370,  369,  140,  140,
			  140,  140,  140,  140,  140,  368,  367,  140,  145,  145,
			  145,  145,  145,  145,  145,  145,  145,  366,  145,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,

			  151,  151,  151,  151,  151,  151,  151,  151,  151,  152,
			  152,  152,  365,  364,  363,  362,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  153,
			  361,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  156,
			  360,  156,  156,  156,  359,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  162,
			  162,  162,  162,  162,  162,  162,  162,  162,  162,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  178,

			  178,  178,  178,  178,  178,  178,  178,  178,  358,  178,
			  181,  357,  181,  181,  181,  181,  181,  181,  181,  181,
			  181,  181,  181,  181,  181,  181,  181,  181,  181,  181,
			  186,  186,  186,  186,  186,  186,  186,  186,  186,  356,
			  186,  187,  355,  187,  187,  187,  187,  187,  187,  187,
			  187,  187,  187,  187,  187,  187,  187,  187,  187,  187,
			  187,  188,  354,  188,  188,  188,  188,  188,  188,  188,
			  188,  188,  188,  188,  188,  188,  188,  188,  188,  188,
			  188,  189,  353,  352,  189,  189,  189,  189,  189,  189,
			  189,  189,  189,  189,  189,  189,  189,  189,  189,  189,

			  189,  192,  192,  192,  192,  192,  192,  192,  192,  192,
			  192,  192,  192,  192,  192,  192,  192,  192,  192,  192,
			  192,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  351,  194,  194,
			  194,  195,  350,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  200,  349,  200,  200,  200,  200,  200,  200,  200,
			  200,  200,  200,  200,  200,  200,  200,  200,  200,  200,
			  200,  202,  202,  202,  202,  202,  202,  202,  203,  203,
			  203,  348,  203,  347,  344,  203,  203,  203,  203,  203,

			  203,  203,  203,  203,  203,  203,  204,  343,  204,  204,
			  204,  204,  204,  204,  204,  204,  204,  204,  204,  204,
			  204,  204,  204,  204,  204,  204,  207,  342,  207,  207,
			  207,  341,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  138,  340,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  147,  339,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  158,  338,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,

			  158,  158,  158,  158,  158,  158,  177,  337,  177,  177,
			  177,  177,  177,  177,  177,  177,  177,  177,  177,  177,
			  177,  177,  177,  177,  177,  177,  185,  336,  185,  185,
			  185,  185,  185,  185,  185,  185,  185,  185,  185,  185,
			  185,  185,  185,  185,  185,  185,  191,  335,  191,  191,
			  191,  191,  191,  191,  191,  191,  191,  191,  191,  191,
			  191,  191,  191,  191,  191,  191,  209,  334,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  218,  333,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,

			  218,  218,  218,  218,  218,  218,  241,  332,  241,  241,
			  241,  241,  241,  241,  241,  241,  241,  241,  241,  241,
			  241,  241,  241,  241,  241,  241,  253,  253,  253,  253,
			  253,  253,  253,  253,  253,  253,  253,  253,  253,  253,
			  253,  253,  253,  253,  253,  253,  254,  331,  254,  254,
			  254,  254,  254,  254,  254,  254,  254,  254,  254,  254,
			  254,  254,  254,  254,  254,  254,  330,  329,  328,  327,
			  325,  324,  323,  322,  321,  320,  319,  318,  317,  316,
			  315,  314,  313,  312,  311,  308,  204,  304,  303,  302,
			  301,  300,  299,  298,  297,  296,  295,  292,  291,  290,

			  289,  288,  287,  286,  153,  211,  282,  277,  181,  276,
			  275,  274,  273,  272,  271,  270,  269,  268,  267,  266,
			  265,  264,  263,  262,  261,  260,  259,  258,  255,  254,
			  253,  250,  242,  196,  241,  239,  175,  238,  237,  236,
			  235,  225,  224,  223,  220,  219,  216,  209,  208,  201,
			  199,  196,  191,  185,  177,  175,  173,  172,  171,  170,
			  169,  168,  167,  166,  165,  164,  163,  161,  159,  158,
			  157,  150,  148,  147,  138,  394,   77,   77,   37,  394,
			  394,  394,  394,  394,  394,  394,  394,  394,  394,  394,
			  394,  394,  394,  394,  394,  394,  394,  394,  394,  394,

			  394,  394,  394,  394,  394,  394,  394,  394,  394,  394,
			  394,  394,  394,  394,  394,  394,  394,  394,  394,  394,
			  394,  394,  394,  394,  394,  394,  394,  394>>)
		end

	yy_chk_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    1,    1,    1,   31,   32,   31,   32,   39,
			    0,   39,    1,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    3,    3,    3,   45,    7,   45,    7,    7,
			   87,   87,    3,    7,   23,    8,    3,    8,    8,   17,
			   17,   17,    8,   27,   18,   18,   18,   19,   17,   19,
			   24,   17,   17,   18,   92,  111,   18,   18,   20,   55,

			   20,   55,   61,  155,   61,    3,   28,    3,  287,    3,
			    4,    4,    4,  155,   79,    4,   79,  287,   23,   23,
			    4,   92,  111,   27,    4,   27,   17,   19,   84,  165,
			   84,   18,  157,  165,   24,   24,  393,  157,   20,   25,
			   25,   25,   26,   26,   26,   94,   28,   94,   28,   25,
			  180,  180,   26,    4,  106,    4,  106,    4,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,

			    9,    9,    9,    9,    9,    9,    9,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,

			   21,   21,   21,   21,   21,   29,  112,   30,  116,  122,
			  129,  122,  392,  132,   29,  132,   30,   35,  140,  137,
			   35,  137,   36,  390,   35,   36,  125,  125,  125,   36,
			  389,  142,  143,  200,  200,  116,   42,  129,  112,  146,
			  141,  146,  153,  388,  153,   29,   29,   30,   30,   33,
			   33,   33,   33,   33,  215,  215,   33,   33,  140,   35,
			   33,   35,   42,   33,   36,   42,   36,  141,  217,  217,
			   42,  142,  143,  144,  144,  144,   42,  149,  149,  160,
			  141,  160,  150,  144,  150,  176,  179,  176,  179,   33,
			   33,  184,  150,  184,   33,   33,   34,   34,   34,   34,

			   34,  201,  243,   34,   34,  206,  190,   34,  190,  149,
			   34,  197,  149,  197,  204,  206,  204,  208,  249,  249,
			  251,  251,  208,  256,  256,  256,  280,  280,  201,  243,
			  257,  257,  257,  387,  266,  386,   34,   34,  266,  281,
			  281,   34,   34,  161,  161,  384,  161,  161,  161,  161,
			  161,  161,  161,  161,  161,  161,  161,  161,  161,  161,
			  161,  161,  161,  161,  161,  161,  161,  161,  161,  161,
			  161,  161,  161,  161,  161,  161,  161,  161,  161,  161,
			  161,  161,  161,  161,  161,  161,  161,  161,  161,  161,
			  161,  161,  169,  169,  169,  169,  169,  202,  202,  252,

			  210,  305,  305,  169,  245,  285,  278,  169,  306,  306,
			  169,  382,  169,  283,  283,  283,  284,  284,  284,  252,
			  326,  436,  436,  436,  441,  441,  441,  307,  332,  202,
			  210,  285,  202,  245,  245,  278,  278,  332,  381,  252,
			  210,  246,  246,  380,  379,  285,  246,  246,  246,  246,
			  246,  246,  307,  411,  411,  411,  411,  411,  411,  411,
			  326,  378,  377,  376,  375,  374,  372,  307,  371,  370,
			  246,  246,  279,  279,  369,  368,  367,  279,  279,  279,
			  279,  279,  279,  395,  395,  395,  395,  395,  395,  395,
			  395,  395,  395,  395,  395,  395,  395,  395,  395,  395,

			  395,  395,  395,  396,  396,  396,  396,  396,  396,  396,
			  396,  396,  396,  396,  396,  396,  396,  396,  396,  396,
			  396,  396,  396,  397,  397,  397,  397,  397,  397,  397,
			  397,  397,  397,  397,  397,  397,  397,  397,  397,  397,
			  397,  397,  397,  398,  398,  398,  398,  398,  398,  398,
			  398,  398,  398,  398,  398,  398,  398,  398,  398,  398,
			  398,  398,  398,  399,  399,  399,  399,  399,  399,  399,
			  399,  399,  399,  399,  399,  399,  399,  399,  399,  399,
			  399,  399,  399,  400,  400,  400,  400,  400,  400,  400,
			  400,  400,  400,  400,  400,  400,  400,  400,  400,  400,

			  400,  400,  400,  401,  401,  401,  401,  401,  401,  401,
			  401,  401,  401,  401,  401,  401,  401,  401,  401,  401,
			  401,  401,  401,  402,  402,  402,  402,  402,  402,  402,
			  402,  402,  402,  402,  402,  402,  402,  402,  402,  402,
			  402,  402,  402,  403,  403,  403,  403,  403,  403,  403,
			  403,  403,  403,  403,  403,  403,  403,  403,  403,  403,
			  403,  403,  403,  404,  404,  404,  404,  404,  404,  404,
			  404,  404,  404,  404,  404,  404,  404,  404,  404,  404,
			  404,  404,  404,  405,  405,  405,  405,  405,  405,  405,
			  405,  405,  405,  405,  405,  405,  405,  405,  405,  405,

			  405,  405,  405,  406,  406,  406,  406,  406,  406,  406,
			  406,  406,  406,  406,  406,  406,  406,  406,  406,  406,
			  406,  406,  406,  407,  407,  407,  407,  407,  407,  407,
			  407,  407,  407,  407,  407,  407,  407,  407,  407,  407,
			  407,  407,  407,  408,  408,  408,  408,  408,  408,  408,
			  408,  408,  408,  408,  408,  408,  408,  408,  408,  408,
			  408,  408,  408,  409,  366,  364,  363,  362,  409,  409,
			  409,  409,  409,  409,  409,  361,  360,  409,  410,  410,
			  410,  410,  410,  410,  410,  410,  410,  359,  410,  412,
			  412,  412,  412,  412,  412,  412,  412,  412,  412,  412,

			  412,  412,  412,  412,  412,  412,  412,  412,  412,  413,
			  413,  413,  358,  356,  355,  354,  413,  413,  413,  413,
			  413,  413,  413,  413,  413,  413,  413,  413,  413,  414,
			  353,  414,  414,  414,  414,  414,  414,  414,  414,  414,
			  414,  414,  414,  414,  414,  414,  414,  414,  414,  415,
			  352,  415,  415,  415,  350,  415,  415,  415,  415,  415,
			  415,  415,  415,  415,  415,  415,  415,  415,  415,  416,
			  416,  416,  416,  416,  416,  416,  416,  416,  416,  417,
			  417,  417,  417,  417,  417,  417,  417,  417,  417,  417,
			  417,  417,  417,  417,  417,  417,  417,  417,  417,  418,

			  418,  418,  418,  418,  418,  418,  418,  418,  348,  418,
			  419,  347,  419,  419,  419,  419,  419,  419,  419,  419,
			  419,  419,  419,  419,  419,  419,  419,  419,  419,  419,
			  420,  420,  420,  420,  420,  420,  420,  420,  420,  346,
			  420,  421,  345,  421,  421,  421,  421,  421,  421,  421,
			  421,  421,  421,  421,  421,  421,  421,  421,  421,  421,
			  421,  422,  342,  422,  422,  422,  422,  422,  422,  422,
			  422,  422,  422,  422,  422,  422,  422,  422,  422,  422,
			  422,  423,  341,  339,  423,  423,  423,  423,  423,  423,
			  423,  423,  423,  423,  423,  423,  423,  423,  423,  423,

			  423,  424,  424,  424,  424,  424,  424,  424,  424,  424,
			  424,  424,  424,  424,  424,  424,  424,  424,  424,  424,
			  424,  425,  425,  425,  425,  425,  425,  425,  425,  425,
			  425,  425,  425,  425,  425,  425,  425,  338,  425,  425,
			  425,  426,  337,  426,  426,  426,  426,  426,  426,  426,
			  426,  426,  426,  426,  426,  426,  426,  426,  426,  426,
			  426,  427,  336,  427,  427,  427,  427,  427,  427,  427,
			  427,  427,  427,  427,  427,  427,  427,  427,  427,  427,
			  427,  428,  428,  428,  428,  428,  428,  428,  429,  429,
			  429,  335,  429,  334,  331,  429,  429,  429,  429,  429,

			  429,  429,  429,  429,  429,  429,  430,  330,  430,  430,
			  430,  430,  430,  430,  430,  430,  430,  430,  430,  430,
			  430,  430,  430,  430,  430,  430,  431,  328,  431,  431,
			  431,  327,  431,  431,  431,  431,  431,  431,  431,  431,
			  431,  431,  431,  431,  431,  431,  432,  325,  432,  432,
			  432,  432,  432,  432,  432,  432,  432,  432,  432,  432,
			  432,  432,  432,  432,  432,  432,  433,  324,  433,  433,
			  433,  433,  433,  433,  433,  433,  433,  433,  433,  433,
			  433,  433,  433,  433,  433,  433,  434,  322,  434,  434,
			  434,  434,  434,  434,  434,  434,  434,  434,  434,  434,

			  434,  434,  434,  434,  434,  434,  435,  320,  435,  435,
			  435,  435,  435,  435,  435,  435,  435,  435,  435,  435,
			  435,  435,  435,  435,  435,  435,  437,  319,  437,  437,
			  437,  437,  437,  437,  437,  437,  437,  437,  437,  437,
			  437,  437,  437,  437,  437,  437,  438,  318,  438,  438,
			  438,  438,  438,  438,  438,  438,  438,  438,  438,  438,
			  438,  438,  438,  438,  438,  438,  439,  316,  439,  439,
			  439,  439,  439,  439,  439,  439,  439,  439,  439,  439,
			  439,  439,  439,  439,  439,  439,  440,  315,  440,  440,
			  440,  440,  440,  440,  440,  440,  440,  440,  440,  440,

			  440,  440,  440,  440,  440,  440,  442,  314,  442,  442,
			  442,  442,  442,  442,  442,  442,  442,  442,  442,  442,
			  442,  442,  442,  442,  442,  442,  443,  443,  443,  443,
			  443,  443,  443,  443,  443,  443,  443,  443,  443,  443,
			  443,  443,  443,  443,  443,  443,  444,  313,  444,  444,
			  444,  444,  444,  444,  444,  444,  444,  444,  444,  444,
			  444,  444,  444,  444,  444,  444,  312,  311,  310,  309,
			  304,  303,  302,  301,  300,  299,  298,  297,  296,  294,
			  293,  292,  291,  290,  289,  286,  282,  277,  275,  274,
			  273,  272,  271,  270,  269,  268,  267,  265,  264,  263,

			  261,  260,  259,  258,  255,  253,  248,  242,  239,  238,
			  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,
			  227,  226,  225,  224,  222,  221,  220,  219,  214,  213,
			  212,  207,  199,  195,  191,  182,  174,  173,  172,  171,
			  170,  168,  167,  166,  164,  163,  156,  134,  133,  128,
			  127,  120,  108,   98,   81,   76,   75,   74,   73,   72,
			   71,   70,   69,   68,   67,   66,   65,   63,   59,   58,
			   57,   52,   48,   47,   41,   37,   12,   11,  394,  394,
			  394,  394,  394,  394,  394,  394,  394,  394,  394,  394,
			  394,  394,  394,  394,  394,  394,  394,  394,  394,  394,

			  394,  394,  394,  394,  394,  394,  394,  394,  394,  394,
			  394,  394,  394,  394,  394,  394,  394,  394,  394,  394,
			  394,  394,  394,  394,  394,  394,  394,  394>>)
		end

	yy_base_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,   12,   60,  108,    0,    0,   61,   70,  157,
			    0, 1574, 1573,  206,    0,    0,    0,   77,   82,   84,
			   95,  255,    0,   71,   87,  137,  140,   80,  103,  302,
			  304,    2,    3,  347,  394,  312,  317, 1575, 1578,    7,
			 1578, 1562,  329,    0, 1578,   63, 1578, 1561, 1556, 1578,
			    0, 1578, 1564,    0,    0,   94, 1578, 1563, 1557, 1519,
			 1578,  100, 1578, 1555,    0, 1547, 1546, 1541, 1542, 1524,
			 1538, 1527, 1521, 1535, 1521, 1537, 1552, 1578, 1578,  112,
			 1578, 1542,    0, 1578,  126, 1578, 1578,   56, 1578, 1578,
			 1578, 1578,   80, 1578,  143, 1578, 1578, 1578, 1541, 1578,

			    0,    0, 1578, 1578,    0,    0,  152, 1578, 1540, 1578,
			 1578,   81,  294, 1578, 1578,    0,  294, 1578, 1578, 1578,
			 1546, 1578,  307, 1578, 1578,  324, 1578, 1534, 1506,  296,
			    0,    0,  308, 1541, 1535, 1578, 1578,  317,    0, 1578,
			  311,  333,  324,  325,  371,    0,  337,    0, 1578,  363,
			  380,    0,    0,  337, 1578,  100, 1538,  124,    0, 1578,
			  377,  442,    0, 1524, 1508,  109, 1507, 1512, 1504,  472,
			 1503, 1511, 1515, 1502, 1533, 1578,  383,    0,    0,  384,
			  136, 1578, 1521,    0,  389,    0,    0,    0,    0,    0,
			  404, 1530, 1578, 1578, 1578, 1528, 1578,  409, 1578, 1509,

			  290,  387,  483,    0,  409, 1578,  402, 1523,  409,    0,
			  493, 1578, 1518, 1517, 1526,  340, 1578,  354,    0, 1498,
			 1503, 1487, 1505,    0, 1493, 1503, 1502, 1501, 1496, 1497,
			 1479, 1493, 1492, 1478, 1494, 1488, 1488, 1475, 1477, 1494,
			    0,    0, 1474,  388, 1578,  490,  527, 1578, 1504,  404,
			 1578,  406,  492, 1502,    0, 1497,  410,  417, 1465, 1490,
			 1476, 1462,    0, 1487, 1477, 1461,  414, 1460, 1465, 1457,
			 1465, 1469, 1456, 1463, 1468, 1476,    0, 1463,  492,  558,
			  383,  396, 1479,  500,  503,  498, 1451,   81,    0, 1454,
			 1460, 1453, 1458, 1442, 1460,    0, 1448, 1458, 1453, 1440,

			 1442, 1443, 1435, 1452, 1452,  458,  465,  520,    0, 1437,
			 1445, 1430, 1445, 1409, 1395, 1362, 1329,    0, 1335, 1306,
			 1295,    0, 1264,    0, 1246, 1229,  513, 1195, 1195,    0,
			 1171, 1160,  501,    0, 1163, 1168, 1125, 1123, 1120, 1046,
			 1578, 1059, 1026,    0,    0, 1010, 1016,  974,  987,    0,
			  933, 1578,  923,  898,  888,  878,  881,    0,  876,  850,
			  843,  839,  830,  843,  829,    0,  837,  544,  548,  547,
			  537,  541,  533,    0,  528,  525,  527,  525,  529,  517,
			  520,  511,  484,    0,  406,    0,  398,  394,  320,  303,
			  300,    0,  273,  113, 1578,  582,  602,  622,  642,  662,

			  682,  702,  722,  742,  762,  782,  802,  822,  842,  858,
			  870,  543,  888,  908,  928,  948,  962,  978,  991, 1009,
			 1022, 1040, 1060, 1080, 1100, 1120, 1140, 1160, 1171, 1187,
			 1205, 1225, 1245, 1265, 1285, 1305,  513, 1325, 1345, 1365,
			 1385,  516, 1405, 1425, 1445>>)
		end

	yy_def_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,  395,  394,  396,  396,  397,  397,  398,  398,  394,
			    9,  399,  399,  394,   13,   13,   13,  400,  400,  401,
			  401,  394,   21,  402,  402,  403,  403,  404,  404,  405,
			  405,  406,  406,  407,  407,  408,  408,  394,  394,  394,
			  394,  394,  409,  410,  394,  394,  394,  394,  394,  394,
			  411,  394,  394,  412,  413,  414,  394,  415,  394,  394,
			  394,  394,  394,  416,  416,  416,  416,  416,  416,  416,
			  416,  416,  416,  416,  416,  416,  417,  394,  394,  394,
			  394,  394,  418,  394,  394,  394,  394,  394,  394,  394,
			  394,  394,  419,  394,  394,  394,  394,  394,  394,  394,

			  420,  421,  394,  394,  422,  423,  394,  394,  423,  394,
			  394,  419,  424,  394,  394,  425,  419,  394,  394,  394,
			  426,  394,  394,  394,  394,  394,  394,  394,  427,  419,
			  428,  429,  430,  431,  394,  394,  394,  394,  432,  394,
			  409,  409,  409,  409,  394,  410,  394,  433,  394,  411,
			  394,  412,  413,  414,  394,  414,  394,  415,  434,  394,
			  394,  394,  416,  416,  416,  416,  416,  416,  416,  416,
			  416,  416,  416,  416,  417,  394,  394,  435,  418,  394,
			  394,  394,  394,  436,  394,  437,  420,  421,  422,  423,
			  394,  438,  394,  394,  394,  426,  394,  394,  394,  394,

			  427,  427,  428,  429,  430,  394,  430,  394,  431,  439,
			  409,  394,  394,  394,  394,  394,  394,  394,  440,  416,
			  416,  416,  416,  416,  416,  416,  416,  416,  416,  416,
			  416,  416,  416,  416,  416,  416,  416,  416,  416,  394,
			  441,  442,  394,  427,  394,  427,  427,  394,  394,  394,
			  394,  394,  409,  443,  444,  394,  394,  394,  416,  416,
			  416,  416,  416,  416,  416,  416,  416,  416,  416,  416,
			  416,  416,  416,  416,  416,  416,  416,  394,  427,  246,
			  427,  427,  394,  394,  394,  409,  416,  416,  416,  416,
			  416,  416,  416,  416,  416,  416,  416,  416,  416,  416,

			  416,  416,  416,  416,  394,  427,  427,  409,  416,  416,
			  416,  416,  416,  416,  416,  416,  416,  416,  416,  416,
			  416,  416,  416,  416,  416,  394,  409,  416,  416,  416,
			  416,  416,  416,  416,  416,  416,  416,  416,  416,  416,
			  394,  416,  416,  416,  416,  416,  416,  416,  416,  416,
			  416,  394,  416,  416,  416,  416,  416,  416,  416,  416,
			  416,  416,  416,  416,  416,  416,  416,  416,  416,  416,
			  416,  416,  416,  416,  416,  416,  416,  416,  416,  416,
			  416,  416,  416,  416,  416,  416,  416,  416,  416,  416,
			  416,  416,  416,  416,    0,  394,  394,  394,  394,  394,

			  394,  394,  394,  394,  394,  394,  394,  394,  394,  394,
			  394,  394,  394,  394,  394,  394,  394,  394,  394,  394,
			  394,  394,  394,  394,  394,  394,  394,  394,  394,  394,
			  394,  394,  394,  394,  394,  394,  394,  394,  394,  394,
			  394,  394,  394,  394,  394>>)
		end

	yy_ec_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    1,    5,    1,    6,    7,    1,    8,
			    9,    9,   10,    9,   11,   12,    9,   13,   14,   14,
			   14,   14,   14,   14,   14,   14,   15,   15,    1,    1,
			   16,   17,   18,    9,    1,   19,   20,   21,   22,   23,
			   24,   25,   26,   27,   28,   29,   30,   31,   32,   33,
			   34,   26,   35,   36,   37,   38,   39,   40,   41,   26,
			   26,   42,   43,   44,   45,   46,    1,   19,   20,   21,

			   22,   23,   24,   25,   26,   27,   28,   29,   30,   31,
			   32,   33,   34,   26,   35,   36,   37,   38,   39,   40,
			   41,   26,   26,   47,   48,   49,    1,    1,    1,    1,
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
			    1,    1,    1,    1,    1,    1,    1>>)
		end

	yy_meta_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    3,    4,    1,    5,    6,    1,
			    1,    1,    7,    1,    8,    9,    1,    1,    1,   10,
			   10,   10,   10,   10,   10,   11,   12,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   13,   14,
			   15,   16,    1,    1,   17,    1,   18,   19,    1,   20>>)
		end

	yy_accept_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,   11,   11,    0,
			    0,   50,   50,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,   99,   99,  109,   10,    1,
			    2,   10,    9,    7,   59,   52,   53,   59,   58,   55,
			   56,   57,   59,  106,   11,   15,   15,   15,   15,   15,
			   44,   21,   43,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   50,   51,   20,   17,
			   19,   20,   18,   81,   77,   82,   79,   78,   80,   83,
			   85,   84,   83,   76,   70,   71,   73,   72,   76,   74,

			   75,   98,   96,   97,   95,   48,   47,   49,   48,   89,
			   90,   89,   89,   92,   94,   92,   92,   93,   46,  107,
			   46,   69,   67,   68,   60,   69,   66,   69,   69,   69,
			   63,   99,  103,  103,  103,  104,  105,    1,    1,    8,
			    9,    9,    4,    5,    0,    7,   52,   52,   59,    0,
			   54,  106,   11,    0,   12,    0,    0,    0,   14,   16,
			   21,   21,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   50,   51,   17,   17,   18,   77,
			   78,   86,   86,   86,   70,   70,   75,   98,   95,   48,
			   47,   47,   87,   88,   91,    0,   45,   67,   61,    0,

			    0,    0,    0,   99,    0,  100,    0,    0,    0,  102,
			    9,    3,    0,    0,    0,    0,   13,    0,   21,   44,
			   44,   44,   44,   30,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   44,   44,   44,   86,
			   86,   47,    0,    0,   64,    0,    0,   62,    0,    0,
			  101,    0,    9,    0,   54,    0,    0,    0,   44,   44,
			   44,   44,   32,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   40,    0,    0,    0,
			    0,    0,    0,    0,    0,    9,   44,   44,   26,   44,
			   44,   44,   44,   44,   44,   31,   44,   44,   44,   44,

			   44,   44,   44,   44,    0,    0,    0,    9,   22,   44,
			   44,   44,   44,   44,   44,   44,   44,   33,   44,   44,
			   44,   41,   44,   36,   44,    0,    6,   44,   44,   28,
			   44,   44,   44,   27,   44,   44,   44,   44,   44,   44,
			   65,   44,   44,   34,   23,   44,   44,   44,   44,   37,
			   44,   42,   44,   44,   44,   44,   44,   29,   44,   44,
			   44,   44,   44,   44,   44,   35,   44,   44,   44,   44,
			   44,   44,   44,   38,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   39,   44,   24,   44,   44,   44,   44,
			   44,   25,   44,   44,    0>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 1578
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 394
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 395
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

	yyNb_rules: INTEGER is 108
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 109
			-- End of buffer rule code

	INITIAL: INTEGER is 0
	SECT2: INTEGER is 1
	SECT3: INTEGER is 2
	EIFFEL_BLOCK: INTEGER is 3
	OPTION: INTEGER is 4
	RECOVER1: INTEGER is 5
	SCNAME: INTEGER is 6
	XSCNAME: INTEGER is 7
	NUM: INTEGER is 8
	QUOTE: INTEGER is 9
	SCOND: INTEGER is 10
	ACTION_TEXT: INTEGER is 11
	DEFINITION: INTEGER is 12
	FIRSTCCL: INTEGER is 13
	CCL: INTEGER is 14
	OUTFILE: INTEGER is 15
	REGEXP: INTEGER is 16
	EIFFEL_BLOCK2: INTEGER is 17
			-- Start condition codes

feature -- User-defined features



end -- class LX_LEX_SCANNER
