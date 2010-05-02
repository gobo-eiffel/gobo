note

	description:

		"Skeletons for parsers implemented with tables"

	remark: "To be used with 'geyacc --new_typing'."
	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 2003-2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class YY_PARSER_SKELETON

inherit

	YY_PARSER
		redefine
			clear_all
		end

	YY_PARSER_TOKENS

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

	KL_IMPORTED_SPECIAL_ROUTINES
		export {NONE} all end

	KL_IMPORTED_ARRAY_ROUTINES
		export {NONE} all end

feature {NONE} -- Initialization

	make
			-- Create a new parser.
		do
			yyss := SPECIAL_INTEGER_.make (yyInitial_stack_size)
			yy_create_value_stacks
			yy_build_parser_tables
		end

feature -- Parsing

	parse
			-- Parse input stream.
			-- Set `syntax_error' to True if
			-- parsing has not been successful.
		local
			yystacksize: INTEGER
			yystate: INTEGER
			yyn: INTEGER
			yychar1: INTEGER
			index, yyss_top: INTEGER
			yy_goto: INTEGER
		do
				-- This routine is implemented with a loop whose body
				-- is a big inspect instruction. This is a mere
				-- translation of C gotos into Eiffel. Needless to
				-- say that I'm not very proud of this piece of code.
				-- However I performed some benchmarks and the results
				-- were that this implementation runs amazingly faster
				-- than an alternative implementation with no loop nor
				-- inspect instructions and where every branch of the
				-- old inspect instruction was written in a separate
				-- routine. I think that the performance penalty is due
				-- to the routine call overhead and the depth of the call
				-- stack. Anyway, I prefer to provide you with a big and
				-- ugly but fast parsing routine rather than a nice and
				-- slow version. I hope you won't blame me for that! :-)
			from
				if yy_parsing_status = yySuspended then
					yystacksize := yy_suspended_yystacksize
					yystate := yy_suspended_yystate
					yyn := yy_suspended_yyn
					yychar1 := yy_suspended_yychar1
					index := yy_suspended_index
					yyss_top := yy_suspended_yyss_top
					yy_goto := yy_suspended_yy_goto
					yy_parsing_status := yyContinue
					if yy_goto = yyReduce then
							-- Now "shift" the result of the reduction.
							-- Determine what state that goes to,
							-- based on the state we popped back to
							-- and the rule number reduced by.
						yyn := yyr1.item (yyn)
						yyss_top := yyss.item (yyssp)
						index := yyn - yyNtbase
						yystate := yypgoto.item (index) + yyss_top
						if (yystate >= 0 and yystate <= yyLast) and then yycheck.item (yystate) = yyss_top then
							yystate := yytable.item (yystate)
						else
							yystate := yydefgoto.item (index)
						end
						yy_goto := yyNewstate
					end
				else
					error_count := 0
					yy_lookahead_needed := True
					yyerrstatus := 0
					yy_init_value_stacks
					yyssp := -1
					yystacksize := yyss.count
					yy_parsing_status := yyContinue
					yy_goto := yyNewstate
				end
			until
				yy_parsing_status /= yyContinue
			loop
				inspect yy_goto
				when yyNewstate then
					yyssp := yyssp + 1
					if yyssp >= yystacksize then
						yystacksize := yystacksize + yyInitial_stack_size
						yyss := SPECIAL_INTEGER_.resize (yyss, yystacksize)
						debug ("GEYACC")
							std.error.put_string ("Stack (yyss) size increased to ")
							std.error.put_integer (yystacksize)
							std.error.put_character ('%N')
						end
					end
					debug ("GEYACC")
						std.error.put_string ("Entering state ")
						std.error.put_integer (yystate)
						std.error.put_character ('%N')
					end
					yyss.put (yystate, yyssp)
						-- Do appropriate processing given the current state.
						-- Read a lookahead token if one is needed.
					yyn := yypact.item (yystate)
						-- First try to decide what to do without reference
						-- lookahead token.
					if yyn = yyFlag then
						yy_goto := yyDefault
					else
							-- Not known => get a lookahead token if don't
							-- already have one.
						if yy_lookahead_needed then
							debug ("GEYACC")
								std.error.put_string ("Reading a token%N")
							end
							read_token
							yy_lookahead_needed := False
						end
							-- Convert token to internal form (in `yychar1')
							-- for indexing tables.
						if last_token > yyEof then
							debug ("GEYACC")
								std.error.put_string ("Next token is ")
								std.error.put_integer (last_token)
								std.error.put_character ('%N')
							end
								-- Translate lexical token `last_token' into
								-- geyacc internal token code.
							if last_token <= yyMax_token then
								yychar1 := yytranslate.item (last_token)
							else
								yychar1 := yyNsyms
							end
							yyn := yyn + yychar1
						elseif last_token = yyEof then
								-- This means end of input.
							debug ("GEYACC")
								std.error.put_string ("Now at end of input.%N")
							end
							yychar1 := 0
						else
								-- An error occurred in the scanner.
							debug ("GEYACC")
								std.error.put_string ("Error in scanner.%N")
							end
							error_count := error_count + 1
							yy_do_error_action (yystate)
							abort
								-- Skip next conditional instruction:
							yyn := -1
						end
						if (yyn < 0 or yyn > yyLast) or else yycheck.item (yyn) /= yychar1 then
							yy_goto := yyDefault
						else
							yyn := yytable.item (yyn)
								-- `yyn' is what to do for this token type in
								-- this state:
								-- Negative => reduce, -`yyn' is rule number.
								-- Positive => shift, `yyn' is new state.
								-- New state is final state => don't bother to
								-- shift, just return success.
								-- 0, or most negative number => error.
							if yyn < 0 then
								if yyn = yyFlag then
									yy_goto := yyErrlab
								else
									yyn := -yyn
									yy_goto := yyReduce
								end
							elseif yyn = 0 then
								yy_goto := yyErrlab
							elseif yyn = yyFinal then
								accept
							else
									-- Shift the lookahead token.
								debug ("GEYACC")
									std.error.put_string ("Shifting token ")
									std.error.put_integer (last_token)
									std.error.put_character ('%N')
								end
									-- Discard the token being shifted
									-- unless it is eof.
								if last_token > yyEof then
									yy_lookahead_needed := True
								end
								yy_push_last_value (yychar1)
									-- Count tokens shifted since error;
									-- after three, turn off error status.
								if yyerrstatus /= 0 then
									yyerrstatus := yyerrstatus - 1
								end
								yystate := yyn
								check
									newstate: yy_goto = yyNewstate
								end
							end
						end
					end
				when yyDefault then
						-- Do the default action for the current state.
					yyn := yydefact.item (yystate)
					if yyn = 0 then
						yy_goto := yyErrlab
					else
						yy_goto := yyReduce
					end
				when yyReduce then
						-- Do a reduction. `yyn' is the number of a rule
						-- to reduce with.
					debug ("GEYACC")
						std.error.put_string ("Reducing via rule #")
						std.error.put_integer (yyn)
						std.error.put_character ('%N')
					end
					yy_do_action (yyn)
					inspect yy_parsing_status
					when yyContinue then
							-- Now "shift" the result of the reduction.
							-- Determine what state that goes to,
							-- based on the state we popped back to
							-- and the rule number reduced by.
						yyn := yyr1.item (yyn)
						yyss_top := yyss.item (yyssp)
						index := yyn - yyNtbase
						yystate := yypgoto.item (index) + yyss_top
						if (yystate >= 0 and yystate <= yyLast) and then yycheck.item (yystate) = yyss_top then
							yystate := yytable.item (yystate)
						else
							yystate := yydefgoto.item (index)
						end
						yy_goto := yyNewstate
					when yySuspended then
						yy_suspended_yystacksize := yystacksize
						yy_suspended_yystate := yystate
						yy_suspended_yyn := yyn
						yy_suspended_yychar1 := yychar1
						yy_suspended_index := index
						yy_suspended_yyss_top := yyss_top
						yy_suspended_yy_goto := yy_goto
					when yyError_raised then
							-- Handle error raised explicitly by an action.
						yy_parsing_status := yyContinue
						yy_goto := yyErrlab
					else
							-- Accepted or aborted.
					end
				when yyErrlab then
						-- Detect error.
					if yyerrstatus = 3 then
							-- If just tried and failed to reuse lookahead
							-- token after an error, discard it. Return
							-- failure if at end of input.
						if last_token <= yyEof then
							abort
						else
							debug ("GEYACC")
								std.error.put_string ("Discarding token ")
								std.error.put_integer (last_token)
								std.error.put_character ('%N')
							end
							yy_lookahead_needed := True
							yy_goto := yyErrhandle
						end
					else
						if yyerrstatus = 0 then
								-- If not already recovering from an error,
								-- report this error.
							error_count := error_count + 1
							yy_do_error_action (yystate)
						end
						yyerrstatus := 3
						yy_goto := yyErrhandle
					end
				when yyErrhandle then
						-- Handle error.
					yyn := yypact.item (yystate)
					if yyn = yyFlag then
						yy_goto := yyErrpop
					else
						yyn := yyn + yyTerror
						if (yyn < 0 or yyn > yyLast) or else yycheck.item (yyn) /= yyTerror then
							yy_goto := yyErrpop
						else
							yyn := yytable.item (yyn)
							if yyn < 0 then
								if yyn = yyFlag then
									yy_goto := yyErrpop
								else
									yyn := -yyn
									yy_goto := yyReduce
								end
							elseif yyn = 0 then
								yy_goto := yyErrpop
							elseif yyn = yyFinal then
								accept
							else
								yy_push_error_value
								yystate := yyn
								yy_goto := yyNewstate
							end
						end
					end
				when yyErrpop then
						-- Pop the current state because it cannot handle
						-- the error token.
					if yyssp = 0 then
						abort
					else
						yy_pop_last_value (yystate)
						yyssp := yyssp - 1
						yystate := yyss.item (yyssp)
						yy_goto := yyErrhandle
					end
				end
			end
			if yy_parsing_status /= yySuspended then
				yy_clear_all
			end
		rescue
			debug ("GEYACC")
				std.error.put_line ("Entering rescue clause of parser")
			end
			abort
			yy_clear_all
		end

feature -- Status report

	syntax_error: BOOLEAN
			-- Has last parsing been unsuccesful?
			-- This query may return false if errors have been recovered.
			-- Note that the result of this query is undefined within
			-- the calll to `parse', e.g. when executing semantic actions.
		do
			Result := yy_parsing_status = yyAborted
		end

	is_suspended: BOOLEAN
			-- Has parsing been suspended?
			-- The next call to `parse' will resume parsing in the state
			-- where the parser was when it was suspended. Note that a call
			-- to `abort' or `accept' will force `parse' to parse from scratch.
			-- Also, note that the result of this query is undefined within
			-- the calll to `parse', e.g. when executing semantic actions.
		do
			Result := yy_parsing_status = yySuspended
		end

