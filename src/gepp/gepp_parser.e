indexing

	description:

		"Parsers for 'gepp' preprocessors"

	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class GEPP_PARSER

inherit

	YY_PARSER_SKELETON [ANY]
		rename
			make as make_parser_skeleton
		end

	GEPP_SCANNER
		rename
			make as make_gepp_scanner,
			reset as reset_gepp_scanner
		end

creation

	make

feature

feature {NONE} -- Tables

	yy_build_parser_tables is
			-- Build parser tables.
		do
			yytranslate := yytranslate_
			yyr1 := yyr1_
			yyr2 := yyr2_
			yydefact := yydefact_
			yydefgoto := yydefgoto_
			yypact := yypact_
			yypgoto := yypgoto_
			yytable := yytable_
			yycheck := yycheck_
		end

	yyFinal: INTEGER is 40

	yyFlag: INTEGER is -32768

	yyNtbase: INTEGER is 18

	yyMax_token: INTEGER is 269
	yyNsyms: INTEGER is 25

	yytranslate_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<0,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,    15,     2,     2,     2,     2,     2,     2,    16,
    17,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     1,     2,     3,     4,     5,
     6,     7,     8,     9,    10,    11,    12,    13,    14>>, 0)
		end

	yyr1_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<0,
    18,    19,    19,    19,    20,    20,    20,    20,    20,    21,
    21,    22,    22,    22,    22,    22,    23,    24>>, 0)
		end

	yyr2_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<0,
     1,     0,     1,     2,     3,     5,     3,     3,     2,     3,
     3,     1,     3,     3,     3,     2,     2,     2>>, 0)
		end

	yydefact_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<     2,
     0,     0,     0,     0,     0,     1,     3,     2,    12,     0,
     0,     0,     0,     9,     0,     0,     4,     0,    16,     0,
    10,     0,     0,    11,     7,     8,     0,     0,     5,     2,
    13,    15,    14,    18,    17,     0,     6,     0,     0,     0>>, 0)
		end

	yydefgoto_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<    38,
     6,     7,     8,    12,    29,    30>>, 0)
		end

	yypact_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<    37,
    12,    12,    -8,     8,    13,    37,-32768,    37,-32768,    12,
    12,     5,    33,-32768,    10,    17,-32768,    28,-32768,   -11,
-32768,    12,    12,-32768,-32768,-32768,    24,    25,-32768,    37,
-32768,    34,-32768,-32768,-32768,     4,-32768,    49,    50,-32768>>, 0)
		end

	yypgoto_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<-32768,
    -7,    -6,-32768,     3,   -12,-32768>>, 0)
		end

	yyLast: INTEGER is 50

	yytable_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<    17,
    18,    22,    23,    14,    13,    31,     1,     2,     3,     4,
     5,    17,    19,    20,    28,    15,    21,    22,    23,     9,
    16,    25,    36,    37,    32,    33,    10,    11,    26,    17,
     1,     2,     3,     4,     5,    34,    35,    27,    28,     1,
     2,     3,     4,     5,    24,    22,    23,    23,    39,    40>>, 0)
		end

	yycheck_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<     6,
     8,    13,    14,    12,     2,    17,     3,     4,     5,     6,
     7,    18,    10,    11,    11,     8,    12,    13,    14,     8,
     8,    12,    30,    36,    22,    23,    15,    16,    12,    36,
     3,     4,     5,     6,     7,    12,    12,    10,    11,     3,
     4,     5,     6,     7,    12,    13,    14,    14,     0,     0>>, 0)
		end

feature {NONE} -- Semantic actions

	yy_do_action (yy_act: INTEGER) is
		do
			inspect yy_act

when 7 then
--#line 57 "gepp_parser.y"

			if not ignored then
				define_value ("", dollar_to_string (yyvs.item (yyvsp - 1)))
			end
		

when 8 then
--#line 63 "gepp_parser.y"

			if not ignored then
				undefine_value (dollar_to_string (yyvs.item (yyvsp - 1)))
			end
		

when 9 then
--#line 69 "gepp_parser.y"

			if not ignored then
			end
		

