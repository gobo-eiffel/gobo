note

	description:

		"Parser generators"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 1999-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PR_PARSER_GENERATOR

inherit

	PR_PARSER_ENGINE

	KL_IMPORTED_ARRAY_ROUTINES

	KL_IMPORTED_STRING_ROUTINES

	UT_IMPORTED_FORMATTERS

create

	make

feature {NONE} -- Initialization

	make (a_machine: like machine)
			-- Create a new parser generator
			-- associated with `a_machine'.
		require
			a_machine_not_void: a_machine /= Void
		do
			machine := a_machine
			yyFinal := machine.states.last.id
			yyFlag := -32768
			build_yytranslate
			build_yyr1
			build_yytypes1
			build_yytypes2
			build_action_tables
			array_size := 1000
			line_pragma := True
			input_filename := Default_input_filename
		ensure
			machine_set: machine = a_machine
		end

feature -- Status report

	line_pragma: BOOLEAN
			-- Should line pragma be generated?

feature -- Access

	machine: PR_FSM
			-- Associated finite state machine

	input_filename: STRING
			-- Input filename

feature -- Setting

	set_input_filename (a_filename: like input_filename)
			-- Set `input_filename' to `a_filename'.
		require
			a_filename_not_void: a_filename /= Void
		do
			input_filename := a_filename
		ensure
			input_filename_set: input_filename = a_filename
		end

feature -- Status setting

	set_line_pragma (b: BOOLEAN)
			-- Set `line_pragma' to `b'.
		do
			line_pragma := b
		ensure
			line_pragma_set: line_pragma = b
		end