feature -- Access

	error_count: INTEGER
			-- Number of errors detected during last parsing

feature -- Basic operations

	accept
			-- Stop parsing successfully.
		do
			yy_parsing_status := yyAccepted
		end

	abort
			-- Abort parsing.
			-- Do not print error message.
		do
			yy_parsing_status := yyAborted
		end

	clear_all
			-- Clear temporary objects so that they can be collected
			-- by the garbage collector. (This routine is called by
			-- `parse' before exiting. It can be redefined in descendants.)
			-- Clear internal stacks by default.
		do
			clear_stacks
		end

	clear_stacks
			-- Clear objects in internal stacks so that they can
			-- be collected by the garbage collector.
		do
			yy_clear_value_stacks
		end

feature {YY_PARSER_ACTION} -- Basic operations

	suspend
			-- Suspend parsing.
			-- The next call to `parse' will resume parsing in the state
			-- where the parser was when it was suspended. Note that a call
			-- to `abort' or `accept' will force `parse' to parse from scratch.
		do
			yy_parsing_status := yySuspended
		end

	raise_error
			-- Raise a syntax error.
			-- Report error using the error action %error associated
			-- with current parsing state or `report_error' by default,
			-- and perform normal error recovery if possible.
		do
			yy_parsing_status := yyError_raised
		end

	recover
			-- Recover immediately after a parse error.
		do
			yyerrstatus := 0
			yy_parsing_status := yyContinue
		end

	report_error (a_message: STRING)
			-- Print error message.
			-- (This routine is called by default by `parse' when it
			-- detects a syntax error and there is no error action
			-- %error available. It can be redefined in descendants.)
		do
			std.error.put_string (a_message)
			std.error.put_new_line
		end

	report_eof_expected_error
			-- Report that an end-of-file is expected.
			-- (This routine is called by default by `parse' when it detects
			-- such syntax error and can be redefined in descendants.)
		do
			report_error ("parse error")
		end

	clear_token
			-- Clear the previous lookahead token.
			-- Used in error-recovery rule actions.
		do
			yy_lookahead_needed := True
		end

feature {YY_PARSER_ACTION} -- Status report

	is_recovering: BOOLEAN
			-- Is current parser recovering from a syntax error?
		do
			Result := yyerrstatus /= 0
		end

	is_expected_token (a_token: INTEGER): BOOLEAN
			-- Is `a_token' a possible input at this stage of parsing?
			-- (This routine can be called from one of the error actions
			-- %error or from `report_error' in order to find out what
			-- were the expected tokens when the error occurred.)
		require
			a_token_positive: a_token >= 0
		local
			yystate: INTEGER
			yyn: INTEGER
			yychar1: INTEGER
		do
			if yyssp >= 0 then
				yystate := yyss.item (yyssp)
				yyn := yypact.item (yystate)
				if yyn = yyFlag then
						-- Do the default action for the current state.
					yyn := yydefact.item (yystate)
					if yyn /= 0 then
							-- Reduce.
						Result := True
					else
							-- Error.
						Result := False
					end
				else
					if a_token = yyEof then
						yychar1 := 0
					else
							-- Translate lexical token `a_token' into
							-- geyacc internal token code.
						if a_token <= yyMax_token then
							yychar1 := yytranslate.item (a_token)
						else
							yychar1 := yyNsyms
						end
						yyn := yyn + yychar1
					end
					if (yyn < 0 or yyn > yyLast) or else yycheck.item (yyn) /= yychar1 then
							-- Do the default action for the current state.
						yyn := yydefact.item (yystate)
						if yyn /= 0 then
								-- Reduce.
							Result := True
						else
								-- Error.
							Result := False
						end
					else
						yyn := yytable.item (yyn)
							-- `yyn' is what to do for this token type in
							-- this state:
							-- Negative => reduce, -`yyn' is rule number.
							-- Positive => shift, `yyn' is new state.
							-- New state is final state => don't bother to
							-- shift, just return success.
							-- 0, or most negative number => error.
						if yyn < 0 then
							if yyn /= yyFlag then
									-- Reduce.
								Result := True
							else
									-- Error.
								Result := False
							end
						elseif yyn = yyFinal then
								-- Accept.
							Result := True
						elseif yyn /= 0 then
								-- Shift.
							Result := True
						else
								-- Error.
							Result := False
						end
					end
				end
			else
					-- Unknown state.
				Result := False
			end
		end

feature {YY_PARSER_ACTION} -- Access

	expected_tokens: ARRAY [INTEGER]
			-- List of token codes that are a possible input at this stage
			-- of parsing. (This routine can be called from the error actions
			-- %error or from `report_error' in order to build a meaningful
			-- error message.)
		local
			i, nb: INTEGER
			t: ARRAY [INTEGER]
			j: INTEGER
		do
			nb := yyMax_token
			create t.make (1, nb + 1)
			from
			until
				i > nb
			loop
				if is_expected_token (i) then
					j := j + 1
					t.put (i, j)
				end
				i := i + 1
			end
			create Result.make (1, j)
			from
				i := 1
			until
				i > j
			loop
				Result.put (t.item (i), i)
				i := i + 1
			end
		ensure
			expected_tokens_not_void: Result /= Void
		end

feature {NONE} -- Tables

	yytranslate: SPECIAL [INTEGER]
			-- Mapping between lex token numbers and
			-- yacc internal token numbers

	yyr1: SPECIAL [INTEGER]
			-- Symbol number of symbol that each rule derives
			-- (i.e. left-hand-side of the rule), indexed by
			-- rule id

	yydefact: SPECIAL [INTEGER]
			-- Default rule to reduce in each state,
			-- when `yytable' doesn't specify something
			-- else to do. 0 means the default is an
			-- error. Indexed by state id

	yydefgoto: SPECIAL [INTEGER]
			-- Default state to go to after a reduction
			-- of a rule that generates a variable,
			-- except when `yytable' specifies something
			-- else to do. Indexed by variable id - nb_tokens

	yypact: SPECIAL [INTEGER]
			-- Index in `yytable' of the portion describing
			-- a state, indexed by state id. The lookahead
			-- token's type is used to index that portion
			-- to find out what to do. If the value in `yytable'
			-- is positive, we shift the token and go to that
			-- state. If the value is negative, it is minus
			-- a rule number to reduce by. If the value is
			-- zero, the default action from `yydefact' for
			-- that state is used.

	yypgoto: SPECIAL [INTEGER]
			-- Index in `yytable' of the portion describing
			-- what to do after reducing a rule that derives
			-- a variable, indexed by variable id - nb_tokens.
			-- This portion is indexed by the parser state
			-- number `s' as of before the text for this
			-- nonterminal was read. The value from `yytable'
			-- is the state to go to if the corresponding
			-- value in `yycheck' is `s'.

	yytable: SPECIAL [INTEGER]
			-- Filled with portions for different uses, found
			-- via `yypact' and `yypgoto'

	yycheck: SPECIAL [INTEGER]
			-- Array indexed in parallel with `yytable'. It
			-- indicates, in a roundabout way, the bounds of
			-- the portion you are trying to examine. Suppose
			-- that the portion of `yytable' starts at index
			-- `p' and the index to be examined within the
			-- portion is `i'. Then if `yycheck.item (p+i) /= i',
			-- `i' is outside the bounds of what is actually
			-- allocated, and the default (from `yydefact'
			-- or `yydefgoto') should be used. Otherwise,
			-- `yytable.item (p+i)' should be used.

	yytypes1: SPECIAL [INTEGER]
			-- Array indexed by state id containing the type id
			-- of the accessing symbol associated with this state

	yytypes2: SPECIAL [INTEGER]
			-- Array indexed by internal token id (from 0 to yyNtbase-1)
			-- containing the type id of the corresponding token

feature {NONE} -- Suspended state

	yy_suspended_yystacksize: INTEGER
			-- Local variable of `parse' to be remembered
			-- when parsing has been suspended

	yy_suspended_yystate: INTEGER
			-- Local variable of `parse' to be remembered
			-- when parsing has been suspended

	yy_suspended_yyn: INTEGER
			-- Local variable of `parse' to be remembered
			-- when parsing has been suspended

	yy_suspended_yychar1: INTEGER
			-- Local variable of `parse' to be remembered
			-- when parsing has been suspended

	yy_suspended_index: INTEGER
			-- Local variable of `parse' to be remembered
			-- when parsing has been suspended

	yy_suspended_yyss_top: INTEGER
			-- Local variable of `parse' to be remembered
			-- when parsing has been suspended

	yy_suspended_yy_goto: INTEGER
			-- Local variable of `parse' to be remembered
			-- when parsing has been suspended

feature {NONE} -- Implementation

	yy_do_action (yy_act: INTEGER)
			-- Execute semantic action.
		deferred
		end

	yy_do_error_action (yy_act: INTEGER)
			-- Execute error action.
		deferred
		end

	yy_build_parser_tables
			-- Build parser tables.
		deferred
		ensure
			yytranslate_not_void: yytranslate /= Void
			yyr1_not_void: yyr1 /= Void
			yydefact_not_void: yydefact /= Void
			yydefgoto_not_void: yydefgoto /= Void
			yypact_not_void: yypact /= Void
			yypgoto_not_void: yypgoto /= Void
			yytable_not_void: yytable /= Void
			yycheck_not_void: yycheck /= Void
		end

	yy_create_value_stacks
			-- Create value stacks.
		deferred
		end

	yy_init_value_stacks
			-- Initialize value stacks.
		deferred
		end

	yy_clear_value_stacks
			-- Clear objects in semantic value stacks so that
			-- they can be collected by the garbage collector.
		deferred
		end

	yy_push_last_value (yychar1: INTEGER)
			-- Push semantic value associated with token `last_token'
			-- (with internal id `yychar1') on top of corresponding
			-- value stack.
		require
			yychar1_large_enough: yychar1 >= 0
			yychar1_small_enough: yychar1 < yyNtbase
		deferred
		end

	yy_push_error_value
			-- Push semantic value associated with token 'error'
			-- on top of corresponding value stack.
		deferred
		end

	yy_pop_last_value (yystate: INTEGER)
			-- Pop semantic value from stack when in state `yystate'.
		deferred
		end

	yyfixed_array (an_array: ARRAY [INTEGER]): SPECIAL [INTEGER]
			-- Zero-based array containing items of `an_array'
		require
			an_array_not_void: an_array /= Void
		do
			Result := SPECIAL_INTEGER_.to_special (an_array)
		ensure
			array_not_void: Result /= Void
			count_set: Result.count = an_array.count
--			same_items: forall i in 0 .. (an_array.count - 1), Result.item (i) = an_array.item (an_array.lower + i)
		end

	yyarray_subcopy (an_array: ARRAY [INTEGER]; other: ARRAY [INTEGER]; start_pos, end_pos, index_pos: INTEGER)
			-- Copy items of `other' within bounds `start_pos' and `end_pos'
			-- to `an_array' starting at index `index_pos'.
		require
			an_array_not_void: an_array /= Void
			other_not_void: other /= Void
			not_same: an_array /= other
			start_pos_large_enough: start_pos >= other.lower
			end_pos_small_enough: end_pos <= other.upper
			valid_bounds: start_pos <= end_pos + 1
			index_pos_large_enough: index_pos >= an_array.lower
			enough_space: (an_array.upper - index_pos) >= (end_pos - start_pos)
		do
			INTEGER_ARRAY_.subcopy (an_array, other, start_pos, end_pos, index_pos)
		ensure
--			copied: forall i in 0 .. (end_pos - start_pos), an_array.item (index_pos + i) = other.item (start_pos + i)
		end

	yyss: SPECIAL [INTEGER]
			-- State stack

	yyssp: INTEGER
			-- Top of state stack

	yy_lookahead_needed: BOOLEAN
			-- Is a lookahead token needed?

	yyerrstatus: INTEGER
			-- Number of tokens to shift before
			-- error messages enabled

	yy_parsing_status: INTEGER
			-- Parsing status

	yy_clear_all
			-- Clear temporary objects so that they can be collected
			-- by the garbage collector. This routine is called by
			-- `parse' before exiting.
		do
			clear_all
		end

feature {NONE} -- Constants

	yyNewstate: INTEGER = 1
			-- Goto constant

	yyDefault: INTEGER = 2
			-- Goto constant

	yyReduce: INTEGER = 3
			-- Goto constant

	yyErrlab: INTEGER = 4
			-- Goto constant

	yyErrhandle: INTEGER = 5
			-- Goto constant

	yyErrpop: INTEGER = 6
			-- Goto constant

	yyAccepted: INTEGER = 101
			-- Parsing status

	yyAborted: INTEGER = 102
			-- Parsing status

	yyError_raised: INTEGER = 103
			-- Parsing status

	yyContinue: INTEGER = 104
			-- Parsing status

	yySuspended: INTEGER = 105
			-- Parsing status

	yyTerror: INTEGER = 1
			-- Grammar-independent constant

	yyEof: INTEGER = 0
			-- Grammar-independent constant

	yyFinal: INTEGER
			-- Termination state id
		deferred
		end

	yyFlag: INTEGER
			-- Most negative INTEGER
		deferred
		end

	yyNtbase: INTEGER
			-- Number of tokens
		deferred
		end

	yyLast: INTEGER
			-- Upper bound of `yytable' and `yycheck'
		deferred
		end

	yyMax_token: INTEGER
			-- Maximum token id
			-- (upper bound of `yytranslate'.)
		deferred
		end

	yyNsyms: INTEGER
		deferred
		end
			-- Number of symbols
			-- (terminal and nonterminal)

	yyInitial_stack_size: INTEGER = 200
			-- Initial size of parser's stacks

	yyInitial_yyvs_size: INTEGER = 10
			-- Initial size of parser's stacks

	yyDummy: INTEGER = 2147483647
			-- To be inserted in manifest arrays
			-- in order to make SE 2.1b1 happy

invariant

	yyss_not_void: yyss /= Void
	yytranslate_not_void: yytranslate /= Void
	yyr1_not_void: yyr1 /= Void
	yytypes1_not_void: yytypes1 /= Void
	yytypes2_not_void: yytypes2 /= Void
	yydefact_not_void: yydefact /= Void
	yydefgoto_not_void: yydefgoto /= Void
	yypact_not_void: yypact /= Void
	yypgoto_not_void: yypgoto /= Void
	yytable_not_void: yytable /= Void
	yycheck_not_void: yycheck /= Void

end
