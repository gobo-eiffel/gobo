indexing

	description:

		"Skeletons for parsers implemented with tables"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class YY_PARSER_SKELETON [G]

inherit

	YY_PARSER [G]

	KL_SHARED_STANDARD_FILES

	KL_SHARED_ARRAY_ROUTINES

feature {NONE} -- Initialization

	make is
			-- Create a new parser.
		do
			!! yyvs.make (1, yyInitial_stack_size)
			!! yyss.make (1, yyInitial_stack_size)
			yy_build_parser_tables
		end

feature -- Parsing

	parse is
			-- Parse input stream.
			-- Set `syntax_error' to True if
			-- parsing has not been successful.
		local
			yystacksize: INTEGER
			yystate: INTEGER
				-- Current state
			yylen: INTEGER
				-- Number of elements in the current rule
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
				error_count := 0
				yy_lookahead_needed := True
				yyerrstatus := 0
				yyvsp := 0
				yyssp := 0
				yystacksize := yyss.count
				yy_parsing_status := yyContinue
				yy_goto := yyNewstate
			until
				yy_parsing_status /= yyContinue
			loop
				inspect yy_goto
				when yyNewstate then
					yyssp := yyssp + 1
					if yyssp > yystacksize then
						yystacksize := yystacksize + yyInitial_stack_size
						yyvs.resize (1, yystacksize)
						yyss.resize (1, yystacksize)
						debug ("GEYACC")
							std.error.put_string ("Stack size increased to ")
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
						if last_token <= yyEof then
								-- This means end of input.
							yychar1 := 0
							debug ("GEYACC")
								std.error.put_string ("Now at end of input.%N")
							end
						else
							yychar1 := yy_translate (last_token)
							debug ("GEYACC")
								std.error.put_string ("Next token is ")
								std.error.put_integer (last_token)
								std.error.put_character ('%N')
							end
						end
						yyn := yyn + yychar1
						if
							(yyn < 0 or yyn > yyLast) or else
							yycheck.item (yyn) /= yychar1
						then
							yy_goto := yyDefault
						else
							yyn := yytable.item (yyn)
								-- `yyn' is what to do for this token type in
								-- this state:
								-- Negative => reduce, -`yyn' is rule number.
								-- Positive => shift, `yyn' is new state.
								-- New state is final state => don't bother to
								--		shift, just return success.
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
								yyvsp := yyvsp + 1
								yyvs.put (last_value, yyvsp)
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
					yylen := yyr2.item (yyn)
					if yylen > 0 then
						yyval := yyvs.item (yyvsp - yylen + 1)
					end
					debug ("GEYACC")
						std.error.put_string ("Reducing via rule #")
						std.error.put_integer (yyn)
						std.error.put_character ('%N')
					end
					yy_do_action (yyn)
					inspect yy_parsing_status
					when yyContinue then
						yyssp := yyssp - yylen
						yyvsp := yyvsp - yylen + 1
						yyvs.put (yyval, yyvsp)
							-- Now "shift" the result of the reduction.
							-- Determine what state that goes to,
							-- based on the state we popped back to 
							-- and the rule number reduced by.
						yyn := yyr1.item (yyn)
						yyss_top := yyss.item (yyssp)
						index := yyn - yyNtbase
						yystate := yypgoto.item (index) + yyss_top
						if
							(yystate >= 0 and yystate <= yyLast) and then
							yycheck.item (yystate) = yyss_top
						then
							yystate := yytable.item (yystate)
						else
							yystate := yydefgoto.item (index)
						end
						yy_goto := yyNewstate
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
							report_error ("parse error")
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
						if
							(yyn < 0 or yyn > yyLast) or else
							yycheck.item (yyn) /= yyTerror
						then
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
								yyvsp := yyvsp + 1
								yyvs.put (last_value, yyvsp)
								yystate := yyn
								yy_goto := yyNewstate
							end
						end
					end
				when yyErrpop then
						-- Pop the current state because it cannot handle
						-- the error token.
					if yyssp = 1 then
						abort
					else
						yyvsp := yyvsp - 1
						yyssp := yyssp - 1
						yystate := yyss.item (yyssp)
						yy_goto := yyErrhandle
					end
				end
			end
			yy_clear_all
		rescue
			abort
			yy_clear_all
		end

feature -- Status report

	syntax_error: BOOLEAN is
			-- Has last parsing been unsuccesful?
		do
			Result := yy_parsing_status /= yyAccepted
		end

feature -- Access

	error_count: INTEGER
			-- Number of errors detected during last parsing

feature {YY_PARSER_ACTION} -- Status report

	is_recovering: BOOLEAN is
			-- Is current parser recovering from a syntax error?
		do
			Result := yyerrstatus /= 0
		end