feature -- Generation

	print_parser (tokens_needed, actions_separated: BOOLEAN; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print code for corresponding parser to `a_file'.
			-- Print the token codes with the parser class text
			-- if `tokens_needed' is true, and the semantic actions
			-- in individual routines if `actions_separated' is true.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			print_eiffel_header (a_file)
			if tokens_needed then
				a_file.put_new_line
				print_token_codes (a_file)
			end
			a_file.put_new_line
			a_file.put_string ("feature {NONE} -- Implementation%N%N")
			print_build_parser_tables (a_file)
			a_file.put_new_line
			print_create_value_stacks (a_file)
			a_file.put_new_line
			print_init_value_stacks (a_file)
			a_file.put_new_line
			print_clear_value_stacks (a_file)
			a_file.put_new_line
			print_push_last_value (a_file)
			a_file.put_new_line
			print_push_error_value (a_file)
			a_file.put_new_line
			print_pop_last_value (a_file)
			a_file.put_new_line
			print_dummy_feature (a_file)
			a_file.put_new_line
			a_file.put_string ("feature {NONE} -- Semantic actions%N%N")
			if actions_separated then
				print_separated_actions (a_file)
			else
				print_actions (a_file)
			end
			a_file.put_new_line
			if actions_separated then
				print_separated_error_actions (a_file)
			else
				print_error_actions (a_file)
			end
			a_file.put_string ("%Nfeature {NONE} -- Table templates%N%N")
			print_eiffel_tables (a_file)
			a_file.put_string ("%Nfeature {NONE} -- Semantic value stacks%N%N")
			print_stack_declarations (a_file)
			a_file.put_string ("feature {NONE} -- Constants%N%N")
			print_constants (a_file)
			a_file.put_string ("%Nfeature -- User-defined features%N%N")
			print_eiffel_code (a_file)
		end

	print_token_class (class_name, version: STRING; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print class text with token code constants to `a_file'.
			-- `class_name' is the name of the generated class
			-- and `version' is the verrsion number of geyacc.
		require
			class_name_not_void: class_name /= Void
			version_not_void: version /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string ("note%N%N%
				%%Tdescription: %"Parser token codes%"%N%
				%%Tgenerator: %"geyacc version ")
			a_file.put_string (version)
			a_file.put_string ("%"%N%Ndeferred class ")
			a_file.put_string (class_name)
			a_file.put_string ("%N%Ninherit%N%N%
				%%TYY_PARSER_TOKENS%N")
			a_file.put_new_line
			print_token_codes (a_file)
			a_file.put_line ("%Nend")
		end

feature {NONE} -- Generation

	print_token_codes (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print token codes to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			tokens: DS_ARRAYED_LIST [PR_TOKEN]
			a_token: PR_TOKEN
			a_name: STRING
			a_literal: STRING
			i, nb: INTEGER
		do
			print_last_values (a_file)
			a_file.put_new_line
			tokens := machine.grammar.tokens
			nb := tokens.count
			a_file.put_string ("feature -- Access%N%N%
				%%Ttoken_name (a_token: INTEGER): STRING%N%
				%%T%T%T-- Name of token `a_token'%N%
				%%T%Tdo%N%
				%%T%T%Tinspect a_token%N%
				%%T%T%Twhen 0 then%N%
				%%T%T%T%TResult := %"EOF token%"%N%
				%%T%T%Twhen -1 then%N%
				%%T%T%T%TResult := %"Error token%"%N")
				-- Skip the "error" and "$undefined." tokens.
			from
				i := 3
			until
				i > nb
			loop
				a_token := tokens.item (i)
				if a_token.has_identifier then
					a_name := a_token.name
					a_file.put_string ("%T%T%Twhen ")
					a_file.put_string (a_name)
					a_file.put_string (" then%N%
						%%T%T%T%TResult := %"")
					a_file.put_string (a_name)
					a_literal := a_token.literal_string
					if a_literal /= Void then
						a_file.put_string (" (")
						STRING_FORMATTER_.put_eiffel_string (a_file, a_literal)
						a_file.put_character (')')
					end
					a_file.put_string ("%"%N")
				end
				i := i + 1
			end
			a_file.put_string ("%T%T%Telse%N%
				%%T%T%T%TResult := yy_character_token_name (a_token)%N%
				%%T%T%Tend%N%
				%%T%Tend%N%Nfeature -- Token codes%N%N")
				-- Skip the "error" and "$undefined." tokens.
			from
				i := 3
			until
				i > nb
			loop
				a_token := tokens.item (i)
				if a_token.has_identifier then
					a_name := a_token.name
					a_file.put_character ('%T')
					a_file.put_string (a_name)
					a_file.put_string (": INTEGER = ")
					a_file.put_integer (a_token.token_id)
					a_file.put_character ('%N')
				end
				i := i + 1
			end
		end

	print_last_values (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `last_..._value' declarations to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			nb_types: INTEGER
			types: DS_HASH_SET [PR_TYPE]
			a_cursor: DS_HASH_SET_CURSOR [PR_TYPE]
			tokens: DS_ARRAYED_LIST [PR_TOKEN]
			a_type: PR_TYPE
			i, nb: INTEGER
		do
			a_file.put_line ("feature -- Last values")
			a_file.put_new_line
			nb_types := machine.grammar.types.count
			create types.make (nb_types)
			tokens := machine.grammar.tokens
			nb := tokens.count
			from
				i := 1
			until
				i > nb
			loop
				a_type := tokens.item (i).type
				types.put (a_type)
				if types.count = nb_types then
						-- All types have already been registered.
						-- Jump out of the loop.
					i := nb + 1
				end
				i := i + 1
			end
			a_cursor := types.new_cursor
			from
				a_cursor.start
			until
				a_cursor.after
			loop
				a_type := a_cursor.item
				a_file.put_string ("%T")
				a_file.put_string (a_type.last_value_name)
				a_file.put_string (": ")
				a_file.put_line (a_type.name)
				a_cursor.forth
			end
		end

	print_eiffel_header (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print user-defined eiffel header to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, nb: INTEGER
			eiffel_header: DS_ARRAYED_LIST [STRING]
		do
			eiffel_header := machine.grammar.eiffel_header
			nb := eiffel_header.count
			from
				i := 1
			until
				i > nb
			loop
				a_file.put_string (eiffel_header.item (i))
				i := i + 1
			end
		end

	print_eiffel_code (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print user-defined eiffel code to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			eiffel_code: detachable STRING
		do
			eiffel_code := machine.grammar.eiffel_code
			if eiffel_code /= Void then
				a_file.put_string (eiffel_code)
			end
		end

	print_build_parser_tables (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print code for `yy_build_parser_tables' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_line ("%Tyy_build_parser_tables")
			a_file.put_line ("%T%T%T-- Build parser tables.")
			a_file.put_line ("%T%Tdo")
			a_file.put_line ("%T%T%Tyytranslate := yytranslate_template")
			a_file.put_line ("%T%T%Tyyr1 := yyr1_template")
			a_file.put_line ("%T%T%Tyytypes1 := yytypes1_template")
			a_file.put_line ("%T%T%Tyytypes2 := yytypes2_template")
			a_file.put_line ("%T%T%Tyydefact := yydefact_template")
			a_file.put_line ("%T%T%Tyydefgoto := yydefgoto_template")
			a_file.put_line ("%T%T%Tyypact := yypact_template")
			a_file.put_line ("%T%T%Tyypgoto := yypgoto_template")
			a_file.put_line ("%T%T%Tyytable := yytable_template")
			a_file.put_line ("%T%T%Tyycheck := yycheck_template")
			a_file.put_line ("%T%Tend")
		end

	print_create_value_stacks (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print code for `yy_create_value_stacks' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			types: DS_ARRAYED_LIST [PR_TYPE]
			a_type: PR_TYPE
			i, nb: INTEGER
		do
			a_file.put_line ("%Tyy_create_value_stacks")
			a_file.put_line ("%T%T%T-- Create value stacks.")
			a_file.put_line ("%T%Tdo")
			types := machine.grammar.types
			nb := types.count
			from
				i := 1
			until
				i > nb
			loop
				a_type := types.item (i)
				a_type.print_create_yyvs (3, a_file)
				i := i + 1
			end
			a_file.put_line ("%T%Tend")
		end

	print_init_value_stacks (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print code for `yy_init_value_stacks' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			types: DS_ARRAYED_LIST [PR_TYPE]
			a_type: PR_TYPE
			a_type_id: INTEGER
			i, nb: INTEGER
		do
			a_file.put_line ("%Tyy_init_value_stacks")
			a_file.put_line ("%T%T%T-- Initialize value stacks.")
			a_file.put_line ("%T%Tdo")
			types := machine.grammar.types
			nb := types.count
			from
				i := 1
			until
				i > nb
			loop
				a_type := types.item (i)
				a_type_id := a_type.id
				a_file.put_string ("%T%T%Tyyvsp")
				a_file.put_integer (a_type_id)
				a_file.put_line (" := -1")
				i := i + 1
			end
			a_file.put_line ("%T%Tend")
		end

	print_clear_value_stacks (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print code for `yy_clear_value_stacks' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			types: DS_ARRAYED_LIST [PR_TYPE]
			a_type: PR_TYPE
			i, nb: INTEGER
		do
			types := machine.grammar.types
			nb := types.count
			a_file.put_line ("%Tyy_clear_value_stacks")
			a_file.put_line ("%T%T%T-- Clear objects in semantic value stacks so that")
			a_file.put_line ("%T%T%T-- they can be collected by the garbage collector.")
			a_file.put_line ("%T%Tdo")
			from
				i := 1
			until
				i > nb
			loop
				a_type := types.item (i)
				a_type.print_clear_yyvs (3, a_file)
				i := i + 1
			end
			a_file.put_line ("%T%Tend")
		end

	print_push_last_value (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print code for `yy_push_last_value' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			nb_types: INTEGER
			types: DS_HASH_SET [PR_TYPE]
			a_cursor: DS_HASH_SET_CURSOR [PR_TYPE]
			tokens: DS_ARRAYED_LIST [PR_TOKEN]
			i, nb: INTEGER
			a_type: PR_TYPE
		do
			a_file.put_line ("%Tyy_push_last_value (yychar1: INTEGER)")
			a_file.put_line ("%T%T%T-- Push semantic value associated with token `last_token'")
			a_file.put_line ("%T%T%T-- (with internal id `yychar1') on top of corresponding")
			a_file.put_line ("%T%T%T-- value stack.")
			a_file.put_line ("%T%Tdo")
			nb_types := machine.grammar.types.count
			create types.make (nb_types)
			tokens := machine.grammar.tokens
			nb := tokens.count
			from
				i := 1
			until
				i > nb
			loop
				a_type := tokens.item (i).type
				types.put (a_type)
				if types.count = nb_types then
						-- All types have already been registered.
						-- Jump out of the loop.
					i := nb + 1
				end
				i := i + 1
			end
			inspect types.count
			when 0 then
				a_file.put_line ("%T%T%Tdebug (%"GEYACC%")")
				a_file.put_line ("%T%T%T%Tstd.error.put_string (%"Error in parser: not a token type: %")")
				a_file.put_line ("%T%T%T%Tstd.error.put_integer (yytypes2.item (yychar1))")
				a_file.put_line ("%T%T%T%Tstd.error.put_new_line")
				a_file.put_line ("%T%T%Tend")
				a_file.put_line ("%T%T%Tabort")
				a_file.put_line ("%T%Tend")
			when 1 then
				a_type := types.first
				a_type.print_push_last_value (3, a_file)
			else
				a_file.put_line ("%T%T%Tinspect yytypes2.item (yychar1)")
				a_cursor := types.new_cursor
				from
					a_cursor.start
				until
					a_cursor.after
				loop
					a_type := a_cursor.item
					a_file.put_string ("%T%T%Twhen ")
					a_file.put_integer (a_type.id)
					a_file.put_line (" then")
					a_type.print_push_last_value (4, a_file)
					a_cursor.forth
				end
				a_file.put_line ("%T%T%Telse")
				a_file.put_line ("%T%T%T%Tdebug (%"GEYACC%")")
				a_file.put_line ("%T%T%T%T%Tstd.error.put_string (%"Error in parser: not a token type: %")")
				a_file.put_line ("%T%T%T%T%Tstd.error.put_integer (yytypes2.item (yychar1))")
				a_file.put_line ("%T%T%T%T%Tstd.error.put_new_line")
				a_file.put_line ("%T%T%T%Tend")
				a_file.put_line ("%T%T%T%Tabort")
				a_file.put_line ("%T%T%Tend")
			end
			a_file.put_line ("%T%Tend")
		end

	print_push_error_value (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print code for `yy_push_error_value' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			tokens: DS_ARRAYED_LIST [PR_TOKEN]
			a_token: PR_TOKEN
			a_type: PR_TYPE
			nb: INTEGER
		do
			a_file.put_line ("%Tyy_push_error_value")
			a_file.put_line ("%T%T%T-- Push semantic value associated with token 'error'")
			a_file.put_line ("%T%T%T-- on top of corresponding value stack.")
			tokens := machine.grammar.tokens
			nb := tokens.count
			if nb >= 2 then
				a_token := tokens.item (2)
				a_file.put_line ("%T%Tlocal")
				a_type := a_token.type
				a_type.print_dollar_dollar_declaration (a_file)
				a_file.put_new_line
				a_file.put_line ("%T%Tdo")
				a_type.print_increment_yyvsp (1, 3, a_file)
				a_type.print_resize_yyvs (3, a_file)
				a_type.print_push_yyval (3, a_file)
				a_file.put_line ("%T%Tend")
			else
				a_file.put_line ("%T%Tdo")
				a_file.put_line ("%T%T%Tdebug (%"GEYACC%")")
				a_file.put_line ("%T%T%T%Tstd.error.put_line (%"Error in parser: unknown 'error' token.%")")
				a_file.put_line ("%T%T%Tend")
				a_file.put_line ("%T%T%Tabort")
				a_file.put_line ("%T%Tend")
			end
		end

	print_pop_last_value (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print code for `yy_pop_last_value' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			types: DS_ARRAYED_LIST [PR_TYPE]
			a_type: PR_TYPE
			i, nb: INTEGER
		do
			a_file.put_line ("%Tyy_pop_last_value (yystate: INTEGER)")
			a_file.put_line ("%T%T%T-- Pop semantic value from stack when in state `yystate'.")
			a_file.put_line ("%T%Tlocal")
			a_file.put_line ("%T%T%Tyy_type_id: INTEGER")
			a_file.put_line ("%T%Tdo")
			a_file.put_line ("%T%T%Tyy_type_id := yytypes1.item (yystate)")
			a_file.put_line ("%T%T%Tinspect yy_type_id")
			types := machine.grammar.types
			nb := types.count
			from
				i := 1
			until
				i > nb
			loop
				a_type := types.item (i)
				a_file.put_string ("%T%T%Twhen ")
				a_file.put_integer (a_type.id)
				a_file.put_line (" then")
				a_type.print_pop_last_value (4, a_file)
				i := i + 1
			end
			a_file.put_line ("%T%T%Telse")
			a_file.put_line ("%T%T%T%Tdebug (%"GEYACC%")")
			a_file.put_line ("%T%T%T%T%Tstd.error.put_string (%"Error in parser: unknown type id: %")")
			a_file.put_line ("%T%T%T%T%Tstd.error.put_integer (yy_type_id)")
			a_file.put_line ("%T%T%T%T%Tstd.error.put_new_line")
			a_file.put_line ("%T%T%T%Tend")
			a_file.put_line ("%T%T%T%Tabort")
			a_file.put_line ("%T%T%Tend")
			a_file.put_line ("%T%Tend")
		end

	print_eiffel_tables (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print Eiffel code for parser tables to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			print_eiffel_array ("yytranslate_template", yytranslate, a_file)
			a_file.put_character ('%N')
			print_eiffel_array ("yyr1_template", yyr1, a_file)
			a_file.put_character ('%N')
			print_eiffel_array ("yytypes1_template", yytypes1, a_file)
			a_file.put_character ('%N')
			print_eiffel_array ("yytypes2_template", yytypes2, a_file)
			a_file.put_character ('%N')
			print_eiffel_array ("yydefact_template", yydefact, a_file)
			a_file.put_character ('%N')
			print_eiffel_array ("yydefgoto_template", yydefgoto, a_file)
			a_file.put_character ('%N')
			print_eiffel_array ("yypact_template", yypact, a_file)
			a_file.put_character ('%N')
			print_eiffel_array ("yypgoto_template", yypgoto, a_file)
			a_file.put_character ('%N')
			print_eiffel_array ("yytable_template", yytable, a_file)
			a_file.put_character ('%N')
			print_eiffel_array ("yycheck_template", yycheck, a_file)
		end

	print_eiffel_array (a_name: STRING; a_table: ARRAY [INTEGER]; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print Eiffel code for `a_table' named `a_name' to `a_file'.
		require
			a_name_not_void: a_name /= Void
			a_table_not_void: a_table /= Void
			zero_based_table: a_table.lower = 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, j, k, nb: INTEGER
			a_table_upper: INTEGER
			a_name_count: INTEGER
		do
			a_file.put_character ('%T')
			a_file.put_string (a_name)
			a_file.put_string (": SPECIAL [INTEGER]%N")
			a_file.put_string ("%T%T%T-- ")
			a_name_count := a_name.count
			if a_name_count > 9 and then STRING_.same_string (a_name.substring (a_name_count - 8, a_name_count), "_template") then
				a_file.put_string ("Template for `")
				a_file.put_string (a_name.substring (1, a_name_count - 9))
				a_file.put_character ('%'')
			else
				a_file.put_string (a_name)
			end
			a_file.put_new_line
			if array_size = 0 then
				nb := 1
			else
				nb := a_table.count // array_size + 1
			end
			if nb = 1 then
				a_file.put_string ("%T%Tonce%N%T%T%TResult := yyfixed_array (<<%N")
				ARRAY_FORMATTER_.put_integer_array (a_file, a_table, a_table.lower, a_table.upper)
				a_file.put_string (", yyDummy>>)%N%T%Tend%N")
			else
				a_file.put_string ("%T%Tlocal%N%T%T%Tan_array: ARRAY [INTEGER]%N%
					%%T%Tonce%N%T%T%Tcreate an_array.make_filled (0, ")
				a_file.put_integer (a_table.lower)
				a_file.put_string (", ")
				a_file.put_integer (a_table.upper)
				a_file.put_string (")%N")
				from
					j := 1
				until
					j > nb
				loop
					a_file.put_string (Indentation)
					a_file.put_string (a_name)
					a_file.put_character ('_')
					a_file.put_integer (j)
					a_file.put_string (" (an_array)%N")
					j := j + 1
				end
				a_file.put_string ("%T%T%TResult := yyfixed_array (an_array)%N%T%Tend%N")
				from
					j := 1
					i := a_table.lower
					a_table_upper := a_table.upper
				until
					j > nb
				loop
					a_file.put_string ("%N%T")
					a_file.put_string (a_name)
					a_file.put_character ('_')
					a_file.put_integer (j)
					a_file.put_line (" (an_array: ARRAY [INTEGER])")
					a_file.put_string ("%T%T%T-- ")
					if a_name_count > 9 and then STRING_.same_string (a_name.substring (a_name_count - 8, a_name_count), "_template") then
						a_file.put_string ("Fill chunk #")
						a_file.put_integer (j)
						a_file.put_string (" of template for `")
						a_file.put_string (a_name.substring (1, a_name_count - 9))
						a_file.put_string ("'.")
					else
						a_file.put_string (a_name)
						a_file.put_string (" #")
						a_file.put_integer (j)
						a_file.put_character ('.')
					end
					a_file.put_new_line
					a_file.put_line ("%T%Tdo%N%T%T%Tyyarray_subcopy (an_array, <<")
					k := a_table_upper.min (i + array_size - 1)
					ARRAY_FORMATTER_.put_integer_array (a_file, a_table, i, k)
					a_file.put_string (", yyDummy>>,%N%T%T%T")
					a_file.put_integer (1)
					a_file.put_string (", ")
					a_file.put_integer (k - i + 1)
					a_file.put_string (", ")
					a_file.put_integer (i)
					a_file.put_string (")%N%T%Tend%N")
					i := k + 1
					j := j + 1
				end
			end
		end

	print_actions (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print code for actions to `a_file'.
			-- Print all actions in one routine.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, nb: INTEGER
			rules: DS_ARRAYED_LIST [PR_RULE]
			nb_types: INTEGER
			types: DS_HASH_SET [PR_TYPE]
			a_cursor: DS_HASH_SET_CURSOR [PR_TYPE]
			a_rule: PR_RULE
			a_type: PR_TYPE
		do
			a_file.put_line ("%Tyy_do_action (yy_act: INTEGER)")
			a_file.put_line ("%T%T%T-- Execute semantic action.")
			a_file.put_line ("%T%Tlocal")
			a_file.put_line ("%T%T%Tyy_retried: BOOLEAN")
			nb_types := machine.grammar.types.count
			create types.make (nb_types)
			rules := machine.grammar.rules
			nb := rules.count
			if nb_types > 0 then
				from
					i := 1
				until
					i > nb
				loop
					a_rule := rules.item (i)
					a_type := a_rule.lhs.type
					types.put (a_type)
					if types.count = nb_types then
							-- All types have already been registered.
							-- Jump out of the loop.
						i := nb + 1
					end
					i := i + 1
				end
			end
			if not types.is_empty then
				a_cursor := types.new_cursor
				from
					a_cursor.start
				until
					a_cursor.after
				loop
					a_cursor.item.print_dollar_dollar_declaration (a_file)
					a_file.put_new_line
					a_cursor.forth
				end
			end
			a_file.put_line ("%T%Tdo")
			a_file.put_line ("%T%T%Tif not yy_retried then")
			a_file.put_line ("%T%T%T%Tinspect yy_act")
			from
				i := 1
			until
				i > nb
			loop
				a_rule := rules.item (i)
				a_file.put_string ("when ")
				a_file.put_integer (a_rule.id)
				a_file.put_line (" then")
				a_rule.print_action (input_filename, line_pragma, a_file)
				i := i + 1
			end
			a_file.put_line ("%T%T%T%Telse")
			a_file.put_line ("%T%T%T%T%Tdebug (%"GEYACC%")")
			a_file.put_line ("%T%T%T%T%T%Tstd.error.put_string (%"Error in parser: unknown rule id: %")")
			a_file.put_line ("%T%T%T%T%T%Tstd.error.put_integer (yy_act)")
			a_file.put_line ("%T%T%T%T%T%Tstd.error.put_new_line")
			a_file.put_line ("%T%T%T%T%Tend")
			a_file.put_line ("%T%T%T%T%Tabort")
			a_file.put_line ("%T%T%T%Tend")
			a_file.put_line ("%T%T%Tend")
			a_file.put_line ("%T%Trescue")
			a_file.put_line ("%T%T%Tif yy_parsing_status = yyAborted then")
			a_file.put_line ("%T%T%T%Tyy_retried := True")
			a_file.put_line ("%T%T%T%Tretry")
			a_file.put_line ("%T%T%Tend")
			a_file.put_line ("%T%Tend")
		end

	print_separated_actions (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print code for actions to `a_file'.
			-- Print each action into an individual routine.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, nb: INTEGER
			j, k, nb2: INTEGER
			inspect_size: INTEGER
			rules: DS_ARRAYED_LIST [PR_RULE]
			a_rule: PR_RULE
			a_type: PR_TYPE
		do
				-- SmartEiffel generates C code which trigger a
				-- stack overflow of the C compiler if there are
				-- too many branches in an inspect instruction.
				-- Therefore, split the inspect instruction into
				-- several chunks which each have less than
				-- `inspect_size' branches.
			inspect_size := 200
			a_file.put_line ("%Tyy_do_action (yy_act: INTEGER)")
			a_file.put_line ("%T%T%T-- Execute semantic action.")
			a_file.put_line ("%T%Tdo")
			rules := machine.grammar.rules
			nb := rules.count
			nb2 := nb // inspect_size + 1
			if nb2 = 1 then
				a_file.put_line ("%T%T%Tinspect yy_act")
				from
					i := 1
				until
					i > nb
				loop
					a_rule := rules.item (i)
					a_file.put_string ("%T%T%Twhen ")
					a_file.put_integer (a_rule.id)
					a_file.put_line (" then")
					a_file.put_string ("%T%T%T%T%T--|#line ")
					if line_pragma then
						a_file.put_integer (a_rule.line_nb)
					else
						a_file.put_string ("<not available>")
					end
					a_file.put_string (" %"")
					a_file.put_string (input_filename)
					a_file.put_line ("%"")
					a_file.put_string ("%T%T%T%Tyy_do_action_")
					a_file.put_integer (i)
					a_file.put_new_line
					i := i + 1
				end
				a_file.put_line ("%T%T%Telse")
				a_file.put_line ("%T%T%T%Tdebug (%"GEYACC%")")
				a_file.put_line ("%T%T%T%T%Tstd.error.put_string (%"Error in parser: unknown rule id: %")")
				a_file.put_line ("%T%T%T%T%Tstd.error.put_integer (yy_act)")
				a_file.put_line ("%T%T%T%T%Tstd.error.put_new_line")
				a_file.put_line ("%T%T%T%Tend")
				a_file.put_line ("%T%T%T%Tabort")
				a_file.put_line ("%T%T%Tend")
				a_file.put_line ("%T%Tend")
			else
				a_file.put_string ("%T%T%T")
				from
					i := 1
				until
					i > nb2
				loop
					j := inspect_size * (i - 1) + 1
					k := inspect_size * i
					a_file.put_string ("if yy_act <= ")
					a_file.put_integer (k)
					a_file.put_line (" then")
					a_file.put_string ("%T%T%T%Tyy_do_action_")
					a_file.put_integer (j)
					a_file.put_character ('_')
					a_file.put_integer (k)
					a_file.put_line (" (yy_act)")
					a_file.put_string ("%T%T%Telse")
					i := i + 1
				end
				a_file.put_new_line
				a_file.put_line ("%T%T%T%Tdebug (%"GEYACC%")")
				a_file.put_line ("%T%T%T%T%Tstd.error.put_string (%"Error in parser: unknown rule id: %")")
				a_file.put_line ("%T%T%T%T%Tstd.error.put_integer (yy_act)")
				a_file.put_line ("%T%T%T%T%Tstd.error.put_new_line")
				a_file.put_line ("%T%T%T%Tend")
				a_file.put_line ("%T%T%T%Tabort")
				a_file.put_line ("%T%T%Tend")
				a_file.put_line ("%T%Tend")
				from
					i := 1
				until
					i > nb2
				loop
					j := inspect_size * (i - 1) + 1
					k := inspect_size * i
					a_file.put_new_line
					a_file.put_string ("%Tyy_do_action_")
					a_file.put_integer (j)
					a_file.put_character ('_')
					a_file.put_integer (k)
					a_file.put_line (" (yy_act: INTEGER)")
					a_file.put_line ("%T%T%T-- Execute semantic action.")
					a_file.put_line ("%T%Tdo")
					a_file.put_line ("%T%T%Tinspect yy_act")
					k := k.min (nb)
					from
					until
						j > k
					loop
						a_rule := rules.item (j)
						a_file.put_string ("%T%T%Twhen ")
						a_file.put_integer (a_rule.id)
						a_file.put_line (" then")
						a_file.put_string ("%T%T%T%T%T--|#line ")
						if line_pragma then
							a_file.put_integer (a_rule.line_nb)
						else
							a_file.put_string ("<not available>")
						end
						a_file.put_string (" %"")
						a_file.put_string (input_filename)
						a_file.put_line ("%"")
						a_file.put_string ("%T%T%T%Tyy_do_action_")
						a_file.put_integer (j)
						a_file.put_new_line
						j := j + 1
					end
					a_file.put_line ("%T%T%Telse")
					a_file.put_line ("%T%T%T%Tdebug (%"GEYACC%")")
					a_file.put_line ("%T%T%T%T%Tstd.error.put_string (%"Error in parser: unknown rule id: %")")
					a_file.put_line ("%T%T%T%T%Tstd.error.put_integer (yy_act)")
					a_file.put_line ("%T%T%T%T%Tstd.error.put_new_line")
					a_file.put_line ("%T%T%T%Tend")
					a_file.put_line ("%T%T%T%Tabort")
					a_file.put_line ("%T%T%Tend")
					a_file.put_line ("%T%Tend")
					i := i + 1
				end
			end
			from
				i := 1
			until
				i > nb
			loop
				a_rule := rules.item (i)
				a_file.put_new_line
				a_file.put_string ("%Tyy_do_action_")
				a_file.put_integer (i)
				a_file.put_new_line
				a_file.put_string ("%T%T%T--|#line ")
				if line_pragma then
					a_file.put_integer (a_rule.line_nb)
				else
					a_file.put_string ("<not available>")
				end
				a_file.put_string (" %"")
				a_file.put_string (input_filename)
				a_file.put_line ("%"")
				a_type := a_rule.lhs.type
				a_file.put_line ("%T%Tlocal")
				a_file.put_line ("%T%T%Tyy_retried: BOOLEAN")
				a_type.print_dollar_dollar_declaration (a_file)
				a_file.put_new_line
				a_file.put_line ("%T%Tdo")
				a_file.put_line ("%T%T%Tif not yy_retried then")
				a_rule.print_action (input_filename, line_pragma, a_file)
				a_file.put_line ("%T%T%Tend")
				a_file.put_line ("%T%Trescue")
				a_file.put_line ("%T%T%Tif yy_parsing_status = yyAborted then")
				a_file.put_line ("%T%T%T%Tyy_retried := True")
				a_file.put_line ("%T%T%T%Tretry")
				a_file.put_line ("%T%T%Tend")
				a_file.put_line ("%T%Tend")
				i := i + 1
			end
		end

	print_error_actions (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print code for actions to `a_file'.
			-- Print all actions in one routine.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, nb: INTEGER
			states: DS_ARRAYED_LIST [PR_STATE]
			a_state: PR_STATE
			an_action: detachable PR_ERROR_ACTION
		do
			a_file.put_line ("%Tyy_do_error_action (yy_act: INTEGER)")
			a_file.put_line ("%T%T%T-- Execute error action.")
			a_file.put_line ("%T%Tdo")
			a_file.put_line ("%T%T%Tinspect yy_act")
			states := machine.states
			nb := states.count
			from
				i := 1
			until
				i > nb
			loop
				a_state := states.item (i)
				an_action := a_state.error_action
				if an_action /= Void then
					a_file.put_string ("when ")
					a_file.put_integer (a_state.id)
					a_file.put_line (" then")
					a_file.put_string ("--|#line ")
					if line_pragma then
						a_file.put_integer (an_action.line_nb)
					else
						a_file.put_string ("<not available>")
					end
					a_file.put_string (" %"")
					a_file.put_string (input_filename)
					a_file.put_line ("%"")
					a_file.put_line ("debug (%"GEYACC%")")
					a_file.put_string ("%Tstd.error.put_line (%"Executing parser error-code from file '")
					a_file.put_string (input_filename)
					a_file.put_string ("' at line ")
					if line_pragma then
						a_file.put_integer (an_action.line_nb)
					else
						a_file.put_string ("<not available>")
					end
					a_file.put_line ("%")")
					a_file.put_line ("end")
					a_file.put_line (an_action.action.out)
				elseif i = nb - 2 then
						-- End of file expected.
					a_file.put_string ("%T%T%Twhen ")
					a_file.put_integer (a_state.id)
					a_file.put_line (" then")
					a_file.put_line ("%T%T%T%T%T-- End-of-file expected action.")
					a_file.put_line ("%T%T%T%Treport_eof_expected_error")
				end
				i := i + 1
			end
			a_file.put_line ("%T%T%Telse")
			a_file.put_line ("%T%T%T%T%T-- Default action.")
			a_file.put_line ("%T%T%T%Treport_error (%"parse error%")")
			a_file.put_line ("%T%T%Tend")
			a_file.put_line ("%T%Tend")
		end

	print_separated_error_actions (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print code for error actions to `a_file'.
			-- Print each action into an individual routine.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, nb: INTEGER
			j, k, nb2: INTEGER
			inspect_size: INTEGER
			states: DS_ARRAYED_LIST [PR_STATE]
			a_state: PR_STATE
			an_action: detachable PR_ERROR_ACTION
		do
				-- SmartEiffel generates C code which triggers a
				-- stack overflow of the C compiler if there are
				-- too many branches in an inspect instruction.
				-- Therefore, split the inspect instruction into
				-- several chunks which each have less than
				-- `inspect_size' branches.
			inspect_size := 200
			a_file.put_line ("%Tyy_do_error_action (yy_act: INTEGER)")
			a_file.put_line ("%T%T%T-- Execute error action.")
			a_file.put_line ("%T%Tdo")
			states := machine.states
			nb := states.count
			nb2 := nb // inspect_size + 1
			if nb2 = 1 then
				a_file.put_line ("%T%T%Tinspect yy_act")
				from
					i := 1
				until
					i > nb
				loop
					a_state := states.item (i)
					an_action := a_state.error_action
					if an_action /= Void then
						a_file.put_string ("%T%T%Twhen ")
						a_file.put_integer (a_state.id)
						a_file.put_line (" then")
						a_file.put_string ("%T%T%T%T%T--|#line ")
						if line_pragma then
							a_file.put_integer (an_action.line_nb)
						else
							a_file.put_string ("<not available>")
						end
						a_file.put_string (" %"")
						a_file.put_string (input_filename)
						a_file.put_line ("%"")
						a_file.put_string ("%T%T%T%Tyy_do_error_action_")
						a_file.put_integer (a_state.id)
						a_file.put_new_line
					elseif i = nb - 2 then
							-- End of file expected.
						a_file.put_string ("%T%T%Twhen ")
						a_file.put_integer (a_state.id)
						a_file.put_line (" then")
						a_file.put_line ("%T%T%T%T%T-- End-of-file expected action.")
						a_file.put_line ("%T%T%T%Treport_eof_expected_error")
					end
					i := i + 1
				end
				a_file.put_line ("%T%T%Telse")
				a_file.put_line ("%T%T%T%T%T-- Default action.")
				a_file.put_line ("%T%T%T%Treport_error (%"parse error%")")
				a_file.put_line ("%T%T%Tend")
				a_file.put_line ("%T%Tend")
			else
				a_file.put_string ("%T%T%T")
				from
					i := 1
				until
					i > nb2
				loop
					j := inspect_size * (i - 1)
					k := inspect_size * i - 1
					a_file.put_string ("if yy_act <= ")
					a_file.put_integer (k)
					a_file.put_line (" then")
					a_file.put_string ("%T%T%T%Tyy_do_error_action_")
					a_file.put_integer (j)
					a_file.put_character ('_')
					a_file.put_integer (k)
					a_file.put_line (" (yy_act)")
					a_file.put_string ("%T%T%Telse")
					i := i + 1
				end
				a_file.put_new_line
				a_file.put_line ("%T%T%T%T%T-- Default action.")
				a_file.put_line ("%T%T%T%Treport_error (%"parse error%")")
				a_file.put_line ("%T%T%Tend")
				a_file.put_line ("%T%Tend")
				from
					i := 1
				until
					i > nb2
				loop
					j := inspect_size * (i - 1)
					k := inspect_size * i - 1
					a_file.put_new_line
					a_file.put_string ("%Tyy_do_error_action_")
					a_file.put_integer (j)
					a_file.put_character ('_')
					a_file.put_integer (k)
					a_file.put_line (" (yy_act: INTEGER)")
					a_file.put_line ("%T%T%T-- Execute error action.")
					a_file.put_line ("%T%Tdo")
					a_file.put_line ("%T%T%Tinspect yy_act")
					k := k.min (nb - 1)
					from
					until
						j > k
					loop
						a_state := states.item (j + 1)
						an_action := a_state.error_action
						if an_action /= Void then
							a_file.put_string ("%T%T%Twhen ")
							a_file.put_integer (a_state.id)
							a_file.put_line (" then")
							a_file.put_string ("%T%T%T%T%T--|#line ")
							if line_pragma then
								a_file.put_integer (an_action.line_nb)
							else
								a_file.put_string ("<not available>")
							end
							a_file.put_string (" %"")
							a_file.put_string (input_filename)
							a_file.put_line ("%"")
							a_file.put_string ("%T%T%T%Tyy_do_error_action_")
							a_file.put_integer (a_state.id)
							a_file.put_new_line
						elseif j = nb - 3 then
								-- End of file expected.
							a_file.put_string ("%T%T%Twhen ")
							a_file.put_integer (a_state.id)
							a_file.put_line (" then")
							a_file.put_line ("%T%T%T%T%T-- End-of-file expected action.")
							a_file.put_line ("%T%T%T%Treport_eof_expected_error")
						end
						j := j + 1
					end
					a_file.put_line ("%T%T%Telse")
					a_file.put_line ("%T%T%T%T%T-- Default action.")
					a_file.put_line ("%T%T%T%Treport_error (%"parse error%")")
					a_file.put_line ("%T%T%Tend")
					a_file.put_line ("%T%Tend")
					i := i + 1
				end
			end
			from
				i := 1
			until
				i > nb
			loop
				a_state := states.item (i)
				an_action := a_state.error_action
				if an_action /= Void then
					a_file.put_new_line
					a_file.put_string ("%Tyy_do_error_action_")
					a_file.put_integer (a_state.id)
					a_file.put_new_line
					a_file.put_string ("%T%T%T--|#line ")
					if line_pragma then
						a_file.put_integer (an_action.line_nb)
					else
						a_file.put_string ("<not available>")
					end
					a_file.put_string (" %"")
					a_file.put_string (input_filename)
					a_file.put_line ("%"")
					a_file.put_line ("%T%Tdo")
					a_file.put_line ("%T%T%Tdebug (%"GEYACC%")")
					a_file.put_string ("%T%T%T%Tstd.error.put_line (%"Executing parser error-code from file '")
					a_file.put_string (input_filename)
					a_file.put_string ("' at line ")
					if line_pragma then
						a_file.put_integer (an_action.line_nb)
					else
						a_file.put_string ("<not available>")
					end
					a_file.put_line ("%")")
					a_file.put_line ("%T%T%Tend")
					a_file.put_line (an_action.action.out)
					a_file.put_line ("%T%Tend")
				end
				i := i + 1
			end
		end

	print_stack_declarations (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print declaration of typed value stacks.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			types: DS_ARRAYED_LIST [PR_TYPE]
			a_type: PR_TYPE
			i, nb: INTEGER
		do
			types := machine.grammar.types
			nb := types.count
			from
				i := 1
			until
				i > nb
			loop
				a_type := types.item (i)
				a_type.print_yyvs_declaration (1, a_file)
				a_file.put_new_line
				i := i + 1
			end
		end

	print_constants (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print code for constants to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string ("%TyyFinal: INTEGER = ")
			a_file.put_integer (yyFinal)
			a_file.put_string ("%N%T%T%T-- Termination state id%
				%%N%N%TyyFlag: INTEGER = ")
			a_file.put_integer (yyFlag)
			a_file.put_string ("%N%T%T%T-- Most negative INTEGER%
				%%N%N%TyyNtbase: INTEGER = ")
			a_file.put_integer (yyNtbase)
			a_file.put_string ("%N%T%T%T-- Number of tokens%
				%%N%N%TyyLast: INTEGER = ")
			a_file.put_integer (yyLast)
			a_file.put_string ("%N%T%T%T-- Upper bound of `yytable' and `yycheck'%
				%%N%N%TyyMax_token: INTEGER = ")
			a_file.put_integer (yyMax_token)
			a_file.put_string ("%N%T%T%T-- Maximum token id%
				%%N%T%T%T-- (upper bound of `yytranslate'.)%
				%%N%N%TyyNsyms: INTEGER = ")
			a_file.put_integer (yyNsyms)
			a_file.put_string ("%N%T%T%T-- Number of symbols%
				%%N%T%T%T-- (terminal and nonterminal)%N")
		end

	print_dummy_feature (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print code for `yy_run_geyacc' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_line ("%Tyy_run_geyacc")
			a_file.put_line ("%T%T%T-- You must run geyacc to regenerate this class.")
			a_file.put_line ("%T%Tdo")
			a_file.put_line ("%T%Tend")
		end

feature {NONE} -- Building

	build_yytranslate
			-- Build `yytranslate'.
		local
			tokens: DS_ARRAYED_LIST [PR_TOKEN]
			i, nb: INTEGER
			token_id: INTEGER
			a_token: PR_TOKEN
		do
			tokens := machine.grammar.tokens
			nb := tokens.count
				-- yyNtbase is the number of tokens in the
				-- grammar plus the extra EOF token (id 0).
			yyNtbase := nb + 1
			yyNsyms := yyNtbase + machine.grammar.variables.count
			from
				i := 1
			until
				i > nb
			loop
				token_id := tokens.item (i).token_id
				if token_id > yyMax_token then
					yyMax_token := token_id
				end
				i := i + 1
			end
			create yytranslate.make_filled (0, 0, yyMax_token)
				-- Initialize all entries for literal tokens
				-- to 2, i.e. the internal token number for
				-- "$undefined.", which represents all invalid
				-- inputs.
			from
				i := 0
			until
				i > yyMax_token
			loop
				yytranslate.put (2, i)
				i := i + 1
			end
				-- The EOF token has id zero.
			yytranslate.put (0, 0)
			from
				i := 1
			until
				i > nb
			loop
				a_token := tokens.item (i)
				yytranslate.put (a_token.id, a_token.token_id)
				i := i + 1
			end
		ensure
			yytranslate_not_void: yytranslate /= Void
		end

	build_yyr1
			-- Build `yyr1'.
		local
			rules: DS_ARRAYED_LIST [PR_RULE]
			i, nb: INTEGER
			a_rule: PR_RULE
		do
			rules := machine.grammar.rules
			nb := rules.count
			create yyr1.make_filled (0, 0, nb)
			from
				i := 1
			until
				i > nb
			loop
				a_rule := rules.item (i)
				yyr1.put (a_rule.lhs.id + yyNtbase, i)
				i := i + 1
			end
		ensure
			yyr1_not_void: yyr1 /= Void
		end

	build_yytypes1
			-- Build `yytypes1'.
		local
			states: DS_ARRAYED_LIST [PR_STATE]
			i, nb: INTEGER
			a_state: PR_STATE
		do
			states := machine.states
			nb := states.count
			create yytypes1.make_filled (0, 0, nb - 1)
			from
				i := 1
			until
				i > nb
			loop
				a_state := states.item (i)
				yytypes1.put (a_state.accessing_symbol.type.id, a_state.id)
				i := i + 1
			end
		ensure
			yytypes1_not_void: yytypes1 /= Void
		end

	build_yytypes2
			-- Build `yytypes2'.
		local
			tokens: DS_ARRAYED_LIST [PR_TOKEN]
			i, nb: INTEGER
			a_token: PR_TOKEN
		do
			tokens := machine.grammar.tokens
			nb := tokens.count
			create yytypes2.make_filled (0, 0, nb)
			yytypes2.put (1, 0)
			from
				i := 1
			until
				i > nb
			loop
				a_token := tokens.item (i)
				yytypes2.put (a_token.type.id, i)
				i := i + 1
			end
		ensure
			yytypes2_not_void: yytypes2 /= Void
		end

	build_action_tables
			-- Build `yydefact', `yydefgoto', `yypact',
			-- `yypgoto', `yytable' and `yycheck'.
		local
			nb_states, nb_variables: INTEGER
			states: DS_ARRAYED_LIST [PR_STATE]
			variables: DS_ARRAYED_LIST [PR_VARIABLE]
			portions: DS_ARRAYED_LIST [PR_PORTION]
			froms, tos: DS_ARRAYED_LIST [INTEGER]
			count, width, lowzero: INTEGER
			a_portion, prev: PR_PORTION
			i, j, k, nb: INTEGER
			ii, nb2: INTEGER
			state_id: INTEGER
			pos, loc: INTEGER
			found: BOOLEAN
		do
			states := machine.states
			nb_states := states.count
			variables := machine.grammar.variables
			nb_variables := variables.count
			create portions.make (nb_states + nb_variables)
			create yydefact.make_filled (0, 0, nb_states - 1)
			from
				i := 1
			until
				i > nb_states
			loop
				put_yydefact (states.item (i), portions)
				i := i + 1
			end
			create yydefgoto.make_filled (0, 0, nb_variables - 1)
			from
				i := 1
			until
				i > nb_variables
			loop
				put_yydefgoto (variables.item (i), portions)
				i := i + 1
			end
			portions.sort (Portion_sorter)
			i := nb_states - 1
			create yypact.make_filled (0, 0, i)
			from
			until
				i < 0
			loop
				yypact.put (yyFlag, i)
				i := i - 1
			end
			i := nb_variables - 1
			create yypgoto.make_filled (0, 0, i)
			from
			until
				i < 0
			loop
				yypgoto.put (yyFlag, i)
				i := i - 1
			end
			ii := Initial_max_table_size
			create yytable.make_filled (0, 0, ii)
			create yycheck.make_filled (0, 0, ii)
			from
			until
				ii < 0
			loop
				yycheck.put (-1, ii)
				ii := ii - 1
			end
			yyLast := -1
				-- Process big chunks first since they are
				-- the most difficult to fit in the tables.
			nb := portions.count
			from
				i := nb
			until
				i < 1
			loop
				a_portion := portions.item (i)
				froms := a_portion.froms
				tos := a_portion.tos
				count := a_portion.count
				width := a_portion.width
				state_id := -1
				if a_portion.is_state then
					from
						j := i + 1
					until
						j > nb
					loop
						prev := portions.item (j)
						if not a_portion.order_is_equal (prev) then
								-- Jump out of the loop.
							j := nb + 1
						elseif a_portion.same_portion (prev) then
							state_id := prev.id
								-- Jump out of the loop.
							j := nb + 1
						else
							j := j + 1
						end
					end
				end
				if state_id < 0 then
					from
						j := lowzero - froms.first
						found := False
					until
						found
					loop
						found := True
						from
							k := 1
						until
							k > count
						loop
							loc := j + froms.item (k)
							if loc > yytable.upper then
								ii := yycheck.upper + 1
								nb2 := loc + Max_table_size_increment
								INTEGER_ARRAY_.resize (yytable, 0, nb2)
								INTEGER_ARRAY_.resize (yycheck, 0, nb2)
								from
								until
									ii > nb2
								loop
									yycheck.put (-1, ii)
									ii := ii + 1
								end
							end
							if yytable.item (loc) /= 0 then
								found := False
									-- Jump out of the loop.
								k := count + 1
							else
								k := k + 1
							end
						end
						if found then
							from
								k := i + 1
							until
								k > nb
							loop
								if portions.item (k).position = j then
									found := False
										-- Jump out of the loop.
									k := nb + 1
								else
									k := k + 1
								end
							end
							if found then
								from
									k := 1
								until
									k > count
								loop
									loc := j + froms.item (k)
									yytable.put (tos.item (k), loc)
									yycheck.put (froms.item (k), loc)
									k := k + 1
								end
								from
								until
									yytable.item (lowzero) = 0
								loop
									lowzero := lowzero + 1
								end
								if loc > yyLast then
									yyLast := loc
								end
								pos := j
							end
						end
						j := j + 1
					end
				else
					pos := yypact.item (state_id)
				end
				a_portion.set_position (pos)
				if a_portion.is_state then
					yypact.put (pos, a_portion.id)
				else
					yypgoto.put (pos, a_portion.id)
				end
				i := i - 1
			end
			yytable := INTEGER_ARRAY_.subarray (yytable, 0, yyLast, 0)
			yycheck := INTEGER_ARRAY_.subarray (yycheck, 0, yyLast, 0)
		ensure
			yydefact_not_void: yydefact /= Void
			yydefgoto_not_void: yydefgoto /= Void
			yypact_not_void: yypact /= Void
			yypgoto_not_void: yypgoto /= Void
			yytable_not_void: yytable /= Void
			yycheck_not_void: yycheck /= Void
		end

	put_yydefact (a_state: PR_STATE; portions: DS_LIST [PR_PORTION])
			-- Decide what to do for each token if seen as
			-- the lookahead token in state `a_state'.
		require
			a_state_not_void: a_state /= Void
			portions_not_void: portions /= Void
			portions_not_full: portions.extendible (1)
		local
			i, j, nb: INTEGER
			action_row: ARRAY [INTEGER]
			nb_tokens, nb_reductions: INTEGER
			reductions: DS_ARRAYED_LIST [PR_REDUCTION]
			lookaheads: DS_ARRAYED_LIST [PR_TOKEN]
			a_reduction: PR_REDUCTION
			shifts: DS_ARRAYED_LIST [PR_STATE]
			errors: DS_ARRAYED_LIST [PR_TOKEN]
			rule_id, default_rule: INTEGER
			a_shift: PR_STATE
			a_symbol: PR_SYMBOL
			no_default: BOOLEAN
			max, count: INTEGER
			froms, tos: DS_ARRAYED_LIST [INTEGER]
			a_portion: PR_PORTION
			state_id: INTEGER
		do
			nb_tokens := machine.grammar.tokens.count
			create action_row.make_filled (0, 0, nb_tokens)
			reductions := a_state.reductions
			nb_reductions := reductions.count
			if a_state.lookahead_needed then
					-- Loop over the reductions available here
					-- which require lookahead. This is where
					-- conflicts are resolved. The loop over
					-- is done in reverse order so that the
					-- last rule considered (i.e. closer to
					-- the beginning of the list `reductions')
					-- that likes a token is the one which
					-- will handle it.
				from
					i := nb_reductions
				until
					i < 1
				loop
					a_reduction := reductions.item (i)
					rule_id := -a_reduction.rule.id
					lookaheads := a_reduction.lookaheads
					nb := lookaheads.count
					from
						j := 1
					until
						j > nb
					loop
						action_row.put (rule_id, lookaheads.item (j).id)
						j := j + 1
					end
					i := i - 1
				end
			end
			shifts := a_state.shifts
			nb := shifts.count
			from
				i := 1
			until
				i > nb
			loop
				a_shift := shifts.item (i)
				a_symbol := a_shift.accessing_symbol
				if a_symbol.is_terminal then
					action_row.put (a_shift.id, a_symbol.id)
						-- Do not use any default reduction
						-- if there is a shift for "error".
						-- (1 is the token id of "error".)
					if a_symbol.id = 1 then
						no_default := True
					end
				end
				i := i + 1
			end
				-- See which tokens are an explicit error in
				-- this state (due to %nonassoc). For them,
				-- record yyFlag as the action.
			errors := a_state.errors
			nb := errors.count
			from
				i := 1
			until
				i > nb
			loop
				action_row.put (yyFlag, errors.item (i).id)
				i := i + 1
			end
				-- Now find the most common reduction and make
				-- it the default action for this state.
			if nb_reductions >= 1 and not no_default then
				if not a_state.lookahead_needed then
					default_rule := reductions.first.rule.id
				else
					from
						i := 1
					until
						i > nb_reductions
					loop
						rule_id := -reductions.item (i).rule.id
						from
							j := 0
						until
							j > nb_tokens
						loop
							if action_row.item (j) = rule_id then
								count := count + 1
							end
							j := j + 1
						end
						if count > max then
							max := count
							default_rule := rule_id
						end
						i := i + 1
					end
						-- Actions which match the default are
						-- replaced with zero, which means
						-- "use the default".
					if max > 0 then
						from
							j := 0
						until
							j > nb_tokens
						loop
							if action_row.item (j) = default_rule then
								action_row.put (0, j)
							end
							j := j + 1
						end
						default_rule := -default_rule
					end
				end
			end
				-- If no default rule has been found, the
				-- default is an error. So replace any action
				-- which says "error' with "use default".
			if default_rule = 0 then
				from
					i := 0
				until
					i > nb_tokens
				loop
					if action_row.item (i) = yyFlag then
						action_row.put (0, i)
					end
					i := i + 1
				end
			end
			state_id := a_state.id
			yydefact.put (default_rule, state_id)
				-- Detailed info is saved for putting
				-- into `yytable' later.
			count := 0
			from
				i := 0
			until
				i > nb_tokens
			loop
				if action_row.item (i) /= 0 then
					count := count + 1
				end
				i := i + 1
			end
			if count /= 0 then
				create froms.make (count)
				create tos.make (count)
				from
					i := 0
				until
					i > nb_tokens
				loop
					if action_row.item (i) /= 0 then
						froms.put_last (i)
						tos.put_last (action_row.item (i))
					end
					i := i + 1
				end
				create a_portion.make_state (a_state.id, froms, tos)
				portions.put_last (a_portion)
			end
		end

	put_yydefgoto (a_variable: PR_VARIABLE; portions: DS_LIST [PR_PORTION])
			-- Figure out what to do after reducing with
			-- each rule, depending on the saved state
			-- from before beginning of parsing the
			-- data that matched this rule.
		require
			a_variable_not_void: a_variable /= Void
			portions_not_void: portions /= Void
			portions_not_full: portions.extendible (1)
		local
			transitions: DS_LINKED_LIST [PR_TRANSITION]
			a_cursor: DS_LINKED_LIST_CURSOR [PR_TRANSITION]
			a_transition: detachable PR_TRANSITION
			state_count: ARRAY [INTEGER]
			default_state: INTEGER
			state_id: INTEGER
			nb_tokens, nb_states: INTEGER
			i, count, max: INTEGER
			not_defaults: ARRAY [detachable PR_TRANSITION]
			froms, tos: DS_ARRAYED_LIST [INTEGER]
			a_portion: PR_PORTION
		do
			transitions := a_variable.transitions
			nb_tokens := machine.grammar.tokens.count
			if transitions.is_empty then
				default_state := -1
			else
				nb_states := machine.states.count
				create state_count.make_filled (0, 0, nb_states - 1)
				a_cursor := transitions.new_cursor
				from
					a_cursor.start
				until
					a_cursor.after
				loop
					state_id := a_cursor.item.target.id
					state_count.put (state_count.item (state_id) + 1, state_id)
					a_cursor.forth
				end
				default_state := -1
				from
					i := 0
				until
					i >= nb_states
				loop
					count := state_count.item (i)
					if count > max then
						max := count
						default_state := i
					end
					i := i + 1
				end
					-- Detailed info is saved for putting
					-- into `yytable' later.
				count := 0
				create not_defaults.make_filled (Void, 0, nb_states - 1)
				from
					a_cursor.start
				until
					a_cursor.after
				loop
					a_transition := a_cursor.item
					if a_transition.target.id /= default_state then
						not_defaults.put (a_transition, a_transition.source.id)
						count := count + 1
					end
					a_cursor.forth
				end
				if count /= 0 then
					create froms.make (count)
					create tos.make (count)
					from
						i := 0
					until
						i >= nb_states
					loop
						a_transition := not_defaults.item (i)
						if a_transition /= Void then
							froms.put_last (a_transition.source.id)
							tos.put_last (a_transition.target.id)
						end
						i := i + 1
					end
					create a_portion.make_symbol (a_variable.id, froms, tos)
					portions.put_last (a_portion)
				end
			end
			yydefgoto.put (default_state, a_variable.id)
		end

feature {NONE} -- Access

	array_size: INTEGER
			-- Maximum size supported for manifest arrays

feature {NONE} -- Constants

	Initial_max_table_size: INTEGER = 500
			-- Initial capacity for `yytable' and `yycheck'

	Max_table_size_increment: INTEGER = 500
			-- Increment when resizing `yytable' and `yycheck'

	Indentation: STRING = "%T%T%T"

	Portion_sorter: DS_BUBBLE_SORTER [PR_PORTION]
			-- Table portion sorter
		local
			a_comparator: KL_COMPARABLE_COMPARATOR [PR_PORTION]
		once
			create a_comparator.make
			create Result.make (a_comparator)
		ensure
			table_portion_sorter_not_void: Result /= Void
		end

	Default_input_filename: STRING = "standard input"
			-- Default input filename

invariant

	machine_not_void: machine /= Void
	input_filename_not_void: input_filename /= Void

end