when 10 then
--#line 76 "gepp_parser.y"

			if_level := if_level + 1
			if not ignored and not dollar_to_boolean (yyvs.item (yyvsp - 1)) then
				ignored_level := if_level
			end
		

when 11 then
--#line 83 "gepp_parser.y"

			if_level := if_level + 1
			if not ignored and dollar_to_boolean (yyvs.item (yyvsp - 1)) then
				ignored_level := if_level
			end
		

when 12 then
--#line 92 "gepp_parser.y"

			yyval := is_defined (dollar_to_string (yyvs.item (yyvsp)))
		

when 13 then
--#line 96 "gepp_parser.y"

			yyval := yyvs.item (yyvsp - 1)
		

when 14 then
--#line 100 "gepp_parser.y"

			yyval := dollar_to_boolean (yyvs.item (yyvsp - 2)) and dollar_to_boolean (yyvs.item (yyvsp))
		

when 15 then
--#line 104 "gepp_parser.y"

			yyval := dollar_to_boolean (yyvs.item (yyvsp - 2)) or dollar_to_boolean (yyvs.item (yyvsp))
		

when 16 then
--#line 108 "gepp_parser.y"

			yyval := not dollar_to_boolean (yyvs.item (yyvsp))
		

when 17 then
--#line 114 "gepp_parser.y"

			if ignored_level = if_level then
				ignored_level := 0
			end
			if_level := if_level - 1
		

when 18 then
--#line 123 "gepp_parser.y"

			if not ignored then
				ignored_level := if_level
			elseif ignored_level = if_level then
				ignored_level := 0
			end
		

			else
				-- No action
			end
		end



feature {NONE} -- Initialization

	make is
			-- Create a new parser.
		do
			make_gepp_scanner
			make_parser_skeleton
			!! defined_values.make (10)
		end

feature -- Initialization

	reset is
			-- Reset parser before parsing next input.
		do
			reset_gepp_scanner
			if_level := 0
			ignored_level := 0
			defined_values.wipe_out
		end

feature -- Parsing

	parse_file (a_file: like INPUT_STREAM_TYPE) is
			-- Parse scanner description from `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: input_stream_.is_open_read (a_file)
		do
			set_input_buffer (new_file_buffer (a_file))
			parse
		end

	parse_string (a_string: STRING) is
			-- Parse scanner description from `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			set_input_buffer (new_string_buffer (a_string))
			parse
		end

feature -- Status report

	ignored: BOOLEAN is
			-- Is current line ignored?
		do
			Result := ignored_level /= 0
		end

	is_defined (a_name: STRING): BOOLEAN is
			-- Is `a_name' defined?
		require
			a_name_not_void: a_name/= Void
		do
			Result := defined_values.has (a_name)
		end

feature -- Element change

	define_value (a_value: STRING; a_name: STRING) is
			-- Define `a_name' with `a_value'.
		require
			a_value_not_void: a_value /= Void
			a_name_not_void: a_name /= Void
		do
			defined_values.force (a_value, a_name)
		ensure
			a_name_defined: is_defined (a_name)
		end

	undefine_value (a_name: STRING) is
			-- Undefine `a_name'.
		require
			a_name_not_void: a_name /= Void
		do
			defined_values.remove (a_name)
		ensure
			a_name_undefined: not is_defined (a_name)
		end

feature {NONE} -- Conversion

	dollar_to_string (a: ANY): STRING is
		do
			Result ?= a
		end

	dollar_to_boolean (a: ANY): BOOLEAN is
		local
			bool_ref: BOOLEAN_REF
		do
			bool_ref ?= a
			Result := bool_ref.item
		end

feature {NONE} -- Implementation

	defined_values: DS_HASH_TABLE [STRING, STRING]
			-- Defined values

	if_level: INTEGER
			-- Number of nested #ifdef and #ifndef

	ignored_level: INTEGER
			-- Level of #ifdef or #ifndef which specified
			-- that subsequent lines should be ignored;
			-- 0 if lines should not be ignored

invariant

	defined_values_not_void: defined_values /= Void
	no_void_defined_value: not defined_values.has_item (Void)

end -- class GEPP_PARSER