feature {YY_PARSER_ACTION} -- Element change

	accept is
			-- Stop parsing successfully.
		do
			yy_parsing_status := yyAccepted
		end

	abort is
			-- Abort parsing.
			-- Do not print error message.
		do
			yy_parsing_status := yyAborted
		end

	raise_error is
			-- Raise a syntax error.
			-- Report error using `report_error' and
			-- perform normal error recovery if possible.
		do
			yy_parsing_status := yyError_raised
		end

	recover is
			-- Recover immediately after a parse error.
		do
			yyerrstatus := 0
			yy_parsing_status := yyContinue
		end

	report_error (a_message: STRING) is
			-- Print error message.
			-- (This routine is called by `parse' when it detects
			-- a syntax error. It can be redefined in descendants.)
		do
			std.error.put_string (a_message)
			std.error.put_character ('%N')
		end

	clear_token is
			-- Clear the previous lookahead token.
			-- Used in error-recovery rule actions.
		do
			yy_lookahead_needed := True
		end

feature {NONE} -- Tables

	yytranslate: ARRAY [INTEGER]
	yyr1: ARRAY [INTEGER]
	yyr2: ARRAY [INTEGER]
	yydefact: ARRAY [INTEGER]
	yydefgoto: ARRAY [INTEGER]
	yypact: ARRAY [INTEGER]
	yypgoto: ARRAY [INTEGER]
	yytable: ARRAY [INTEGER]
	yycheck: ARRAY [INTEGER]

feature {NONE} -- Implementation

	yy_translate (i: INTEGER): INTEGER is
			-- Translate lexical token `i' into 
			-- geyacc internal token code.
		require
			i_positive: i >= 0
		do
			if i <= yyMax_token then
				Result := yytranslate.item (i)
			else
				Result := yyNsyms
			end
		end

	yy_do_action (yy_act: INTEGER) is
			-- Execute semantic action.
		deferred
		end

	yy_build_parser_tables is
			-- Build parser tables.
		deferred
		ensure
			yytranslate_not_void: yytranslate /= Void
			yyr1_not_void: yyr1 /= Void
			yyr2_not_void: yyr2 /= Void
			yydefact_not_void: yydefact /= Void
			yydefgoto_not_void: yydefgoto /= Void
			yypact_not_void: yypact /= Void
			yypgoto_not_void: yypgoto /= Void
			yytable_not_void: yytable /= Void
			yycheck_not_void: yycheck /= Void
		end

	yyvs: ARRAY [G]
			-- Semantic value stack

	yyss: ARRAY [INTEGER]
			-- State stack

	yyvsp: INTEGER
			-- Top of semantic value stack

	yyssp: INTEGER
			-- Top of state stack

	yyval: G
			-- Semantic value from action

	yy_lookahead_needed: BOOLEAN
			-- Is a lookahead token needed?

	yyerrstatus: INTEGER
			-- Number of tokens to shift before
			-- error messages enabled

	yy_parsing_status: INTEGER
			-- Parsing status

	yy_clear_all is
			-- Clear temporary objects so that they can be collected
			-- by the garbage collector. This routine is called by
			-- `parse' before exiting.
		local
			default_value: G
			array_routines: KL_ARRAY_ROUTINES [G]
		do
			clear_all
			yyval := default_value
			!! array_routines
			array_routines.clear_all (yyvs)
		end

feature {NONE} -- Constants

	yyNewstate: INTEGER is Unique
	yyDefault: INTEGER is Unique
	yyReduce: INTEGER is Unique
	yyErrlab: INTEGER is Unique
	yyErrhandle: INTEGER is Unique
	yyErrpop: INTEGER is Unique
			-- Goto constants

	yyAccepted: INTEGER is Unique
	yyAborted: INTEGER is Unique
	yyError_raised: INTEGER is Unique
	yyContinue: INTEGER is Unique
			-- Parsing status

	yyTerror: INTEGER is 1
	yyEof: INTEGER is 0
			-- Grammar-independent constants

	yyFinal: INTEGER is deferred end
	yyFlag: INTEGER is deferred end
	yyNtbase: INTEGER is deferred end
	yyLast: INTEGER is deferred end
	yyMax_token: INTEGER is deferred end
	yyNsyms: INTEGER is deferred end
			-- Grammar-dependent constants

	yyInitial_stack_size: INTEGER is 200
			-- Initial size of parser's stacks

invariant

	yyvs_not_void: yyvs /= Void
	yyss_not_void: yyss /= Void
	yytranslate_not_void: yytranslate /= Void
	yyr1_not_void: yyr1 /= Void
	yyr2_not_void: yyr2 /= Void
	yydefact_not_void: yydefact /= Void
	yydefgoto_not_void: yydefgoto /= Void
	yypact_not_void: yypact /= Void
	yypgoto_not_void: yypgoto /= Void
	yytable_not_void: yytable /= Void
	yycheck_not_void: yycheck /= Void

end -- class YY_PARSER_SKELETON
