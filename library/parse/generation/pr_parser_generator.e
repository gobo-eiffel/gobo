indexing

	description:

		"Parser generators"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_PARSER_GENERATOR

inherit

	PR_PARSER_ENGINE

	KL_IMPORTED_OUTPUT_STREAM_ROUTINES
	KL_IMPORTED_ARRAY_ROUTINES
	UT_IMPORTED_FORMATTERS

creation

	make

feature {NONE} -- Initialization

	make (a_machine: like machine) is
			-- Create a new parser generator
			-- associated with `a_machine'.
		require
			a_machine_not_void: a_machine /= Void
		do
			machine := a_machine
			yyFinal := machine.states.last.id
			yyFlag := -32768
			build_yytranslate
			build_yyr
			build_action_tables
		ensure
			machine_set: machine = a_machine
		end

feature -- Access

	machine: PR_FSM
			-- Associated finite state machine

feature -- Generation

	print_parser (tokens_needed, actions_separated: BOOLEAN; a_file: like OUTPUT_STREAM_TYPE) is
			-- Print code for corresponding parser to `a_file'.
			-- Print the token codes with the parser class text
			-- if `tokens_needed' is true, and the semantic actions
			-- in individual routines if `actions_separated' is true.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		do
			print_eiffel_header (a_file)
			if tokens_needed then
				a_file.put_string ("%Nfeature -- Token codes%N%N")
				print_token_codes (a_file)
			end
			a_file.put_string ("%Nfeature {NONE} -- Implementation%N%N")
			print_build_parser_tables (a_file)
			a_file.put_string ("%Nfeature {NONE} -- Semantic actions%N%N")
			if actions_separated then
				print_separated_actions (a_file)
			else
				print_actions (a_file)
			end
			a_file.put_string ("%Nfeature {NONE} -- Table templates%N%N")
			print_eiffel_tables (a_file)
			print_conversion_routines (a_file)
			a_file.put_string ("%Nfeature {NONE} -- Constants%N%N")
			print_constants (a_file)
			a_file.put_string ("%Nfeature -- User-defined features%N%N")
			print_eiffel_code (a_file)
		end

	print_token_class (class_name, version: STRING; a_file: like OUTPUT_STREAM_TYPE) is
			-- Print class text with token code constants to `a_file'.
			-- `class_name' is the name of the generated class
			-- and `version' is the verrsion number of geyacc.
		require
			class_name_not_void: class_name /= Void
			version_not_void: version /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		do
			a_file.put_string ("indexing%N%N%
				%%Tdescription: %"Parser token codes%"%N%
				%%Tgenerator: %"geyacc version ")
			a_file.put_string (version)
			a_file.put_string ("%"%N%Nclass ")
			a_file.put_string (class_name)
			a_file.put_string ("%N%Nfeature -- Token codes%N%N")
			print_token_codes (a_file)
			a_file.put_string ("%Nend -- class ")
			a_file.put_string (class_name)
			a_file.put_character ('%N')
		end

feature {NONE} -- Generation

	print_token_codes (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print token codes to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		local
			tokens: DS_ARRAYED_LIST [PR_TOKEN]
			a_token: PR_TOKEN
			a_name: STRING
			i, nb: INTEGER
		do
			tokens := machine.grammar.tokens
			nb := tokens.count
				-- Skip the "error" and "$undefined." tokens.
			from i := 3 until i > nb loop
				a_token := tokens.item (i)
				a_name := a_token.name
				if a_name.item (1) /= '%'' then
					a_file.put_character ('%T')
					a_file.put_string (a_name)
					a_file.put_string (": INTEGER is ")
					a_file.put_integer (a_token.token_id)
					a_file.put_character ('%N')
				end
				i := i + 1
			end
		end

	print_eiffel_header (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print user-defined eiffel header to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		local
			i, nb: INTEGER
			eiffel_header: DS_ARRAYED_LIST [STRING]
		do
			eiffel_header := machine.grammar.eiffel_header
			nb := eiffel_header.count
			from i := 1 until i > nb loop
				a_file.put_string (eiffel_header.item (i))
				i := i + 1
			end
		end

	print_eiffel_code (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print user-defined eiffel code to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		local
			eiffel_code: STRING
		do
			eiffel_code := machine.grammar.eiffel_code
			if eiffel_code /= Void then
				a_file.put_string (eiffel_code)
			end
		end

	print_build_parser_tables (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print code for `yy_build_parser_tables' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		do
			a_file.put_string ("%Tyy_build_parser_tables is%N%
				%%T%T%T-- Build parser tables.%N%T%Tdo%N%
				%%T%T%Tyytranslate ?= yytranslate_template%N%
				%%T%T%Tyyr1 ?= yyr1_template%N%
				%%T%T%Tyyr2 ?= yyr2_template%N%
				%%T%T%Tyydefact ?= yydefact_template%N%
				%%T%T%Tyydefgoto ?= yydefgoto_template%N%
				%%T%T%Tyypact ?= yypact_template%N%
				%%T%T%Tyypgoto ?= yypgoto_template%N%
				%%T%T%Tyytable ?= yytable_template%N%
				%%T%T%Tyycheck ?= yycheck_template%N%
				%%T%Tend%N")
		end

	print_eiffel_tables (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print Eiffel code for parser tables to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		do
			print_eiffel_array ("yytranslate_template", yytranslate, a_file)
			a_file.put_character ('%N')
			print_eiffel_array ("yyr1_template", yyr1, a_file)
			a_file.put_character ('%N')
			print_eiffel_array ("yyr2_template", yyr2, a_file)
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

	print_eiffel_array (a_name: STRING; a_table: ARRAY [INTEGER]; a_file: like OUTPUT_STREAM_TYPE) is
			-- Print Eiffel code for `a_table' named `a_name' to `a_file'.
		require
			a_name_not_void: a_name /= Void
			a_table_not_void: a_table /= Void
			zero_based_table: a_table.lower = 0
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		do
			a_file.put_character ('%T')
			a_file.put_string (a_name)
			a_file.put_string (": ANY is%N%
				%%T%T%T-- This is supposed to be %"like FIXED_INTEGER_ARRAY_TYPE%",%N%
				%%T%T%T-- but once functions cannot be declared with anchored types.%N%
				%%T%Tonce%N%T%T%TResult := yyfixed_array (<<%N")
			ARRAY_FORMATTER_.put_integer_array (a_file, a_table, a_table.lower, a_table.upper)
			a_file.put_string (">>)%N%T%Tend%N")
		end

	print_actions (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print code for actions to `a_file'.
			-- Print all actions in one routine.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		local
			i, nb: INTEGER
			rules: DS_ARRAYED_LIST [PR_RULE]
			types: DS_ARRAYED_LIST [PR_TYPE]
			a_rule: PR_RULE
			an_action: STRING
			a_type: PR_TYPE
		do
			a_file.put_string ("%Tyy_do_action (yy_act: INTEGER) is%N%
				%%T%T%T-- Execute semantic action.%N")
			types := machine.grammar.types
			if not types.is_empty then
				a_file.put_string ("%T%Tlocal%N")
				nb := types.count
				from i := 1 until i > nb loop
					types.item (i).print_dollar_dollar_declaration (a_file)
					a_file.put_character ('%N')
					i := i + 1
				end
			end
			a_file.put_string ("%T%Tdo%N%T%T%Tinspect yy_act%N")
			rules := machine.grammar.rules
			nb := rules.count
			from i := 1 until i > nb loop
				a_rule := rules.item (i)
				an_action := a_rule.action.out
				if not an_action.empty then
					a_file.put_string ("when ")
					a_file.put_integer (a_rule.id)
					a_file.put_string (" then%N--|#line ")
					a_file.put_integer (a_rule.line_nb)
					a_file.put_character ('%N')
					a_type := a_rule.lhs.type
					a_type.print_dollar_dollar_initialization (a_file)
					a_file.put_character ('%N')
					a_file.put_string (an_action)
					a_file.put_character ('%N')
					a_type.print_dollar_dollar_finalization (a_file)
					a_file.put_character ('%N')
				end
				i := i + 1
			end
			a_file.put_string ("%T%T%Telse%N%T%T%T%T%T-- No action%N%
				%%T%T%T%Tyyval := yyval_default%N%
				%%T%T%Tend%N%T%Tend%N")
		end

	print_separated_actions (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print code for actions to `a_file'.
			-- Print each action into an individual routine.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		local
			i, nb: INTEGER
			rules: DS_ARRAYED_LIST [PR_RULE]
			a_rule: PR_RULE
			an_action: STRING
			a_type: PR_TYPE
		do
			a_file.put_string ("%Tyy_do_action (yy_act: INTEGER) is%N%
				%%T%T%T-- Execute semantic action.%N%
				%%T%Tdo%N%T%T%Tinspect yy_act%N")
			rules := machine.grammar.rules
			nb := rules.count
			from i := 1 until i > nb loop
				a_rule := rules.item (i)
				an_action := a_rule.action.out
				if not an_action.empty then
					a_file.put_string ("when ")
					a_file.put_integer (a_rule.id)
					a_file.put_string (" then%N--|#line ")
					a_file.put_integer (a_rule.line_nb)
					a_file.put_string ("%N%T")
					a_file.put_string ("yy_do_action_")
					a_file.put_integer (i)
					a_file.put_character ('%N')
				end
				i := i + 1
			end
			a_file.put_string ("%T%T%Telse%N%T%T%T%T%T-- No action%N%
				%%T%T%T%Tyyval := yyval_default%N%
				%%T%T%Tend%N%T%Tend%N")
			from i := 1 until i > nb loop
				a_rule := rules.item (i)
				an_action := a_rule.action.out
				if not an_action.empty then
					a_file.put_string ("%N%Tyy_do_action_")
					a_file.put_integer (i)
					a_file.put_string (" is%N%T%T%T--|#line ")
					a_file.put_integer (a_rule.line_nb)
					a_type := a_rule.lhs.type
					a_file.put_string ("%N%T%Tlocal%N")
					a_type.print_dollar_dollar_declaration (a_file)
					a_file.put_string ("%N%T%Tdo%N")
					a_type.print_dollar_dollar_initialization (a_file)
					a_file.put_character ('%N')
					a_file.put_string (an_action)
					a_file.put_character ('%N')
					a_type.print_dollar_dollar_finalization (a_file)
					a_file.put_string ("%N%T%Tend%N")
				end
				i := i + 1
			end
		end

	print_conversion_routines (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print code for type conversion routines to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		local
			types: DS_ARRAYED_LIST [PR_TYPE]
			i, nb: INTEGER
		do
			types := machine.grammar.types
			if not types.is_empty then
				a_file.put_string ("%Nfeature {NONE} -- Conversion%N%N")
				nb := types.count
				from i := 1 until i > nb loop
					types.item (i).print_conversion_routine (a_file)
					a_file.put_character ('%N')
					i := i + 1
				end
			end
		end

	print_constants (a_file: like OUTPUT_STREAM_TYPE) is
			-- Print code for constants to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		do
			a_file.put_string ("%TyyFinal: INTEGER is ")
			a_file.put_integer (yyFinal)
			a_file.put_string ("%N%T%T%T-- Termination state id%
				%%N%N%TyyFlag: INTEGER is ")
			a_file.put_integer (yyFlag)
			a_file.put_string ("%N%T%T%T-- Most negative INTEGER%
				%%N%N%TyyNtbase: INTEGER is ")
			a_file.put_integer (yyNtbase)
			a_file.put_string ("%N%T%T%T-- Number of tokens%
				%%N%N%TyyLast: INTEGER is ")
			a_file.put_integer (yyLast)
			a_file.put_string ("%N%T%T%T-- Upper bound of `yytable' and `yycheck'%
				%%N%N%TyyMax_token: INTEGER is ")
			a_file.put_integer (yyMax_token)
			a_file.put_string ("%N%T%T%T-- Maximum token id%
				%%N%T%T%T-- (upper bound of `yytranslate'.)%
				%%N%N%TyyNsyms: INTEGER is ")
			a_file.put_integer (yyNsyms)
			a_file.put_string ("%N%T%T%T-- Number of symbols%
				%%N%T%T%T-- (terminal and nonterminal)%N")
		end

feature {NONE} -- Building

	build_yytranslate is
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
			from i := 1 until i > nb loop
				token_id := tokens.item (i).token_id
				if token_id > yyMax_token then
					yyMax_token := token_id
				end
				i := i + 1
			end
			!! yytranslate.make (0, yyMax_token)
				-- Initialize all entries for literal tokens
				-- to 2, i.e. the internal token number for
				-- "$undefined.", which represents all invalid
				-- inputs.
			from i := 0 until i > yyMax_token loop
				yytranslate.put (2, i)
				i := i + 1
			end
				-- The EOF token has id zero.
			yytranslate.put (0, 0)
			from i := 1 until i > nb loop
				a_token := tokens.item (i)
				yytranslate.put (a_token.id, a_token.token_id)
				i := i + 1
			end
		ensure
			yytranslate_not_void: yytranslate /= Void
		end

	build_yyr is
			-- Build `yyr1' and `yyr2'.
		local
			rules: DS_ARRAYED_LIST [PR_RULE]
			i, nb: INTEGER
			a_rule: PR_RULE
		do
			rules := machine.grammar.rules
			nb := rules.count
			!! yyr1.make (0, nb)
			!! yyr2.make (0, nb)
			from i := 1 until i > nb loop
				a_rule := rules.item (i)
				yyr1.put (a_rule.lhs.id + yyNtbase, i)
				yyr2.put (a_rule.rhs.count, i)
				i := i + 1
			end
		ensure
			yyr1_not_void: yyr1 /= Void
			yyr2_not_void: yyr2 /= Void
		end

	build_action_tables is
			-- Build `yydefact', `yydefgoto', `yypact',
			-- `yypgoto', `yytable' and `yycheck'.
		local
			nb_states, nb_variables: INTEGER
			states: DS_ARRAYED_LIST [PR_STATE]
			variables: DS_ARRAYED_LIST [PR_VARIABLE]
			portions: DS_ARRAYED_LIST [PR_PORTION]
			froms, tos: DS_ARRAYED_LIST [INTEGER]
			prev_froms, prev_tos: DS_ARRAYED_LIST [INTEGER]
			count, width, lowzero: INTEGER
			a_portion, prev: PR_PORTION
			i, j, k, nb: INTEGER
			state_id: INTEGER
			pos, loc: INTEGER
			found: BOOLEAN
		do
			states := machine.states
			nb_states := states.count
			variables := machine.grammar.variables
			nb_variables := variables.count
			!! portions.make (nb_states + nb_variables)

			!! yydefact.make (0, nb_states - 1)
			from i := 1 until i > nb_states loop
				put_yydefact (states.item (i), portions)
				i := i + 1
			end

			!! yydefgoto.make (0, nb_variables - 1)
			from i := 1 until i > nb_variables loop
				put_yydefgoto (variables.item (i), portions)
				i := i + 1
			end

			portions.sort (Portion_sorter)

			i := nb_states - 1
			!! yypact.make (0, i)
			from until i < 0 loop
				yypact.put (yyFlag, i)
				i := i - 1
			end

			i := nb_variables - 1
			!! yypgoto.make (0, i)
			from until i < 0 loop
				yypgoto.put (yyFlag, i)
				i := i - 1
			end

			!! yytable.make (0, Initial_max_table_size)
			!! yycheck.make (0, Initial_max_table_size)
			yyLast := -1
				-- Process big chunks first since they are
				-- the most difficult to fit in the tables.
			nb := portions.count
			from i := nb until i < 1 loop
				a_portion := portions.item (i)
				froms := a_portion.froms
				tos := a_portion.tos
				count := a_portion.count
				width := a_portion.width
				state_id := -1
				if a_portion.is_state then
					from j := i + 1 until j > nb loop
						prev := portions.item (j)
						if not a_portion.order_is_equal (prev) then
							j := nb + 1 -- Jump out of the loop.
						elseif a_portion.same_portion (prev) then
							state_id := prev.id
							j := nb + 1 -- Jump out of the loop.
						else
							j := j + 1
						end
					end
				end
				if state_id < 0 then
					from
						j := lowzero - froms.first
						found := False
					until found loop
						found := True
						from k := 1 until k > count loop
							loc := j +  froms.item (k)
							if loc > yytable.upper then
								yytable.resize (0, loc + Max_table_size_increment)
								yycheck.resize (0, loc + Max_table_size_increment)
							end
							if yytable.item (loc) /= 0 then
								found := False
								k := count + 1 -- Jump out of the loop.
							else
								k := k + 1
							end
						end
						if found then
							from k := i + 1 until k > nb loop
								if portions.item (k).position = j then
									found := False
									k := nb + 1 -- Jump out of the loop.
								else
									k := k + 1
								end
							end
							if found then
								loc := j + froms.first
								from k := yyLast + 1 until k >= loc loop
									yycheck.put (-1, k)
									k := k + 1
								end
								from k := 1 until k > count loop
									loc := j + froms.item (k)
									yytable.put (tos.item (k), loc)
									yycheck.put (froms.item (k), loc)
									k := k + 1
								end
								from  until yytable.item (lowzero) = 0 loop
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

	put_yydefact (a_state: PR_STATE; portions: DS_LIST [PR_PORTION]) is
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
			!! action_row.make (0, nb_tokens)
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
				from i := nb_reductions until i < 1 loop
					a_reduction := reductions.item (i)
					rule_id := - a_reduction.rule.id
					lookaheads := a_reduction.lookaheads
					nb := lookaheads.count
					from j := 1 until j > nb loop
						action_row.put (rule_id, lookaheads.item (j).id)
						j := j + 1
					end
					i := i - 1
				end
			end
			shifts := a_state.shifts
			nb := shifts.count
			from i := 1 until i > nb loop
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
			from i := 1 until i > nb loop
				action_row.put (yyFlag, errors.item (i).id)
				i := i + 1
			end
				-- Now find the most common reduction and make
				-- it the default action for this state.
			if nb_reductions >= 1 and not no_default then
				if not a_state.lookahead_needed then
					default_rule := reductions.first.rule.id
				else
					from i := 1 until i > nb_reductions loop
						rule_id := - reductions.item (i).rule.id
						from j := 0 until j > nb_tokens loop
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
						from j := 0 until j > nb_tokens loop
							if action_row.item (j) = default_rule then
								action_row.put (0, j)
							end
							j := j + 1
						end
						default_rule := - default_rule
					end
				end
			end
				-- If no default rule has been found, the
				-- default is an error. So replace any action
				-- which says "error' with "use default".
			if default_rule = 0 then
				from i := 0 until i > nb_tokens loop
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
			from i := 0 until i > nb_tokens loop
				if action_row.item (i) /= 0 then
					count := count + 1
				end
				i := i + 1
			end
			if count /= 0 then
				!! froms.make (count)
				!! tos.make (count)
				from i := 0 until i > nb_tokens loop
					if action_row.item (i) /= 0 then
						froms.put_last (i)
						tos.put_last (action_row.item (i))
					end
					i := i + 1
				end
				!! a_portion.make_state (a_state.id, froms, tos)
				portions.put_last (a_portion)
			end
		end

	put_yydefgoto (a_variable: PR_VARIABLE; portions: DS_LIST [PR_PORTION]) is
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
			a_transition: PR_TRANSITION
			state_count: ARRAY [INTEGER]
			default_state: INTEGER
			state_id: INTEGER
			nb_tokens, nb_states: INTEGER
			i, count, max: INTEGER
			not_defaults: ARRAY [PR_TRANSITION]
			froms, tos: DS_ARRAYED_LIST [INTEGER]
			a_portion: PR_PORTION
		do
			transitions := a_variable.transitions
			nb_tokens := machine.grammar.tokens.count
			if transitions.is_empty then
				default_state := -1
			else
				nb_states := machine.states.count
				!! state_count.make (0, nb_states - 1)
				a_cursor := transitions.new_cursor
				from a_cursor.start until a_cursor.after loop
					state_id := a_cursor.item.target.id
					state_count.put (state_count.item (state_id) + 1, state_id)
					a_cursor.forth
				end
				default_state := -1
				from i := 0 until i >= nb_states loop
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
				!! not_defaults.make (0, nb_states - 1)
				from a_cursor.start until a_cursor.after loop
					a_transition := a_cursor.item
					if a_transition.target.id /= default_state then
						not_defaults.put (a_transition, a_transition.source.id)
						count := count + 1
					end
					a_cursor.forth
				end
				if count /= 0 then
					!! froms.make (count)
					!! tos.make (count)
					from i := 0 until i >= nb_states loop
						a_transition := not_defaults.item (i)
						if a_transition /= Void then
							froms.put_last (a_transition.source.id)
							tos.put_last (a_transition.target.id)
						end
						i := i + 1
					end
					!! a_portion.make_symbol (a_variable.id, froms, tos)
					portions.put_last (a_portion)
				end
			end
			yydefgoto.put (default_state, a_variable.id)
		end

feature {NONE} -- Constants

	Initial_max_table_size: INTEGER is 500
	Max_table_size_increment: INTEGER is 500
			-- Maximum number of items in `yytable' and `yycheck'

	Portion_sorter: DS_BUBBLE_SORTER [PR_PORTION] is
			-- Table portion sorter
		once
			!! Result
		ensure
			table_portion_sorter_not_void: Result /= Void
		end

invariant

	machine_not_void: machine /= Void

end -- class PR_PARSER_GENERATOR
